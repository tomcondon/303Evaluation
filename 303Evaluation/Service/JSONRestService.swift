//
//  JSONRestService.swift
//  303Evaluation
//
//  Created by Thomas Condon on 5/23/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import Foundation

public enum JSONRestClientError : Error {

    case returnTypeError(response:URLResponse?)
    case serverError(responseCode:Int)
    case parseError(parseError:NSError)
}

public class JSONRestService {

/**
	This is a generic function to be used in the client code so we do not write boiler plate fetch
 	code with URL Session and codables. We first return false if we have bad url. Otherwise, we
 	have completion routines if we succeed or we fail. Note the case when a restful service return "200"
 	but there is no data. We call fetchFailure in this case with most likely a nil error.
*/
    public func get<T: Decodable>(url: URL,
                                  successCompletion: @escaping (_ result: T) -> (),
                                  errorCompletion: @escaping (_ error: Error?) -> ())
    {
        print("get() url = \(url)")
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else {
                errorCompletion(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                errorCompletion(JSONRestClientError.returnTypeError(response: response))
                return
            }
            if !(200...299).contains(httpResponse.statusCode) {
                errorCompletion(JSONRestClientError.serverError(responseCode: httpResponse.statusCode))
                return
            }
            do {
                let decoder = JSONDecoder() // question... is this expensive to create and if so is it reusable?
                let decoderResult = try decoder.decode(T.self, from: data)
                successCompletion(decoderResult)
            } catch {
                errorCompletion(error)
            }
        }.resume()
    }
}



