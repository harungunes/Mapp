//
//  CountryTests.swift
//  TrackioTests
//
//  Created by Harun Gunes on 16/06/2022.
//

import XCTest
@testable import Trackio

class CountryTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }

  func testCanParse() throws {
    let json = """
    [
    {
    "country": "Afghanistan",
    "countryInfo": {
    "flag": "https://disease.sh/assets/img/flags/af.png"
    },
    "cases": 181465,
    "todayCases": 0,
    "deaths": 7713,
    "todayDeaths": 0,
    "recovered": 163664,
    "todayRecovered": 0,
    }
    ]
    """
    
    let data = json.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let result = try decoder.decode([Country].self, from: data)
    
    XCTAssertEqual(result[0].country, "Afghanistan")
    XCTAssertEqual(result[0].countryInfo.flag, "https://disease.sh/assets/img/flags/af.png")
    XCTAssertEqual(result[0].cases, 181465)
    XCTAssertEqual(result[0].todayCases, 0)
    XCTAssertEqual(result[0].deaths, 7713)
    XCTAssertEqual(result[0].todayDeaths, 0)
    XCTAssertEqual(result[0].recovered, 163664)
    XCTAssertEqual(result[0].todayRecovered, 0)
  }
  
  
}
