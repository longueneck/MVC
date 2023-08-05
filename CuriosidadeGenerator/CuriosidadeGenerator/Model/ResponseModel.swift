import Foundation

struct ResponseModel: Decodable {
    
    var choices: [ResponseChoiceModel]
}

struct ResponseChoiceModel: Decodable {
    
    var message: ResponseMessageModel
}

struct ResponseMessageModel: Decodable {
    
    var content: String
    
}
