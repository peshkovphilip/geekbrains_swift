enum Brand {
    case Audi
    case BMW
    case Ford
    case Lada
}

enum StateWindows {
    case opened
    case closed
}

enum BrandTruck {
    case MAZ
    case Man
    case ZIL
}

var brandAudi: Array<String> = [
    "A100", "A1", "A2", "A3", "A5", "Q6", "Q7"
]

var brandBMW: Array<String> = [
    "X1", "X5", "X6"
]

var brandFord: Array<String> = [
    "Mustang", "Focus", "Transit"
]

var brandLada: Array<String> = [
    "Kalina", "X-Ray", "Granta"
]

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
struct Automobile {
    
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    let yearProduced: Int
    var vLuggageMax: Int
    var isEngineStart: Bool = true
    var isOpenWindows: StateWindows = .closed
    var vLuggageUse: Int = 0
    
    var brand: Brand {
        willSet {
            switch newValue {
            case .Audi:
                print("Вы выбрали Audi")
                print("Доступны следующие модели:")
                for i in brandAudi {
                    print(i)
                }
            case .BMW:
                print("Вы выбрали дорогой бренд BWM")
                print("Доступны следующие модели:")
                for i in brandBMW {
                    print(i)
                }
            case .Ford:
                print("Вы выбрали Американский бренд, будет сложно с запчастями")
                print("Доступны следующие модели:")
                for i in brandFord {
                    print(i)
                }
            case .Lada:
                print("Вы выбрали отечественную марку", "К сожалению, в Ладе не невозможно опустить окна.")
                if self.isOpenWindows == .opened {
                    print("Свойство было изменено!")
                    self.isOpenWindows = .closed
                }
                print("Доступны следующие модели:")
                for i in brandLada {
                    i == "X-Ray" ? print(i) : print(i, "нет запаски")
                }
            }
        }
    }

    //3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    func startEngine() {
        print("Двигатель запущен! Пристегните ремень!")
    }
    func stopEngine() {
        print("Двигатель заглушён! Покидая автомобиль, не забудьте поставить его на сигнализацию!")
    }
    
    //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func openedWindows() {
        if self.brand != .Lada {
            print("Вы опустили окна. Надеюсь, что погода подходящая.")
            self.isOpenWindows = .opened
        } else {
            print("У отечественного автопрома окна не опускаются")
        }
    }
    mutating func closedWindows() {
        if self.brand != .Lada {
            print("Вы подняли окна. Смотрите не задохнитесь там.")
            self.isOpenWindows = .closed
        } else {
            print("Окна итак задраены намертво!")
        }
    }
    mutating func pushLuggage(vLuggage: Int) {
        if self.vLuggageMax - self.vLuggageUse >= vLuggage {
            print("Вы запихнули новую партию борохла в багажник удачно")
            self.vLuggageUse += vLuggage
        } else {
            print("Борохла слишком много! В багажник не влазит. Попробуйте или уменьшить партию или что-нибудь выкинуть из багажника.")
        }
    }
    mutating func pullLuggage(vLuggage: Int) {
        if self.vLuggageUse >= vLuggage {
            print("Вы достали", vLuggage, "килограмм из багажника, отличная работа!")
            self.vLuggageUse -= vLuggage
        } else {
            print("Эмм... у вас нет в багажнике столько вещей.")
        }
    }
    mutating func brandChage(brand: Brand) {
        self.brand = brand
    }
    init(yearProduced: Int, vLuggageMax: Int, isEngineStart: Bool, isOpenWindows: StateWindows, vLuggageUse: Int, brand: Brand) {
        self.yearProduced = yearProduced
        self.vLuggageMax = vLuggageMax
        self.isEngineStart = isEngineStart
        self.vLuggageUse = vLuggageUse
        self.brand = brand
        if brand != .Lada {
            self.isOpenWindows = isOpenWindows
        } else {
            print("Внимание! В данной марке окна подняты и опустить их нельзя! Свойство было изменено!")
            self.isOpenWindows = .closed
        }
    }
}

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
struct Truck {
    
    //2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    let yearProduced: Int
    var vLuggageMax: Int
    var isEngineStart: Bool = true
    var isOpenWindows: StateWindows = .opened
    var vLuggageUse: Int = 0
    
    var brand: BrandTruck {
        willSet {
            switch newValue {
            case .MAZ:
                print("Вы выбрали MAZ - Минского автомобильного завода")
            case .Man:
                print("Вы выбрали дорогой бренд Man")
            case .ZIL:
                print("Вы выбрали отечественную марку. К сожалению, в ЗИЛе нельзя опустить окна.")
                if self.isOpenWindows == .opened {
                    print("Свойство было изменено!")
                    self.isOpenWindows = .closed
                }
            }
        }
    }
    
    //3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    func startEngine() {
        print("Двигатель запущен! Не пугайтесь грохота.")
    }
    func stopEngine() {
        print("Двигатель заглушён! Как тихо стало вокруг.")
    }
    
    //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func openedWindows() {
        if self.brand != .ZIL {
            print("Вы опустили окна. Надеюсь, что погода подходящая.")
            self.isOpenWindows = .opened
        } else {
            print("У отечественного автопрома окна не опускаются")
        }
    }
    mutating func closedWindows() {
        if self.brand != .ZIL {
            print("Вы подняли окна. Смотрите не задохнитесь там.")
            self.isOpenWindows = .closed
        } else {
            print("Окна итак задраены намертво!")
        }
    }
    mutating func pushLuggage(vLuggage: Int) {
        if self.vLuggageMax - self.vLuggageUse >= vLuggage {
            print("Вы запихнули новую партию борохла в свой кузов удачно")
            self.vLuggageUse += vLuggage
        } else {
            print("Борохла слишком много! В кузове нет столько места. Попробуйте или уменьшить партию или что-нибудь выкинуть из кузова.")
        }
    }
    mutating func pullLuggage(vLuggage: Int) {
        if self.vLuggageUse >= vLuggage {
            print("Вы достали", vLuggage, "килограмм из кузова, отличная работа!")
            self.vLuggageUse -= vLuggage
        } else {
            print("Эмм... у вас нет в кузове столько вещей.")
        }
    }
    mutating func brandChage(brand: BrandTruck) {
        self.brand = brand
    }
    init(yearProduced: Int, vLuggageMax: Int, isEngineStart: Bool, isOpenWindows: StateWindows, vLuggageUse: Int, brand: BrandTruck) {
        self.yearProduced = yearProduced
        self.vLuggageMax = vLuggageMax
        self.isEngineStart = isEngineStart
        self.vLuggageUse = vLuggageUse
        self.brand = brand
        if brand != .ZIL {
            self.isOpenWindows = isOpenWindows
        } else {
            print("Внимание! В данной марке окна подняты и опустить их нельзя! Свойство было изменено!")
            self.isOpenWindows = .closed
        }
    }
}
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var newAuto = Automobile(yearProduced: 2014, vLuggageMax: 1200, isEngineStart: false, isOpenWindows: .opened, vLuggageUse: 100, brand: .Lada)

newAuto.stopEngine()
newAuto.closedWindows()
newAuto.pullLuggage(vLuggage: 200)
newAuto.pushLuggage(vLuggage: 1800)
newAuto.pushLuggage(vLuggage: 1000)
newAuto.pullLuggage(vLuggage: 500)
newAuto.startEngine()
newAuto.openedWindows()
newAuto.brandChage(brand: .Audi)
newAuto.openedWindows()
newAuto.brandChage(brand: .Lada)

var newTruck = Truck(yearProduced: 1990, vLuggageMax: 14670, isEngineStart: false, isOpenWindows: .opened, vLuggageUse: 0, brand: .Man)

newTruck.startEngine()
newTruck.pushLuggage(vLuggage: 10000)
newTruck.pullLuggage(vLuggage: 90)
newTruck.stopEngine()
newTruck.brandChage(brand: .ZIL)

//6. Вывести значения свойств экземпляров в консоль.
print(newAuto.isEngineStart)
print(newAuto.vLuggageMax)

print(newTruck.brand)
print(newTruck.vLuggageUse)
print(newTruck.isOpenWindows)

