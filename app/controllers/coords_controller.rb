require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 42.0538387
    @longitude = -87.67721
    your_api_key = "dc04678178a0cae7984a52be4a2f57e7"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude}"
    @raw_data = open(url).read
    @parsed_data = JSON.parse(@raw_data)
    @temperature = @parsed_data["currently"]["temperature"]
    @minutely_summary = @parsed_data["minutely"]["summary"]
    @hourly_summary = @parsed_data["hourly"]["summary"]
    @daily_summary = @parsed_data["daily"]["summary"]
  end
end
