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
require 'models/eligibilities'
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
      json Services.all_as_json
    end
    
    get '/services/:id' do
      json Services.find_by_id(params[:id]).to_json
    end
    
    get '/deliverable_types' do
      json DeliverableTypes.all_as_json
    end
    
    get '/deliverable_types/:id' do
      json DeliverableTypes.find_by_id(params[:id]).to_json
    end
    
    get '/deliverable_types/:id/services' do
      json DeliverableTypes.find_by_id(params[:id])[:services].map { |s| s.to_json }
    end
    
    get '/eligibilities' do
      json Eligibilities.all_as_json
    end
    
    get '/eligibilities/:id' do
      json Eligibilities.find_by_id(params[:id]).to_json
    end
    
    get '/eligibilities/:id/services' do
      json Eligibilities.find_by_id(params[:id])[:services].map { |s| s.to_json }
    end
    
  end
end
