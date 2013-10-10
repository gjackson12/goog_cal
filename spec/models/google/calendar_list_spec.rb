require 'spec_helper'

describe Google::CalendarList do
  it 'retrieves a list' do
    list = Google::CalendarList.all(ENV['GOOGLE_TOKEN'])
    expect(list.first).to be_kind_of(Google::Calendar)
  end
end
