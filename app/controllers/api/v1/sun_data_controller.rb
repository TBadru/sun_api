# calls real data using sun-rise-sunset.org API
require "httparty"

module Api
  module V1
    class SunDataController < ApplicationController
      BASE_URL = "https://api.sunrise-sunset.org/json"

      def show
        date = params[:date] || Date.today.to_s
        lat  = params[:lat] || "40.7128"
        lng  = params[:lng] || "-74.0060"

        @data = build_response(lat, lng, date)
        render :show
      end

      def today
        lat = params[:lat] || "40.7128"
        lng = params[:lng] || "-74.0060"

        @data = build_response(lat, lng, Date.today.to_s)
        render :show
      end

      def range
        lat = params[:lat] || "40.7128"
        lng = params[:lng] || "-74.0060"
        start_date = Date.parse(params[:start_date])
        end_date   = Date.parse(params[:end_date])

        @results = (start_date..end_date).map do |date|
          build_response(lat, lng, date.to_s)[:results]
        end
        @status = "OK"
        render :range
      rescue ArgumentError
        render json: { error: "Invalid date format. Use YYYY-MM-DD." }, status: :bad_request
      end

      private

      def build_response(lat, lng, date)
        response = HTTParty.get(BASE_URL, query: { lat: lat, lng: lng, date: date, formatted: 1 })
        body = JSON.parse(response.body, symbolize_names: true)

        {
          results: {
            date: date,
            sunrise: body[:results][:sunrise],
            sunset: body[:results][:sunset],
            first_light: body[:results][:civil_twilight_begin],
            last_light: body[:results][:civil_twilight_end],
            dawn: body[:results][:nautical_twilight_begin],
            dusk: body[:results][:nautical_twilight_end],
            solar_noon: body[:results][:solar_noon],
            golden_hour: estimate_golden_hour(body[:results]),
            day_length: body[:results][:day_length],
            timezone: Time.zone.name,
            utc_offset: Time.zone.now.utc_offset / 60
          },
          status: body[:status]
        }
      rescue StandardError => e
        { error: e.message, status: "FAILED" }
      end

      def estimate_golden_hour(results)
        begin
          sunset = Time.zone.parse(results[:sunset])
          (sunset - 1.hour).strftime("%I:%M:%S %p")
        rescue
          nil
        end
      end
    end
  end
end
