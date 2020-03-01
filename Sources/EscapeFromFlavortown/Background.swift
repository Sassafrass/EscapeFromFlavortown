struct Background {
    enum Kind: CaseIterable {
        case merchant, cityGuard, bandit, diplomat
    }

    enum PersonalityTrait: CaseIterable {
        case one, two, three, four, five, six, seven, eight
    }

    enum Ideal: CaseIterable {
        case one, two, three, four, five, six
    }

    enum Bond: CaseIterable {
        case one, two, three, four, five, six
    }

    enum Flaw: CaseIterable {
        case one, two, three, four, five, six
    }

    let kind: Kind
    let _personalityTrait = PersonalityTrait.allCases.randomElement()!
    let _ideal = Ideal.allCases.randomElement()!
    let _bond = Bond.allCases.randomElement()!
    let _flaw = Flaw.allCases.randomElement()!

    var feature: Feature {
        switch kind {
        case .merchant: return Feature(
            title: "Guild membership",
            description: "As an established and respected member of a guild, you can rely on certain benefits that membership provides. Your fellow guild members will provide you with lodging and food if necessary, and pay for your funeral if needed. In some cities and towns, a guildhall offers a central place to meet other members of your profession, which can be a good place to meet potential patrons, allies, or hirelings.")
        case .cityGuard: return Feature(
            title: "Watcher's eye",
            description: "Your experience in enforcing the law, and dealing with lawbreakers, gives you a feel for local laws and criminals. You can easily find the local outpost of the watch or a similar organization, and just as easily pick out the dens of criminal activity in a community, although you're more likely to be welcome in the former locations rather than the latter.")
        case .bandit: return Feature(
            title: "Underworld access",
            description: "You have a reliable and trustworthy contact who acts as your liaison to a network of other criminals. You know how to get access to hideouts and other nefarious lodgings with the purpose of hiding from the watch or other enemies.")
        case .diplomat: return Feature(
            title: "Court functionary",
            description: "Your knowledge of how bureaucracies function lets you gain access to the records and inner workings of any noble court or government you encounter. You know who the movers and shakers are, whom to go to for the favors you seek, and what the current intrigues of interest in the group are.")
        }
    }

    var personalityTrait: String {
        switch (kind, _personalityTrait) {
        case (.merchant, .one): return "I believe that anything worth doing is worth doing right. I can't help it—I'm a perfectionist."
        case (.merchant, .two): return "I'm a snob who looks down on those who can't appreciate fine art."
        case (.merchant, .three): return "I always want to know how things work and what makes people tick."
        case (.merchant, .four): return "I'm full of witty aphorisms and have a proverb for every occasion."
        case (.merchant, .five): return "I'm rude to people who lack my commitment to hard work and fair play."
        case (.merchant, .six): return "I like to talk at length about my profession."
        case (.merchant, .seven): return "I don't part with my money easily and will haggle tirelessly to get the best deal possible."
        case (.merchant, .eight): return "I'm well known for my work, and I want to make sure everyone appreciates it. I'm always taken aback when people haven't heard of me."
        case (.cityGuard, .one): return "I'm always polite and respectful."
        case (.cityGuard, .two): return "I'm haunted by memories of war. I can't get the images of violence out of my mind."
        case (.cityGuard, .three): return "I've lost too many friends, and I'm slow to make new ones."
        case (.cityGuard, .four): return "I'm full of inspiring and cautionary tales from my military experience relevant to almost every combat situation."
        case (.cityGuard, .five): return "I can stare down a hell hound without flinching."
        case (.cityGuard, .six): return "I enjoy being strong and like breaking things."
        case (.cityGuard, .seven): return "I have a crude sense of humor."
        case (.cityGuard, .eight): return "I face problems head-on. A simple, direct solution is the best path to success."
        case (.bandit, .one): return "I always have a plan for when things go wrong."
        case (.bandit, .two): return "I am always calm, no matter what the situation. I never raise my voice or let my emotions control me."
        case (.bandit, .three): return "The first thing I do in a new place is note the locations of everything valuable—or where such things could be hidden."
        case (.bandit, .four): return "I would rather make a new friend than a new enemy."
        case (.bandit, .five): return "I am incredibly slow to trust. Those who seem the fairest often have the most to hide."
        case (.bandit, .six): return "I don't pay attention to the risks in a situation. Never tell me the odds."
        case (.bandit, .seven): return "The best way to get me to do something is to tell me I can't do it."
        case (.bandit, .eight): return "I blow up at the slightest insult."
        case (.diplomat, .one): return "My eloquent flattery makes everyone I talk to feel like the most wonderful and important person in the world."
        case (.diplomat, .two): return "The common folk love me for my kindness and generosity."
        case (.diplomat, .three): return "No one could doubt by looking at my regal bearing that I am a cut above the unwashed masses."
        case (.diplomat, .four): return "I take great pains to always look my best and follow the latest fashions."
        case (.diplomat, .five): return "I don't like to get my hands dirty, and I won't be caught dead in unsuitable accommodations."
        case (.diplomat, .six): return "Despite my noble birth, I do not place myself above other folk. We all have the same blood."
        case (.diplomat, .seven): return "My favor, once lost, is lost forever."
        case (.diplomat, .eight): return "If you do me an injury, I will crush you, ruin your name, and salt your fields."
        }
    }

    var ideal: String {
        switch (kind, _ideal) {
        case (.merchant, .one): return "Community. It is the duty of all civilized people to strengthen the bonds of community and the security of civilization."
        case (.merchant, .two): return "Generosity. My talents were given to me so that I could use them to benefit the world."
        case (.merchant, .three): return "Freedom. Everyone should be free to pursue his or her own livelihood."
        case (.merchant, .four): return "Greed. I'm only in it for the money."
        case (.merchant, .five): return "People. I'm committed to the people I care about, not to ideals."
        case (.merchant, .six): return "Aspiration. I work hard to be the best there is at my craft."
        case (.cityGuard, .one): return "Greater Good. Our lot is to lay down our lives in defense of others."
        case (.cityGuard, .two): return "Responsibility. I do what I must and obey just authority."
        case (.cityGuard, .three): return "Independence. When people follow orders blindly, they embrace a kind of tyranny."
        case (.cityGuard, .four): return "Might. In life as in war, the stronger force wins."
        case (.cityGuard, .five): return "Live and Let Live. Ideals aren't worth killing over or going to war for."
        case (.cityGuard, .six): return "Nation. My city, nation, or people are all that matter."
        case (.bandit, .one): return "Honor. I don't steal from others in the trade."
        case (.bandit, .two): return "Freedom. Chains are meant to be broken, as are those who would forge them."
        case (.bandit, .three): return "Charity. I steal from the wealthy so that I can help people in need."
        case (.bandit, .four): return "Greed. I will do whatever it takes to become wealthy."
        case (.bandit, .five): return "People. I'm loyal to my friends, not to any ideals, and everyone else can take a trip down the Styx for all I care."
        case (.bandit, .six): return "Redemption. There's a spark of good in everyone."
        case (.diplomat, .one): return "Respect. Respect is due to me because of my position, but all people regardless of station deserve to be treated with dignity."
        case (.diplomat, .two): return "Responsibility. It is my duty to respect the authority of those above me, just as those below me must respect mine."
        case (.diplomat, .three): return "Independence. I must prove that I can handle myself without coddling from my family."
        case (.diplomat, .four): return "Power. If I can attain more power, no one will tell me what to do."
        case (.diplomat, .five): return "Family. Blood runs thicker than water."
        case (.diplomat, .six): return "Noble Obligation. It is my duty to protect and care for the people beneath me."
        }
    }

    var bond: String {
        switch (kind, _bond) {
        case (.merchant, .one): return "The workshop where I learned my trade is the most important place in the world to me."
        case (.merchant, .two): return "I created a great work for someone, and then found them unworthy to receive it. I'm still looking for someone worthy."
        case (.merchant, .three): return "I owe my guild a great debt for forging me into the person I am today."
        case (.merchant, .four): return "I pursue wealth to secure someone's love."
        case (.merchant, .five): return "One day I will return to my guild and prove that I am the greatest artisan of them all."
        case (.merchant, .six): return "I will get revenge on the evil forces that destroyed my place of business and ruined my livelihood."
        case (.cityGuard, .one): return "I would still lay down my life for the people I served with."
        case (.cityGuard, .two): return "Someone saved my life on the battlefield. To this day, I will never leave a friend behind."
        case (.cityGuard, .three): return "My honor is my life."
        case (.cityGuard, .four): return "I'll never forget the crushing defeat my company suffered or the enemies who dealt it."
        case (.cityGuard, .five): return "Those who fight beside me are those worth dying for."
        case (.cityGuard, .six): return "I fight for those who cannot fight for themselves."
        case (.bandit, .one): return "I'm trying to pay off an old debt I owe to a generous benefactor."
        case (.bandit, .two): return "My ill-gotten gains go to support my family."
        case (.bandit, .three): return "Something important was taken from me, and I aim to steal it back."
        case (.bandit, .four): return "I will become the greatest thief that ever lived."
        case (.bandit, .five): return "I'm guilty of a terrible crime. I hope I can redeem myself for it."
        case (.bandit, .six): return "Someone I loved died because of a mistake I made. That will never happen again."
        case (.diplomat, .one): return "I will face any challenge to win the approval of my family."
        case (.diplomat, .two): return "My house's alliance with another noble family must be sustained at all costs."
        case (.diplomat, .three): return "Nothing is more important than the other members of my family."
        case (.diplomat, .four): return "I am in love with the heir of a family that my family despises."
        case (.diplomat, .five): return "My loyalty to my sovereign is unwavering."
        case (.diplomat, .six): return "The common folk must see me as a hero of the people."
        }
    }

    var flaw: String {
        switch (kind, _flaw) {
        case (.merchant, .one): return "I'll do anything to get my hands on something rare or priceless."
        case (.merchant, .two): return "I'm quick to assume that someone is trying to cheat me."
        case (.merchant, .three): return "No one must ever learn that I once stole money from guild coffers."
        case (.merchant, .four): return "I'm never satisfied with what I have—I always want more."
        case (.merchant, .five): return "I would kill to acquire a noble title."
        case (.merchant, .six): return "I'm horribly jealous of anyone who can outshine my handiwork. Everywhere I go, I'm surrounded by rivals."
        case (.cityGuard, .one): return "The monstrous enemy we faced in battle still leaves me quivering with fear."
        case (.cityGuard, .two): return "I have little respect for anyone who is not a proven warrior."
        case (.cityGuard, .three): return "I made a terrible mistake in battle that cost many lives—and I would do anything to keep that mistake secret."
        case (.cityGuard, .four): return "My hatred of my enemies is blinding and unreasoning."
        case (.cityGuard, .five): return "I obey the law, even if the law causes misery."
        case (.cityGuard, .six): return "I'd rather eat my armor than admit when I'm wrong."
        case (.bandit, .one): return "When I see something valuable, I can't think about anything but how to steal it."
        case (.bandit, .two): return "When faced with a choice between money and my friends, I usually choose the money."
        case (.bandit, .three): return "If there's a plan, I'll forget it. If I don't forget it, I'll ignore it."
        case (.bandit, .four): return "I have a 'tell' that reveals when I'm lying."
        case (.bandit, .five): return "I turn tail and run when things look bad."
        case (.bandit, .six): return "An innocent person is in prison for a crime that I committed. I'm okay with that."
        case (.diplomat, .one): return "I secretly believe that everyone is beneath me."
        case (.diplomat, .two): return "I hide a truly scandalous secret that could ruin my family forever."
        case (.diplomat, .three): return "I too often hear veiled insults and threats in every word addressed to me, and I'm quick to anger."
        case (.diplomat, .four): return "I have an insatiable desire for carnal pleasures."
        case (.diplomat, .five): return "In fact, the world does revolve around me."
        case (.diplomat, .six): return "By my words and actions, I often bring shame to my family."
        }
    }
}

extension Background {
    struct Feature {
        let title: String
        let description: String
    }
}

extension Background {
    var name: String {
        switch kind {
        case .merchant: return "merchant"
        case .cityGuard: return "city guard"
        case .bandit: return "bandit"
        case .diplomat: return "diplomat"
        }
    }
}

extension Background: CustomStringConvertible {
    var description: String {
        return """
        \(kind)

        Feature: \(feature.title)
        \(feature.description)

        Personality trait: \(personalityTrait)
        Ideal: \(ideal)
        Bond: \(bond)
        Flaw: \(flaw)
        """
    }
}

extension Background.Kind: CustomStringConvertible {
    var description: String {
        switch self {
        case .merchant:
            return "A weary Merchant that has travelled most roads the world has to offer, selling their wares and goods from one side of the continent to the other. Their quick wit, penchant for mathematics, and knowledge of trade routes afford them advantages in the skills of both negotiation and travel. The Merchant's Guild cares for it's own, and while the Merchant follows guild regulations, they will have contacts in most major cities that could possibly help them out of troublesome predicaments."
        case .cityGuard:
            return "A grizzled veteran of many wars, the City Guard is the bane of lawbreakers, and the frontline fighter in the war against the criminal underworld. Their keen eye and military training give them an upper hand when interrogating to discover information, and keeping their cool in dangerous situations. Any member of the Guard will have room and board in most major cities if they provide their crest and credentials to the city's resident Watch Captain."
        case .bandit:
            return "An individual that has sacrificed their morals for profit, the Bandit is a criminal that preys on others for their own gain. Bandits value brute strength and ruthlessness as well as cold and calculating intelligence. They have the advantage when intimidating and when determining the best route of attack or escape. The criminal underworld stretches like a dark web across the land, and recognize their own- the bandit is able to locate hideouts in most major cities for the purpose of avoiding the law or other unwanted attention."
        case .diplomat:
            return "Reserved, charismatic, and cunning, the Diplomat can either be a force of good that fights for the wishes of their people, or force of evil that represents only their own interests. Diplomats use political manuevering to achieve their goals and back channels"
        }
    }
}
