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
        elements.append(element)
    }
    
    func get() -> T? {
        return elements.removeFirst()
    }
    
    var elementsCount: Int {
        return elements.count
    }
    
    func prepareToDish(timeToEat: TimeToEat) -> Bool {
        var maxKkal: Int
        var curKkal: Int = 0
        var maxFat: Int
        var curFat: Int = 0
        
        elements.forEach {
            curKkal += $0.kkal
            curFat += $0.fat
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
func filter(array: IngredientsQueue<CIngredient>, maxKkal: Int ) -> IngredientsQueue<CIngredient> {
    //var newArray:  Array<IngredientsQueue> = []
    let newArray = IngredientsQueue<CIngredient>()
    var curCount: Int = 0
    
    while curCount <= array.elementsCount + 1  {
        let curItem = array.get()
        if maxKkal >= curItem?.kkal ?? 0 {
            newArray.add(curItem ?? CIngredient(name: "Баранка", color: .black, kkal: 0, fat: 0))
        }
        curCount += 1
    }
    
    return newArray
}

var rice = CIngredient(name: "Рис", color: .white, kkal: 310, fat: 2)
var tomato = CIngredient(name: "Помидор", color: .red, kkal: 45, fat: 0)
var lobster = CIngredient(name: "Креветка", color: .red, kkal: 220, fat: 25)
var paela = IngredientsQueue<CIngredient>()
paela.add(rice)
paela.add(tomato)
paela.add(lobster)
paela.prepareToDish(timeToEat: .Breakfast)
paela.prepareToDish(timeToEat: .Dinner)
paela.get()
paela.prepareToDish(timeToEat: .Breakfast)
paela.add(rice)
print(rice["Жирность"])
print(rice["Калорийность"])

paela = filter(array: paela, maxKkal: 300)
print(paela)
paela.add(rice)
print(paela)
