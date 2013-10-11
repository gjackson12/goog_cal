require 'spec_helper'

describe Google::CalendarList do

  it 'retrieves a list' do
    list = Google::CalendarList.all(ENV['TOKEN'])
    expect(list.first).to be_kind_of(Google::Calendar)
  end

  it 'maps a calendar summary and calendar id' do
    list = Google::CalendarList.map(ENV['TOKEN'])
    expect(list.map).to be_kind_of(Hash)
    expect(list.map.values).to_not be_blank    
  end 
  
end
