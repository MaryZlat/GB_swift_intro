//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
import Foundation

enum SellActions {
    case sellDiesel
    case sellPetrol80
    case sellPetrol92
    case sellCoke
}

enum SellActionsError: LocalizedError {
    case notEnoughVolume
    case volumeLessThanZero
    case incorrectVolume
    
    var errorDescription: String? {
        switch self {
        case .notEnoughVolume:
            return "Не достаточно продукта на складе"
        case .volumeLessThanZero:
            return "Указанный в функции объем меньше нуля"
        case .incorrectVolume:
            return "Введенное значение не верно, введите число"
        }
    }
}

class OilRefinery {
    let monthRefined: String
    let yearRefined: Int
    var oilSupply: Float
    var dieselSummer: Float
    var petrol80: Float
    var petrol92: Float
    var coke: Float
    var semiProduct: Float

    static var monthActive = 0
    init(monthRefined: String, yearRefined: Int, oilSupply: Float, dieselSummer: Float, petrol80: Float, petrol92: Float, coke: Float, semiProduct: Float) {
        self.monthRefined = monthRefined
        self.yearRefined = yearRefined
        self.oilSupply = oilSupply
        self.dieselSummer = dieselSummer
        self.petrol80 = petrol80
        self.petrol92 = petrol92
        self.coke = coke
        self.semiProduct = semiProduct
        
        OilRefinery.monthActive += 1
    }
    
    func sellProduct(sell: SellActions) throws {
        print("Введите тоннаж продукта")
        let volumeString = readLine()
        guard let volumeString = volumeString, let volume = Float(volumeString) else {
            throw SellActionsError.incorrectVolume
        }
        
        guard volume > 0 else {
            throw SellActionsError.volumeLessThanZero
        }
        switch sell {
        case .sellDiesel:
            guard dieselSummer - volume > 0 else {
                throw SellActionsError.notEnoughVolume
            }
            dieselSummer -= volume
            print("Остаток дизеля, произведенного в месяце \(self.monthRefined) составляет \(dieselSummer) тонн")
        case .sellPetrol80:
            guard petrol80 - volume > 0 else {
                throw SellActionsError.notEnoughVolume
            }
            petrol80 -= volume
            print("Остаток дизеля, произведенного в месяце \(self.monthRefined) составляет \(petrol80) тонн")
        case .sellPetrol92:
            guard petrol92 - volume > 0 else {
                throw SellActionsError.notEnoughVolume
            }
            petrol92 -= volume
            print("Остаток дизеля, произведенного в месяце \(self.monthRefined) составляет \(petrol92) тонн")
        case .sellCoke:
            guard coke - volume > 0 else {
                throw SellActionsError.notEnoughVolume
            }
            coke -= volume
            print("Остаток дизеля, произведенного в месяце \(self.monthRefined) составляет \(coke) тонн")
       
        }
        
    }
    
    //tranfer - перевод нефтепродуктов из одного в другой (например, смешивают остатки в резервуаре ДТЛ и ДТЕ)
    func productTransfer() {
        
    }
    
}

var january2021 = OilRefinery(monthRefined: "январь", yearRefined: 2021, oilSupply: 500000, dieselSummer: 200000, petrol80: 40000, petrol92: 10000, coke: 100000, semiProduct: 60000)
do {
    try january2021.sellProduct(sell: .sellDiesel)
} catch (let error) {
    print("Ошибка: \(error.localizedDescription)")
}
do {
    try january2021.sellProduct(sell: .sellCoke)
} catch (let error) {
    print("Ошибка: \(error.localizedDescription)")
}
