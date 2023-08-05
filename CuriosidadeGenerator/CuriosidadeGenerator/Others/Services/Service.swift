import Foundation

enum APIErrors: Error{
    
    case urlPharse(String)
    case converterResponse(String)
    case errorData(String)
    case statuCcode(Int)
    case unknow(Error)
    
}

class Service {
    
    static var configuration: URLSessionConfiguration{
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["ContentType":"ApplicationJson", "Authorization": "Bearer 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"]
        return config
    }
    
    static var session: URLSession = URLSession(configuration: configuration)
    
    static var baseURL = "https://api.openai.com/v1/chat/completions"
    
    public func generateRecipe(message: String, closure:  @escaping(ResponseModel? , APIErrors?) -> Void ) {
        let url = URL(string: Service.baseURL)
        guard let url = url else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let textRequest = RequestMessageModel(content: message)
        let request = RequestModel(messages: [textRequest])
        let encoder = JSONEncoder()
        let body = try? encoder.encode(request)
        urlRequest.httpBody = body
        let task = Service.session.dataTask(with: urlRequest) { data, urlResponse, error in
            if error == nil {
                guard let response = urlResponse as? HTTPURLResponse else {
                    closure(nil, APIErrors.converterResponse("Erro de converter"))
                    return
                }
                if response.statusCode == 200{
                    guard let data = data else {
                        closure(nil, APIErrors.errorData("Erro de dados"))
                        return}
                    do{
                        let jsonDecode = JSONDecoder()
                        let recipe = try jsonDecode.decode(ResponseModel.self, from: data)
                        closure(recipe, nil)
                    }catch{
                        closure(nil, APIErrors.unknow(error))
                    }
                }else{
                    closure(nil, APIErrors.statuCcode(response.statusCode))
                }
            }else{
                closure(nil, APIErrors.unknow(error!))
            }
        }
        task.resume()
    }
    
}
