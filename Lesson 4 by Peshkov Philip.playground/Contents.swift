enum BrandTruck {
    case MAZ
    case Man
    case ZIL
}

enum BrandSport {
    case Bugatti
    case Ferrari
    case Lamborghini
}

enum TypeTires {
    case allSeason
    case sport
    case summer
    case truck
    case winter
}

enum TypeEngine {
    case d1_6
    case d2_2
    case d4_0
    case g1_1
    case g1_6
    case g2_0
    case g2_4
}

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

enum TypeArmor {
    case gloves
    case helmet
    case turtle
    case fullGuard
}

enum TypeTruck {
    case monster
    case longvichle
    case sandCarier
    case maxTonnage
}

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
    let yearProduced: Int
    var countWheels: Int = 4
    var typeTires: TypeTires = .allSeason
    var sizeWheels: Int = 16
    var typeEngine: TypeEngine = .g1_6
    
    init(yearProduced: Int, countWheels: Int, typeTires: TypeTires, sizeWheels: Int, typeEngine: TypeEngine) {
        self.yearProduced = yearProduced
        self.countWheels = countWheels
        self.typeTires = typeTires
        self.sizeWheels = sizeWheels
        self.typeEngine = typeEngine
    }
    
    func changeTires() {
        
    }
}

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class CarSport: Car {
    var brandSport: BrandSport
    var typeArmor: TypeArmor
    var timeChangeTires: Double
    
    init(yearProduced: Int, countWheels: Int, typeTires: TypeTires, sizeWheels: Int, typeEngine: TypeEngine, brandSport: BrandSport, typeArmor: TypeArmor, timeChangeTires: Double? = nil) {
        
        self.brandSport = brandSport
        self.typeArmor = typeArmor
        self.timeChangeTires = 0.0
        
        super.init(yearProduced: yearProduced, countWheels: countWheels, typeTires: typeTires, sizeWheels: sizeWheels, typeEngine: typeEngine)
        
        super.typeTires = .sport
        super.sizeWheels = 20
        super.typeEngine = .g2_4
    }
    
    //4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    
    override func changeTires() {
        switch self.brandSport {
        case .Bugatti:
            self.timeChangeTires = 12.4
            print("В Бугатти не торопятся... для них", self.timeChangeTires, "сек чтобы переобуть 4 колеса - это хорошо. Они знают, что Вейрон отыграет на прямой.")
        case .Ferrari:
            self.timeChangeTires = 10.1
            print(self.timeChangeTires, "- это рекорд для Ферарри.")
        case .Lamborghini:
            self.timeChangeTires = 9.9
            print("Команда Ламбы дьявольски быстрая! Меняет резину за", self.timeChangeTires)
        }
        
    }
}

class CarTruck: Car {
    var brandTruck: BrandTruck
    var typeTruck: TypeTruck
    //var distanceDrive: Double
    var tiresNew: Bool = true
    
    init(yearProduced: Int, countWheels: Int, typeTires: TypeTires, sizeWheels: Int, typeEngine: TypeEngine, brandTruck: BrandTruck, typeTruck: TypeTruck, tiresNew: Bool) {
        
        self.brandTruck = brandTruck
        self.typeTruck = typeTruck
        self.tiresNew = tiresNew
        
        super.init(yearProduced: yearProduced, countWheels: countWheels, typeTires: typeTires, sizeWheels: sizeWheels, typeEngine: typeEngine)
        
        super.typeTires = .truck
        super.typeEngine = .d2_2
    }
    
    override func changeTires() {
        if self.typeTires == .truck {
            switch self.brandTruck {
            case .Man:
                self.tiresNew = true
                print("Резину сменили на новую. Можно ехать.")
            case .MAZ:
                self.tiresNew = true
                print("На", self.brandTruck, "резина нашлась только от Монстер Трака. Ну поэтому заодно мы ваш грузовик подготовили к выступлениям в яме.")
                self.typeTruck = .monster
                self.sizeWheels = 48
                self.typeEngine = .d4_0
            case .ZIL:
                self.tiresNew = false
                print("Простите, но для такой старой колымаги как", self.brandTruck, "нет новой резины. Да поможет вам Бог!")
            }
        } else {
            print("Невозможно сменить резину, пока вы не купите комплект для грузовиков!")
        }
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var car1 = CarSport(yearProduced: 2019, countWheels: 4, typeTires: .sport, sizeWheels: 16, typeEngine: .g2_0, brandSport: .Ferrari, typeArmor: .helmet, timeChangeTires: 10)
var car2 = CarSport(yearProduced: 2017, countWheels: 4, typeTires: .allSeason, sizeWheels: 17, typeEngine: .g2_4, brandSport: .Bugatti, typeArmor: .gloves, timeChangeTires: 11)
var car3 = CarSport(yearProduced: 2018, countWheels: 4, typeTires: .sport, sizeWheels: 20, typeEngine: .d2_2, brandSport: .Lamborghini, typeArmor: .fullGuard)
var car4 = CarTruck(yearProduced: 1990, countWheels: 5, typeTires: .truck, sizeWheels: 22, typeEngine: .d1_6, brandTruck: .ZIL, typeTruck: .longvichle, tiresNew: false)
var car5 = CarTruck(yearProduced: 2010, countWheels: 16, typeTires: .truck, sizeWheels: 24, typeEngine: .d2_2, brandTruck: .Man, typeTruck: .maxTonnage, tiresNew: true)
var car6 = CarTruck(yearProduced: 2012, countWheels: 8, typeTires: .winter, sizeWheels: 20, typeEngine: .d2_2, brandTruck: .MAZ, typeTruck: .longvichle, tiresNew: false)

car1.changeTires()
car2.changeTires()
car3.changeTires()
car4.changeTires()
car5.changeTires()
car6.changeTires()

//6. Вывести значения свойств экземпляров в консоль.
print(car1.brandSport)
print(car1.typeArmor)
print(car2.timeChangeTires)
print(car2.sizeWheels)
print(car3.timeChangeTires)
print(car3.typeEngine)
print(car4.brandTruck)
print(car4.tiresNew)
print(car4.typeTruck)
print(car5.sizeWheels)
print(car5.yearProduced)
print(car5.typeEngine)
print(car6.brandTruck)
print(car6.tiresNew)
print(car6.countWheels)
