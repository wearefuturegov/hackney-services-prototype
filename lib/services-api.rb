$:.unshift File.dirname(__FILE__)

require 'sinatra/base'
require 'sinatra/json'
require 'httparty'
require 'dotenv'
require 'airrecord'
require 'active_support/core_ext/string/inflections'
require 'table'

Dotenv.load

Airrecord.api_key = ENV['AIRTABLE_API_KEY']
Airrecord::Table.include ServicesAPI::Table

require 'models/services'
require 'models/deliverable_types'
require 'models/service_types'
require 'models/providers'
require 'models/eligibility'
require 'models/functions'
require 'models/cost_options'
require 'models/attending_information'
require 'models/contacts'
require 'models/venues'

module ServicesAPI
  class App < Sinatra::Base
    get '/' do
      redirect '/services'
    end
    
    get '/services' do
      json Services.all.map { |s| s.to_json(:short) }
    end
    
    get '/services/:id' do
      service = Services.all(filter: "{id} = '#{params[:id]}'").first
      json service.to_json
    end
    
    get '/deliverable_types' do
      deliverable_types = {
        deliverable_types: DeliverableTypes.all.map { |s| s.to_json }
      }
      json deliverable_types
    end
    
    get '/deliverable_types/:id' do
      deliverable_type = DeliverableTypes.all(filter: "{id} = '#{params[:id]}'").first
      json deliverable_type.to_json
    end
    
    get '/deliverable_types/:id/services' do
      deliverable_type = DeliverableTypes.all(filter: "{id} = '#{params[:id]}'").first
      services = Services.all(filter: "SEARCH('#{deliverable_type[:id]}', ARRAYJOIN({Deliverable Types}))").map { |s| s.to_json(:short) }
      json services
    end
    
  end
end
