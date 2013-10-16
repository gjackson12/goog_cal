module Google
  class Event
    include ActiveModel::Model

    attr_accessor :id, :summary, :start_at, :end_at, :google_calendar_id, :description, :token

    def initialize(token, attributes = {})
      @summary = attributes["summary"]
      @start_at = attributes["start_at"]
      @end_at = attributes["end_at"]
      @calendar_id = attributes["calendar_id"]
      @description = attributes["description"]
      @token = token
    end

    def save
      if self.token.present?
        client = Google::APIClient.new(:application_name => "goog_cal",:application_version => "0.0")
        client.authorization.access_token = @token
        service ||= client.discovered_api('calendar', 'v3')
        result = client.execute(
          :api_method => service.events.insert,
          :parameters => parameters,
          :body => body,
          :headers => {'Content-Type' => 'application/json'})
        self.id = JSON.parse(result.body)["id"]
        return self.id.present?
      else
        return false
      end
    end

    protected
    def parameters
      {
        'calendarId' => @calendar_id.to_s
      }
    end

    def body
      JSON.dump({
        'summary' => @summary,
        'description' => @description,
        'start' => {
          'dateTime' => @start_at.rfc3339
        },
        'end' => {
          'dateTime' => @end_at.rfc3339
        }
      })
    end
  end
end
