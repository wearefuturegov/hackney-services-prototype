require 'spec_helper'

RSpec.describe Services do
  
  it 'gets a list of services' do
    expect(Services.all.count).to eq(3)
  end
  
  describe '#find' do
    
    let!(:service) { Services.find('recu31xeI7b56Vbdu') }
    
    it 'has deliverable types' do
      expect(service[:deliverable_types].count).to eq(4)
    end
    
    it 'has a type' do
      expect(service[:type].fields['Label']).to eq('Community group')
    end
    
    it 'has a provider' do
      expect(service[:provider].fields['Name']).to eq('Hackney Marsh Partnership')
    end
    
    it 'has functions' do
      expect(service[:functions].count).to eq(1)
    end
    
    it 'has cost options' do
      expect(service[:cost_options].count).to eq(1)
    end
    
    it 'has attending information' do
      expect(service[:attending_information].count).to eq(1)
    end
    
    it 'has contacts' do
      expect(service[:contacts].count).to eq(1)
    end
    
  end
  
end
