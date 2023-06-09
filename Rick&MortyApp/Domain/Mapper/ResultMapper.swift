//
//  ResultMapper.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

public class ResultMapper: Mapper<ResultDto, ResultModel> {
    public override func mapValue(response: ResultDto) -> ResultModel {
        
        var episodesList: [String] = []
        
        if let episodes = response.episode {
            for episode in episodes {
                episodesList.append(episode)
            }
        }
        
        return ResultModel(id: response.id ?? 0,
                           name: response.name ?? "",
                           status: response.status ?? "",
                           species: response.species ?? "",
                           type: response.type ?? "",
                           gender: response.gender ?? "",
                           origin: ResultObjectMapper().mapValue(response: response.origin ?? ResultObjectDto()),
                           location: ResultObjectMapper().mapValue(response: response.location ?? ResultObjectDto()),
                           image: response.image ?? "",
                           episode: episodesList,
                           url: response.url ?? "",
                           created: response.created ?? "")
        
    }
}
