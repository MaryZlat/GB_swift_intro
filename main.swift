//
//  main.swift
//  Lesson1
//
//  Created by Mary Zlatnikova on 12.04.2022.
//

import Foundation

let catAB : Float = 3
let catBC : Float = 7

//найти гипотенузу
let catABSquare = pow(catAB, 2)
let catBCSquare = pow(catBC, 2)

let sumCatSquare = catABSquare + catBCSquare
let hypAC = sqrtf(sumCatSquare)
print ("гипотенуза AC = \(hypAC)")

//найти периметр
let perimeterABC = catAB + catBC + hypAC
print ("периметр ABC = \(perimeterABC)")

//найти площадь
let areaABC = 1/2*catAB*catBC
print ("площадь ABC = \(areaABC)")


//задание решить квадратное уравнение
let a : Float = 4
let b : Float = 6
let c : Float = 2
let x1 : Float?
let x2 : Float?

let discriminant = pow(b,2) - 4*a*c

if (discriminant > 0) {
   let x1 = (-b+sqrtf(discriminant))/(2*a)
   let x2 = (-b-sqrtf(discriminant))/(2*a)
   print ("корень x1 = \(x1)")
   print ("корень x2 = \(x2)")
} else if (discriminant == 0) {
    let x1 = (-b+sqrtf(discriminant))/(2*a)
    print ("корень один: x = \(x1)")
} else {
    print("нет вещественных корней")
}
