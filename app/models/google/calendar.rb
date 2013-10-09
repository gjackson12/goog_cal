module Google
  class Calendar
    include ActiveModel::Model

    attr_accessor :summary, :id, :time_zone

    def initialize(attributes)
      @summary = attributes["summary"]
      @id = attributes["id"]
      @time_zone = attributes["time_zone"]
    end
  end
end
