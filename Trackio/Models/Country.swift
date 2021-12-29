//
//  Country.swift
//  Trackio
//
//  Created by Harun Gunes on 22/12/2021.
//

//{
//  updated: 1640204331890,
//  country: "Turkey",
//  countryInfo: {
//    _id: 792,
//    iso2: "TR",
//    iso3: "TUR",
//    lat: 39,
//    long: 35,
//    flag: "https://disease.sh/assets/img/flags/tr.png"
//  },
//  cases: 9228835,
//  todayCases: 19095,
//  deaths: 80957,
//  todayDeaths: 179,
//  recovered: 8858445,
//  todayRecovered: 22816,
//  active: 289433,
//  critical: 1128,
//  casesPerOneMillion: 107722,
//  deathsPerOneMillion: 945,
//  tests: 115432381,
//  testsPerOneMillion: 1347370,
//  population: 85672389,
//  continent: "Asia",
//  oneCasePerPeople: 9,
//  oneDeathPerPeople: 1058,
//  oneTestPerPeople: 1,
//  activePerOneMillion: 3378.37,
//  recoveredPerOneMillion: 103399.07,
//  criticalPerOneMillion: 13.17
//}

import Foundation

struct Country: Codable, Hashable {
  
  let country: String
  let cases: Int
  let todayCases: Int
  let deaths: Int
  let todayDeaths: Int
  let recovered: Int
  let todayRecovered: Int
  let countryInfo: CountryInfo
}

struct CountryInfo: Codable, Hashable {
  let flag: String
}
