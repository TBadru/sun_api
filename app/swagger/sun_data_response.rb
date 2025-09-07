class SunDataResponse
  include Swagger::Blocks

  swagger_schema :SunDataResponse do
    key :required, [ :results, :status ]

    property :results do
      key :'$ref', :SunDataResult
    end

    property :status, type: :string
  end

  swagger_schema :SunDataResult do
    key :required, [
      :date,
      :sunrise,
      :sunset,
      :first_light,
      :last_light,
      :dawn,
      :dusk,
      :solar_noon,
      :golden_hour,
      :day_length,
      :timezone,
      :utc_offset
    ]

    property :date,        type: :string, format: :date
    property :sunrise,     type: :string
    property :sunset,      type: :string
    property :first_light, type: :string
    property :last_light,  type: :string
    property :dawn,        type: :string
    property :dusk,        type: :string
    property :solar_noon,  type: :string
    property :golden_hour, type: :string
    property :day_length,  type: :string
    property :timezone,    type: :string
    property :utc_offset,  type: :integer
  end
end
