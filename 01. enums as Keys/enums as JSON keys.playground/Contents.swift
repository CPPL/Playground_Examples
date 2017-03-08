//: Playground - noun: a place where people can play

import Foundation

enum apiExampleFields: String {
    case name    = "name_fld"
    case age     = "age_in_years"
    case country = "country_origin"
}

typealias APIPayload = [String: Any]

let examplePayload: APIPayload = ["name_fld": "Laphroaig Islay Single Malt Scotch Whisky",
                                     "age_in_years": 18,
                                     "country_origin": "Scotland"]

let age1 = examplePayload[apiExampleFields.age.rawValue]

extension Dictionary where Key: ExpressibleByStringLiteral {
    subscript (key: apiExampleFields) -> Value? {
        get {
            return self[key.rawValue as! Key]
        }
        set {
            self[key.rawValue as! Key] = newValue
        }
    }
}

let age2 = examplePayload[.age]
let name = examplePayload[.name]

var anotherPayload = APIPayload()

anotherPayload[.name]    = "The Glenlivet XXV"
anotherPayload[.age]     = 25
anotherPayload[.country] = "Scotland"

print(anotherPayload)