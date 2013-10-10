module Google
  class CalendarList
    class << self
      def all(token)
        client = Google::APIClient.new
        client.authorization.access_token = token
        service ||= client.discovered_api('calendar', 'v3')
        result = client.execute(
          :api_method => service.calendar_list.list,
          :parameters => {
            'showHidden' => true
          },
          :headers => {'Content-Type' => 'application/json'})
        JSON.parse(result.response.body)["items"].map do |item|
          Google::Calendar.new(item)
        end
      end

      def calendar_map(token)
        @cal_array = self.all(token)
        @cal_array.inject({}) do |map, calendar|
          map[calendar.summary] = calendar.id
          map
        end
      end

    end
  end
end
