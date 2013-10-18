require 'spec_helper'

describe Google::CalendarList do

  it 'retrieves a list' do
    list = Google::CalendarList.all(ENV["GOOGLE_TOKEN"])
    expect(list.first).to be_kind_of(Google::Calendar)
  end

  it 'maps a calendar summary and calendar id' do
    list = Google::CalendarList.calendar_map(ENV["GOOGLE_TOKEN"])
    expect(list.map).to be_kind_of(Enumerator)
    expect(list.map).to_not be_blank    
  end 
  
end
