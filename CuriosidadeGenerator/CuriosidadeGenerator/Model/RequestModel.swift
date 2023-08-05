import Foundation

struct RequestModel: Encodable {
    
    var model: String = "gpt-3-5=turbo"
    var messages: [RequestMessageModel]

}

struct RequestMessageModel: Encodable {
    
    var role: String = "user"
    var content: String
    
}


