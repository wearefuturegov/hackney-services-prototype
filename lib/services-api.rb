$:.unshift File.dirname(__FILE__)

require 'sinatra/base'
require 'sinatra/json'
require 'httparty'
require 'dotenv'
require 'airrecord'
require 'active_support/core_ext/string/inflections'

Dotenv.load

Airrecord.api_key = ENV['AIRTABLE_API_KEY']

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

class ServicesAPI < Sinatra::Base
  get '/' do
    redirect '/services'
  end
  
  get '/services' do
    services = {
      services: Services.all.map { |s| s.to_json(:short) }
    }
    json services
  end
  
  get '/services/:id' do
    service = Services.all(filter: "{id} = '#{params[:id]}'").first
    json service.to_json
  end
end
