require 'spec_helper'

describe Google::Event do
  it 'creates an event' do
    event = Google::Event.new(ENV['GOOGLE_TOKEN'],{
      'summary' => 'test from api',
      'start_at' => DateTime.now,
      'end_at' => (DateTime.now + 1.hour),
      'calendar_id' => "dan.m.mccoy@gmail.com",
      'description' => "Swedish Fish"
    })   
    event.save
  end

  # if I create an event, I should get a calendar id in return
  #

  it 'if I create an event, I should get a calendar id in return' do
    event = Google::Event.new(ENV['GOOGLE_TOKEN'],{
      'summary' => 'test from api',
      'start_at' => DateTime.now,
      'end_at' => (DateTime.now + 1.hour),
      'calendar_id' => "dan.m.mccoy@gmail.com",
      'description' => "Swedish Fish"
    })
    event.save
    expect(event.id).to_not eql(nil)
  end

end