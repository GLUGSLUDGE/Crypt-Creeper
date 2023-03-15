//
//  NetworkHelper.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 13/2/23.
//

import Foundation

class NetworkHelper {
    
    enum RequestType: String {
        case PUT
        case POST
        case GET
        case DELETE
    }
    
    private var token : String = ""
    func setToken(tokens:String){
        token = tokens
    }
    
    func getToken() -> String {
        setToken(tokens: token)
        return token
    }
    
    // MARK: - Constants
    
    // Singleton
  public static let shared = NetworkHelper()
    
    
    // MARK: - Private Methods
    
    // Se comunica con la API
    private func requestApi(request: URLRequest, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        //Iniciamos la petición
        task.resume()
    }
    
    
    //MARK: - Public Methods
    
    // Se comunica con la función requestApi, capa Provider
    func requestProvider(url: String, type: RequestType = .POST, params: [String: Any]? = nil, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) -> Void {
        
        // Convertimos la url de tipo String a tipo URL
        let url = URL(string: url)
        guard let urlNotNil = url else { return }
        var request = URLRequest(url: urlNotNil)
        request.httpMethod = type.rawValue
        
        if let dictionary = params {
            let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
            request.httpBody = data
        }
        
        // Añadimos los headers
        request.addValue("Bearer " + token , forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Llamamos a la función requestApi
        requestApi(request: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }
    }
}
