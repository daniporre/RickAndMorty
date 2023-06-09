//
//  ResultObjectMapper.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

public class ResultObjectMapper: Mapper<ResultObjectDto, ResultObjectModel> {
    public override func mapValue(response: ResultObjectDto) -> ResultObjectModel {
                
        let object = ResultObjectModel(name: response.name ?? "",
                                       url: response.url ?? "")
        
        return object
    }
}
