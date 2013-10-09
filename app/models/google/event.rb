module Google
  class Event
    include ActiveModel::Model

    attr_accessor :token

    attr_accessor :id, :summary, :start_at, :end_at, :calendar_id, :description

    def initialize(attributes = {})
      @summary = attributes["summary"]
      @start_at = attributes["start_at"]
      @end_at = attributes["end_at"]
      @calendar_id = attributes["calendar_id"]
      @description = attributes["description"]
      @token = ENV['TOKEN']
    end

    def parameters
      {
        'calendarId' => URI.encode(@calendar_id)
      }
    end

    def body
      JSON.dump({
        'summary' => @summary,
        'description' => @description,
        'start' => {
          'dateTime' => @start_at['dateTime'].to_datetime.rfc3339
        },
        'end' => {
          'dateTime' => @end_at['dateTime'].to_datetime.rfc3339
        }
      })
    end

    def save
      if self.token.present?
        client = Google::APIClient.new(:application_name => "google_cal",:application_version => "0.0")
        client.authorization.access_token = @token
        service ||= client.discovered_api('calendar', 'v3')
        result = client.execute(
          :api_method => service.events.insert,
          :parameters => parameters,
          :body => body,
          :headers => {'Content-Type' => 'application/json'})
        self.id = JSON.parse(result.body)["id"]
      end
    end
  end
end
