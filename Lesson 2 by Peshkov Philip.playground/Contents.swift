import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
print("1. Написать функцию, которая определяет, четное число или нет.")
func isEven(_ num: Int) -> Bool {
    return num % 2 == 0
}
print(isEven(51))
print("")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
print("2. Написать функцию, которая определяет, делится ли число без остатка на 3.")
func isDevideOnNum(_ num: Int, _ split: Int) -> Bool {
    return num % split == 0
}
print(isDevideOnNum(51, 3))

//3. Создать возрастающий массив из 100 чисел.
print("3. Создать возрастающий массив из 100 чисел.")
var arr: Array<Int> = []
for i in 100...199 {
    arr.append(i)
}
print(arr)
print("")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")
var i: Int = 0
for _ in 0...arr.count-1 {
    if isEven(arr[i]) {
        arr.remove(at: i)
        i -= 1
    } else if isDevideOnNum(arr[i], 3) {
        arr.remove(at: i)
        i -= 1
    }
    i += 1
}
print(arr)
print("")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
print("5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.")
var arrfib: Array<Double> = []
func addFib(arr: Array<Double>) -> [Double] {
    var newarr = arr
    var nextfib: Double = 0
    if newarr.count == 0 {
        nextfib = 0
    } else if newarr.count == 1 {
        nextfib = 1
    } else {
        nextfib = newarr[newarr.count - 1] + newarr[newarr.count - 2]
    }
    newarr.append(nextfib)
    return newarr
}
for _ in 1...100 {
    arrfib = addFib(arr: arrfib)
}
print(arrfib)
print("")

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
print("6. * Решето Эратосфена")
var arrerat: Array<Int> = []
var p: Int = 2
var n: Int = 100
for i in p...n {
    arrerat.append(i)
}
var arreratx: Array<Int>  = []
var arreratok: Array<Int>  = []
var j: Int = 0
p = 0
while p < n - 1 {
    j = 0
    for i in stride(from: p, to: n, by: p + 2) {
        if i==0 {
            arreratok.append(arrerat[i-j])
        }
        if j==1 {
            if !arreratx.contains(arrerat[i-j]) {
                arreratok.append(arrerat[i-j])
            }
        } else {
            arreratx.append(arrerat[i])
        }
        j += 1
    }
    p += 1
}
print(arreratok) //end
