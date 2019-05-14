import UIKit

//1. Решить квадратное уравнение.
let x: Int = 2
print("Квадрат числа", x, "равен", x*x)

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
print("")

let a: Int = 3
let b: Int = 7
print("Дан прямоугольный треугольник с длинами катетов", a, "и", b)

let S: Float = (Float(a)*Float(b))/2
print("Тогда площадь прямоугольного треугольника =", S)

let c: Float = (Float(a*a) + Float(b*b)).squareRoot()
print("Его гипотенуза =",  c)

let P: Float = Float(a) + Float(b) + c
print("А периметр =",  P)

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let amount: Int = 100
let percent: Int = 6
let years: Int = 5

var summary: Float = Float(amount)
var curyear: Int = 1
for _ in 1...years {
    summary += summary / 100 * Float(percent)
}
print("")
print("Сумма вклада",  amount, "при процентной ставке", percent, "% годовых через", years, "лет при ежегодной капитализации составит", summary)
