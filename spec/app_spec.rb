require 'spec_helper'

RSpec.describe ServicesAPI::App do
  
  let(:body) { JSON.parse last_response.body }
  
  describe 'GET /services' do
    
    it 'lists all services' do
      get '/services'
      expect(body.count).to eq(3)
    end
    
  end
  
  describe 'GET /services/:id' do
    
    it 'gets a service' do
      get '/services/4'
      expect(body['name']).to eq('Bikur Cholim')
    end
    
  end
  
  describe 'GET /deliverable_types' do
    
    it 'lists all deliverable types' do
      get '/deliverable_types'
      expect(body.count).to eq(1568)
    end
    
  end
  
  describe 'GET /deliverable_types/:id' do
    
    it 'gets a deliverable type' do
      get '/deliverable_types/242'
      expect(body['name']).to eq('Care at home')
    end
    
  end
  
  describe 'GET /deliverable_types/:id/services' do
    
    it 'gets services for a deliverable type' do
      get '/deliverable_types/242/services'
      expect(body.count).to eq(1)
      expect(body.first['name']).to eq('Bikur Cholim')
    end
    
  end
  
  describe 'GET /eligibilities' do
    
    it 'lists all eligibilities' do
      get '/eligibilities'
      expect(body.count).to eq(2673)
    end
    
  end
  
  describe 'GET /eligibilities/:id' do
    
    it 'gets an eligibility' do
      get '/eligibilities/1957'
      expect(body['name']).to eq('Jewish')
    end
    
  end
  
  describe 'GET /eligibilities/:id/services' do
    
    it 'gets services for a deliverable type' do
      get '/eligibilities/1957/services'
      expect(body.count).to eq(1)
      expect(body.first['name']).to eq('Bikur Cholim')
    end
    
  end
  
end
