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
      begin
        services = Services.all_as_json
        services = filter_services(services) unless params.keys.length.zero?
        json services
      rescue
        response = {
          response_code: 400,
          errors: 'There was something wrong with your request. Please try again.'
        }
        status 400
        json response
      end
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
    
    def filter_services(services)
      services.select do |s|
        match = false
        params.each do |k,v|
          match = (s[k.to_sym].map { |i| i[:id].to_s } & v.split(',')).length > 0
        end
        match
      end
    end
    
  end
end
