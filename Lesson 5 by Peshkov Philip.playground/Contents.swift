

enum Models {
    case Chevrolet_Comaro
    case Ford_Mustang
    case Mitsubishi_Evo_8
    case Toyota_Tundra
    case Optimus_Prime
    case ZIL
    case Mazda_3
}

enum CarStatus {
    case tarantajka
    case normal
    case premium
}

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Auto {
    var maxSpeed: Int { get }
    var curSpeed: Int { get set }
    var accSpeed: Int { get set }
    var model: Models { get }
    
    func start()
    func stop()
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Auto {
    func start() {
        print("Двигатель запущен")
    }
    
    func stop() {
        print("Мотор заглушен")
    }
    
    func faster() -> Int {
        if self.curSpeed + self.accSpeed <= self.maxSpeed {
            return (self.curSpeed + self.accSpeed)
        } else {
            if self.model == .ZIL {
                print("Быстрее ваше корыто не едет!")
            } else {
                print("Вы можете быстрее, но для этого втопите нитро!")
            }
            
            return self.curSpeed
        }
    }
    
    func slower() -> Int {
        if self.curSpeed - self.accSpeed >= 0 {
            print("Зачем сбавляешь ход?")
            return (self.curSpeed - self.accSpeed)
        } else {
            print("Кажется, заглохли")
            return self.curSpeed
        }
    }
}

protocol Agressive {
    var maxHP: Int { get }
    var curHP: Int { get }
    func fire()
}

extension Agressive {
    func fire(model: Models, speed: Int) -> Int {
        return 20
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class SportCar: Auto {
    var maxSpeed: Int
    var curSpeed: Int = 0
    var accSpeed: Int
    var model: Models
    
    var isNitroUse: Bool = false
    var carStatus: CarStatus = .premium
    
    init(model: Models, maxSpeed: Int, accSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.accSpeed = accSpeed
        self.model = model
    }
}

class TrunkCar: Auto {
    var maxSpeed: Int
    var curSpeed: Int = 0
    var accSpeed: Int
    var model: Models
    
    var levelCO2: Int
    var hoursWithoutDreams: Double = 0.0
    
    init(model: Models, maxSpeed: Int, accSpeed: Int, levelCO2: Int) {
        self.maxSpeed = maxSpeed
        self.accSpeed = accSpeed
        if model != .ZIL {
            self.levelCO2 = levelCO2
        } else {
            if levelCO2 < 300 {
                print("Давайте смотреть правде в глаза. С таким маленьким выхлопом углекислоты ЗИЛа не существует. Пусть будет 300")
                self.levelCO2 = 300
            } else {
                self.levelCO2 = levelCO2
            }
        }
        self.model = model
    }
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Выпущен с конвеера новенький спорткар с максимальной скоростью в " + String(self.maxSpeed) + " км/ч" // почему не могу добавить модель? +String(self.model)) хотя другое свойство не enum позволяет
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        if self.model == .ZIL {
            return "Вы нашли на свалке ЗИЛ с ужасающим выхлопом в " + String(self.levelCO2) + " единиц смрада"
        } else {
        return "Выпущен с конвеера огромный автомобиль с выбросами СО2 в атмосферу равными " + String(self.levelCO2)
        }
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var Auto1 = SportCar(model: .Ford_Mustang, maxSpeed: 350, accSpeed: 10)
var Auto2 = SportCar(model: .Mazda_3, maxSpeed: 190, accSpeed: 5)
var Auto3 = TrunkCar(model: .Optimus_Prime, maxSpeed: 220, accSpeed: 3, levelCO2: 100)
var Auto4 = TrunkCar(model: .ZIL, maxSpeed: 70, accSpeed: 1, levelCO2: 280)

//6. Вывести сами объекты в консоль.
print(Auto1)
print(Auto2)
print(Auto3)
print(Auto4)
