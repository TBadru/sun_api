module Api
  module V1
    class SunDataController < ApplicationController
      include Swagger::Blocks

      swagger_path "/sun_data" do
        operation :get do
          key :summary, "Get sunrise/sunset info"
          key :description, "Returns sunrise, sunset, and related time data for a given date and location"
          key :produces, [ "application/json" ]
          key :tags, [ "Sun Data" ]

          parameter :lat do
            key :name, :lat
            key :in, :query
            key :description, "Latitude of the location"
            key :required, true
            key :type, :number
          end

          parameter :lng do
            key :name, :lng
            key :in, :query
            key :description, "Longitude of the location"
            key :required, true
            key :type, :number
          end

          parameter :date do
            key :name, :date
            key :in, :query
            key :description, "Date in YYYY-MM-DD format"
            key :required, false
            key :type, :string
            key :format, :date
          end

          response 200 do
            key :description, "Successful response"
            schema do
              key :'$ref', :SunDataResponse
            end
          end
        end
      end

      def show
        @data = {
          results: {
            date: params[:date] || Date.today.to_s,
            sunrise: "7:06:58 AM",
            sunset: "4:48:45 PM",
            first_light: "5:32:42 AM",
            last_light: "6:23:02 PM",
            dawn: "6:37:39 AM",
            dusk: "5:18:04 PM",
            solar_noon: "11:57:52 AM",
            golden_hour: "4:07:57 PM",
            day_length: "9:41:47",
            timezone: "America/New_York",
            utc_offset: -300
          },
          status: "OK"
        }

        respond_to do |format|
          format.json
        end
      end
    end
  end
end
