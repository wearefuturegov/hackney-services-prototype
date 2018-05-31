require 'spec_helper'

RSpec.describe ServicesAPI::App do
  
  let(:body) { JSON.parse last_response.body }
  
  describe 'GET /services' do
    
    it 'lists all services' do
      get '/services'
      expect(body.count).to eq(3)
    end
    
    describe 'filtering' do
      
      it 'filters by deliverable type' do
        get '/services?deliverable_types=343'
        expect(body.count).to eq(1)
      end
      
      it 'filters by eligibility' do
        get '/services?eligibilities=1957'
        expect(body.count).to eq(1)
      end
      
      it 'filters by eligibility and deliverable type' do
        get '/services?eligibilities=1957&deliverable_types=343'
        expect(body.count).to eq(1)
      end
      
      it 'filters by multiple things' do
        get '/services?eligibilities=956,958'
        expect(body.count).to eq(1)
      end
      
      it 'does not crap out on unsupported params' do
        get '/services?eligibilities=1957&deliverable_types=343&foo=bar'
        expect(last_response.status).to eq(400)
      end
      
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
