require 'spec_helper'

describe Google::EventUpdate do
  it 'updates an already existing event' do
    event = Google::Event.new(ENV['GOOGLE_TOKEN'],{
      'summary' => 'test from api',
      'start_at' => DateTime.now,
      'end_at' => (DateTime.now + 1.hour),
      'calendar_id' => "dan.m.mccoy@gmail.com",
      'description' => "Swedish Fish"
    })   
    event.save
    prev_sum = event.summary
    update_event = Google::EventUpdate.new(event.id, 'dan.m.mccoy@gmail.com', ENV['GOOGLE_TOKEN'],{
      'summary' => 'newer test from api',
      'start_at' => DateTime.now,
      'end_at' => (DateTime.now + 1.hour),
      'calendar_id' => "dan.m.mccoy@gmail.com",
      'description' => "Swedish Fish"
    })
    update_event.update

    expect(summary).to_not eql(prev_sum)

  end
  
end