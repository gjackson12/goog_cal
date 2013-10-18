 module Google
  class Event
    include ActiveModel::Model

    attr_accessor :id, :summary, :start_at, :end_at, :google_calendar_id, :description, :token

    def initialize(token, attributes = {}, event_id = nil , calendar_id = nil)
      @event_id = event_id
      @calendar_id = calendar_id
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
        if !persisted?
          binding.pry
          result = client.execute(
            :api_method => service.events.insert,
            :parameters => parameters,
            :body => body,
            :headers => {'Content-Type' => 'application/json'})
          self.id = JSON.parse(result.body)["id"]
          return self.id.present?
        else
          binding.pry
          result = client.execute(
            :api_method => service.events.patch,
            :parameters => parameters,
            :body => body,
            :headers => {'Content-Type' => 'application/json'})
        end
      else
        return false
      end
    end

    protected
    def persisted?
      @event_id.present?
    end

    def parameters
      if !persisted?
        {
          'calendarId' => @calendar_id.to_s
        }
      else
        {
          'calendarId' => @calendar_id.to_s,
          'eventId' => @event_id
        }
      end
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
