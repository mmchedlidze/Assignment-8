protocol ManagerControl {
    func add (item: String)
    func remove (item: String)
    func list() -> [String]
}

protocol Cannons {
    func Fight()
}

class CrewManager: ManagerControl {
    var crew: [String] = []
    
    func add(item: String) {
        crew.append(item)
    }
    
    func remove(item: String) {
        if let index = crew.firstIndex(of: item) {
            crew.remove(at: index)
        }
    }
    
    func list() -> [String] {
        return crew
    }
}

class CargoManager: ManagerControl {
    var cargo: [String] = []
    
    func add(item: String) {
        cargo.append(item)
    }
    
    func remove(item: String) {
        if let index = cargo.firstIndex(of: item) {
            cargo.remove(at: index)
        }
    }
    
    func list() -> [String] {
        return cargo
    }
}

class PirateShip: Cannons {
    let name: String
    var cannonsCount: Int
    var crew: ManagerControl
    var cargo: ManagerControl
    
    init(name: String, cannonsCount: Int, crew: ManagerControl, cargo: ManagerControl) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.crew = crew
        self.cargo = cargo
    }
    
    func cannonCount() -> Int {
        return cannonsCount
    }
    
    func fireCannon(count: Int) {
        if cannonsCount >= count {
            cannonsCount -= count
        }
    }
    
    func Fight() {
        if cannonsCount > 0 {
            cannonsCount -= 1
        }
    }
}

class Frigate: PirateShip {
    var crewCapacity: Int
    
    init(name: String, cannonsCount: Int, maximumSpeed: Double, crewCapacity: Int) {
        self.crewCapacity = crewCapacity
        
        super.init(name: <#T##String#>, cannonsCount: <#T##Int#>, crew: <#T##ManagerControl#>, cargo: <#T##ManagerControl#>)
    }
    
    func checkCrewCapacity() {
        let currentCrewCount = crew.list().count
        if currentCrewCount <= crewCapacity {
            print("Crew capacity is within limits. Current crew count: \(currentCrewCount)")
        } else {
            print("Exceeds crew capacity! Current crew count: \(currentCrewCount), Maximum crew capacity: \(crewCapacity)")
        }
    }
    
}
class Galleon: PirateShip {
    var cargoCapacity: Int
    
    init(name: String, cannonsCount: Int, maximumSpeed: Double, cargoCapacity: Int) {
        self.cargoCapacity = cargoCapacity
        
        super.init(name: <#T##String#>, cannonsCount: <#T##Int#>, crew: <#T##ManagerControl#>, cargo: <#T##ManagerControl#>)
    }
    
    func checkCargoCapacity() {
        let currentCargoCount = cargo.list().count
        if currentCargoCount <= cargoCapacity {
            print("Cargo capacity is within limits. Current cartgo count: \(currentCargoCount)")
        } else {
            print("Exceeds cargo capacity! Current cargo count: \(currentCargoCount), Maximum cargo capacity: \(cargoCapacity)")
        }
    }
}

class TreasureMap {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(currentX: Int, currentY: Int) -> String {
        if currentX == x && currentY == y {
            return "You've found the treasure!"
        } else {
            let xDirection = x > currentX ? "east" : "west"
            let yDirection = y > currentY ? "north" : "south"
            return "The treasure is to the \(xDirection) and \(yDirection)."
        }
    }
}

class SeaAdventure {
    let adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("Your ship encounters a \(adventureType) adventure.")
    }
}

class PirateCode {
    private func discussTerms(term: String) {
        print("Negotiations have started. Terms: \(term)")
    }
    
    func parley(term: String) {
        discussTerms(term: term)
        print("Parley! We shall negotiate.")
    }
    
    func mutiny(term: String) {
        discussTerms(term: term)
        print("Mutiny! We shall fight.")
    }
}



let crew = CrewManager()
let cargo = CargoManager()
let pirateShip = PirateShip(name: "Going Merry", cannonsCount: 4, crew: crew, cargo: cargo)
pirateShip.crew.add(item: "Monkey D.Luffy")
pirateShip.crew.add(item: "Zoro")
pirateShip.crew.add(item: "Sanji")
pirateShip.crew.add(item: "Nami")
pirateShip.crew.add(item: "Usopp")
pirateShip.cargo.add(item: "Food")
pirateShip.cargo.add(item: "Equipment")
pirateShip.cargo.add(item: "Weapons")
let treasureMap = TreasureMap(x: 12, y: 5)
let pirateCode = PirateCode()
let seaAdventure = SeaAdventure(adventureType: "Flying Dutchman Attack")
let currentX = 5
let currentY = 3
let hint = treasureMap.hintToTreasure(currentX: currentX, currentY: currentY)
print(hint)
let newX = 12
let newY = 5
let hint2 = treasureMap.hintToTreasure(currentX: newX, currentY: newY)
print(hint2)
seaAdventure.encounter()
pirateCode.mutiny(term: "Negotiate the division of treasure")
while pirateShip.cannonCount() > 0 {
    pirateShip.fireCannon(count: 2)
    print("Fire! Cannons remaining: \(pirateShip.cannonCount())")}
print("Flying Dutchman Defetead!")

