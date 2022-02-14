//
//  ErrorMessages.swift
//  Trackio
//
//  Created by Harun Gunes on 22/12/2021.
//

import Foundation

enum TrErrorMessages: String, Error {
  case invalidCountry = "This country created an invalid request. Please try again."
  case unableToComplete = "Unable to complete your request. Please check your internet connection."
  case invalidResponse = "Country not found or doesn't have any cases."
  case invalidData = "The data received from the server was invalid. Please try again."
}
