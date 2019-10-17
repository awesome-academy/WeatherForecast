//
//  File.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/17/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class ServiceHelper {

    private var currentService: CurrentService
    private let fiveDayService: FiveDayService
    private let placeService: PlaceService
    private let uvService: UVIndexService
    private let airService: AirPolutionService

    var currentWeather: CurrentWeather?
    var fiveDayWeather = [FiveDayWeather]()
    var uvIndex: UVIndex?
    var airPolution: AirPolution?
    var places = [Place]()

    private init(_ currentService: CurrentService, _ fiveDayService: FiveDayService, _ placeService: PlaceService, _ uvService: UVIndexService, _ airService: AirPolutionService) {
        self.currentService = currentService
        self.fiveDayService = fiveDayService
        self.placeService = placeService
        self.uvService = uvService
        self.airService = airService
    }

    static func getInstance(_ currentService: CurrentService, _ fiveDayService: FiveDayService, _ placeService: PlaceService, _ uvService: UVIndexService, _ airService: AirPolutionService) -> ServiceHelper {
        return ServiceHelper(currentService, fiveDayService, placeService, uvService, airService)
    }



    func getWeather(param: CurrentWeatherParams) -> CurrentWeather? {
        currentService.getCurrentWeather(param: param).cloudResponse { [weak self](response: CurrentWeatherResponse) in
            guard let data = response.object else {
                return
            }
            self?.currentWeather = data
        }.cloudError { (errMsg, errCode) in
            print("\(errMsg)")
        }
        return currentWeather
    }

    func getPlace(param: PlaceParams) -> [Place] {
        placeService.getPlace(param: param).cloudResponse { [weak self](response: PlaceResponse) in
            self?.places = response.places
        }.cloudError { (msg, code) in
            print("\(msg)")
        }
        return places
    }

    func getFiveDayData(param: FiveDayParams) -> [FiveDayWeather] {
        fiveDayService.getFiveDayData(param: param).cloudResponse { [weak self](response: FiveDayResponse) in
            self?.fiveDayWeather = response.listData
        }.cloudError { (errMsg, errCode) in
            print("\(errMsg)")
        }
        return fiveDayWeather
    }

    func getAirPolutionData(param: Coordinate) -> AirPolution? {
        airService.getAirPolutionData(param: param).cloudResponse { (response: AirPolutionResponse) in
            self.airPolution = response.dataList.first
        }.cloudError { (errMsg, code) in
            print("\(errMsg)")
        }
        return airPolution
    }

    func getUVData(param: UVIndexParams) -> UVIndex? {
        uvService.getUVData(param: param).cloudResponse { (response: UVIndexResponse) in
            self.uvIndex = response.uvIndex.first
        }
        return uvIndex
    }
}
