require 'spec_helper'

RSpec.describe AttendingInformation do
  
  let!(:attending_information) { AttendingInformation.find('recasUrBFaaeYTaVo') }

  it 'has a venue' do
    expect(attending_information[:venue].fields['Name']).to eq('Clapton Park Tenant Management Organisation')
  end
  
end
