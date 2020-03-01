import func Foundation.sleep

typealias Initiative<T: Collection> = [T.Index]

struct Encounter {
    typealias Token = Character
    typealias Initiative = EscapeFromFlavortown.Initiative<[Token]>

    let room: Room
    var tokens: [Token]
    
    mutating func resolve() {
        var tokenIndexTurnQueue = rollInitiative()
        while tokenIndexTurnQueue.count > 1 {
            let tokenIndex = tokenIndexTurnQueue.removeFirst()
            if let turn = Turn(room: room, token: tokens[tokenIndex], tokens: tokens.removing(at: tokenIndex)[...]) {
                precondition(turn.tokens.count == tokens.count - 1)
                tokens = Array(turn.tokens).inserting(turn.token, at: tokenIndex)
                tokenIndexTurnQueue.append(tokenIndex)
            }
        }
        let winner = tokenIndexTurnQueue.first.map { tokens[$0] }
        if let winner = winner {
            print("Winner: \(winner.name)")
            print("\(winner.background)")
        }
    }

    private func rollInitiative() -> Initiative {
        print("Rolling initiative")
        let initiative = tokens.rollInitiative { token in
            let roll = 1.d(20) + token.attributes.dexterity.modifier
            print("\(token.name): \(roll)")
            return roll
        }
        print("------------------")
        return initiative
    }
}

extension Array where Element == Encounter.Token {
    func rollInitiative(by: (Encounter.Token) -> Int) -> Encounter.Initiative {
        return indices.map { (index: $0, roll: by(self[$0])) }
            .sorted { $0.roll > $1.roll }
            .map { $0.index }
    }
}

extension Encounter {
    struct Turn {
        let room: Room
        var token: Token
        var tokens: ArraySlice<Token>
        var optionBuilders = [\Turn.attack, \.move, \.pass]

        init?(room: Room, token: Token, tokens: ArraySlice<Token>) {
            guard token.hitPoints > 0 else { return nil }

            self.room = room
            self.token = token
            self.tokens = tokens

            resolve()
        }

        private mutating func resolve() {
            print("\(token.name)'s turn!")
            print(tokens.map {
                [
                    $0.name,
                    $0.isBloodied ? "(bloodied)" : nil,
                    "[\($0.location.distance(to: token.location, in: room)) feet away]"
                    ].compactMap { $0 }.joined(separator: " ")
            }.joined(separator: "\n"))

            var options = optionBuilders.compactMap { self[keyPath: $0] }
            while options.count > 1 {
                let selection = select("\(token.name), what will you do?", options: Array(options.indices)) { options[$0].name }
                optionBuilders.remove(at: selection)
                options[selection].perform(&self)
                options = optionBuilders.compactMap { self[keyPath: $0] }
            }
        }

        struct Option {
            let name: String
            let perform: (inout Turn) -> Void
        }

        private var attack: Option? {
            let targetIndices = tokens.indices.filter { tokens[$0].hitPoints > 0 }
            guard !targetIndices.isEmpty else { return nil }

            return Option(name: "Attack") { turn in
                let targetIndex = select("Who would you like to attack?", options: targetIndices) {
                    turn.tokens[$0].name
                }
                turn.token.attack(&turn.tokens[targetIndex], with: turn.token.equippedWeapon)
                sleep(1)
            }
        }

        private var move: Option? {
            return Option(name: "Move") { turn in
                enum MoveOption: String, CaseIterable {
                    case intoRangedRange = "Into ranged range"
                    case intoMeleeRange = "Into melee range"
                    case away = "Away"
                    case cancel = "Cancel"
                }
                let move = select(options: MoveOption.allCases) { $0.rawValue }
                switch move {
                case .cancel:
                    return
                case .intoRangedRange:
                    let target = select("\(move.rawValue) of?", options: Array(turn.tokens.indices)) { turn.tokens[$0].name }
                    print("You run into ranged range of \(turn.tokens[target].name).")
                case .intoMeleeRange:
                    let target = select("\(move.rawValue) of?", options: Array(turn.tokens.indices)) { turn.tokens[$0].name }
                    print("You run into melee range of \(turn.tokens[target].name).")
                case .away:
                    print("You run away like a bitch.")
                }
                sleep(1)
            }
        }

        private var pass: Option? {
            return Option(name: "Pass") { $0.optionBuilders.removeAll() }
        }
    }
}
