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

      def calendar_parser
        @cal_array = self.all(ENV['TOKEN'])
        @hash = {}
        @cal_array.each_with_index do |calendar, index|
          @hash[calendar.summary] = calendar.id
        end
        return @hash
      end

    end
  end
end
