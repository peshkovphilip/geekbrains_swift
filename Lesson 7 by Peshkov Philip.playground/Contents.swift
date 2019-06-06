//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
enum TimeToEat {
    case Breakfast
    case Lunch
    case Dinner
}

enum Color {
    case black
    case blue
    case green
    case red
    case white
    case yellow
}

enum IngredientsError: Error {
    case NoIngredientsFound
    case NoIngredientsFoundGet
    case NoIngredientsFoundFilter
    case NoIngredientsFilter
    case NonameIngredient
}

protocol Ingredient {
    var name: String { get }
    var color: Color { get }
    var kkal: Int { get }
    var fat: Int { get }
}

class IngredientsQueue<T: Ingredient>: CustomStringConvertible {
    
    private var elements: [T] = []
    
    var description: String {
        var descElements: String = "Блюдо из \(elements.count) ингредиентов: \n"
        elements.forEach {
            descElements += "\($0.name) \n"
        }
        return descElements
    }
    
    func add(_ element: T) {
//        if element.name != "" {
            elements.append(element)
//        } else {
//            throw IngredientsError.NonameIngredient
//        }
    }
    
    func get() throws -> T? {
        if !elements.isEmpty {
            return elements.removeFirst()
        } else {
            throw IngredientsError.NoIngredientsFoundGet
        }
    }
    
    var elementsCount: Int {
        return elements.count
    }
    
    func prepareToDish(timeToEat: TimeToEat) throws -> Bool {
        var maxKkal: Int
        var curKkal: Int = 0
        var maxFat: Int
        var curFat: Int = 0
        
        if elements.count > 0 {
            elements.forEach {
                curKkal += $0.kkal
                curFat += $0.fat
            }
        } else {
            throw IngredientsError.NoIngredientsFound
        }
        
        switch timeToEat {
        case .Breakfast:
            maxKkal = 400
            maxFat = 40
        case .Lunch:
            maxKkal = 300
            maxFat = 20
        case .Dinner:
            maxKkal = 800
            maxFat = 80
        }
        
        if (maxKkal >= curKkal) {
            if (maxFat >= curFat) {
                print("Такое блюдо вполне можно съесть. Приятного аппетита!")
                return true
            } else {
                print("Слишком жирно. Измените ингредиенты или время приема.")
                return false
            }
        } else {
            print("Пища слишком калорийная. Измените ингредиенты или время приема.")
            return false
        }
    }
    
}

class CIngredient: Ingredient {
    var name: String
    var color: Color
    var kkal: Int
    var fat: Int
    
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript(typeOfEat: String) -> String {
        switch typeOfEat {
        case "Калорийность":
            return String(self.kkal)
        case "Жирность":
            return String(self.fat)
        default:
            fatalError("Несуществующее свойство")
        }
    }
    
    init(name: String, color: Color, kkal: Int, fat: Int) {
        self.name = name
        self.color = color
        self.kkal = kkal
        self.fat = fat
    }
}

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
func filter(array: IngredientsQueue<CIngredient>, maxKkal: Int ) throws -> IngredientsQueue<CIngredient> {
    //var newArray:  Array<IngredientsQueue> = []
    let newArray = IngredientsQueue<CIngredient>()
    var curCount: Int = 0
    
    if array.elementsCount > 0 {
        while curCount < array.elementsCount {
            var curItem: CIngredient?
            do {
                curItem = try array.get()
            } catch IngredientsError.NoIngredientsFoundGet {
                print("В блюде нет ни одного ингредиента!")
            } catch let error {
                print(error)
            }
            if maxKkal >= curItem?.kkal ?? 0 {
                newArray.add(curItem ?? CIngredient(name: "Баранка", color: .black, kkal: 0, fat: 0))
            }
            curCount += 1
        }
    } else {
        throw IngredientsError.NoIngredientsFoundFilter
    }
    
    if newArray.elementsCount > 0 {
        return newArray
    } else {
        throw IngredientsError.NoIngredientsFilter
    }
    
}

var rice = CIngredient(name: "Рис", color: .white, kkal: 310, fat: 2)
var tomato = CIngredient(name: "Помидор", color: .red, kkal: 45, fat: 0)
var lobster = CIngredient(name: "Креветка", color: .red, kkal: 220, fat: 25)
var paela = IngredientsQueue<CIngredient>()
//paela.add(rice)
//paela.add(tomato)
//paela.add(lobster)
do {
    try paela.prepareToDish(timeToEat: .Breakfast)
} catch IngredientsError.NoIngredientsFound {
    print("Без ингредиентов невозможно создать блюдо!")
} catch let error {
    print(error)
}

//paela.prepareToDish(timeToEat: .Dinner)
do {
    try paela.get()
} catch IngredientsError.NoIngredientsFoundGet {
    print("В блюде нет ни одного ингредиента!")
} catch let error {
    print(error)
}
//paela.prepareToDish(timeToEat: .Breakfast)
paela.add(rice)
print(paela)
//print(rice["Жирн{ость"])
//print(rice["Калорийность"])
do {
    paela = try filter(array: paela, maxKkal: 300)
} catch IngredientsError.NoIngredientsFoundFilter {
    print("Невозможно отфильтровать без ингредиентов!")
} catch IngredientsError.NoIngredientsFilter {
    print("В полученном блюде нет ингредиентов!")
} catch let error {
    print(error)
}
print(paela)
//paela.add(rice)
//print(paela)


//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

