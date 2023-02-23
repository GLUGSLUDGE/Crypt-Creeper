//
//  NetworkHelper.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 13/2/23.
//

import Foundation

class NetworkHelper {
    
    enum RequestType: String {
        case POST
        case GET
    }
    
    var token : String = ""
    func setToken(tokens:String){
     token = tokens
    }
    
    // MARK: - Constants
    
    // Singleton
    static let shared = NetworkHelper()
    
    
    // MARK: - Private Methods
    
    // se comunica con la API
    private func requestApi(request: URLRequest, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        //iniciamos la petición
        task.resume()
    }
    
    
    //MARK: - Public Methods
    
    // se comunica con la función requestApi, capa Provider
    func requestProvider(url: String, type: RequestType = .POST, params: [String: Any]? = nil, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) -> Void {
        
        // convertimos la url de tipo String a tipo URL
        let url = URL(string: url)
        
        
        guard let urlNotNil = url else { return }
        
        
        var request = URLRequest(url: urlNotNil)
        
        
        request.httpMethod = type.rawValue
        
        
        if let dictionary = params {
            let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
            request.httpBody = data
        }
        
        //añadimos los headers
        
        
        request.addValue("Beare " + token , forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
     
        
        //llamamos a la función requestApi
        requestApi(request: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }
    }
}
