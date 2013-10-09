require 'spec_helper'

describe Google::Event do
  it 'creates an event' do
    event = Google::Event.new({
      'summary' => 'test from api',
      'start_at' => DateTime.now,
      'end_at' => (DateTime.now + 1.hour),
      'calendar_id' => ENV['GOOGLE_ACCOUNT']
    })
    event.token = ENV['GOOGLE_TOKEN']
    event.save
  end
end
