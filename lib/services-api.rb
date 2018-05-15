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
      services: Services.all.map do |s|
        {
          id: s[:id],
          name: s.fields['Name'],
          url: "#{ENV['API_BASE']}/services/#{s[:id]}"
        }
      end
    }
    json services
  end
  
  get '/services/:id' do
    service = Services.all(filter: "{id} = '#{params[:id]}'").first
    response = {
      id: service[:id],
      name: service[:name],
      type: service[:type][:label],
      contacts: service[:contacts].map do |c|
        {
          webpage: c[:webpage],
          email: c[:email],
          phone_number: c[:phone_number],
          contact_person: c[:contact_person],
          contact_person_position: c[:contact_person_position]
        }
      end,
      provider: {
        name: service[:provider][:name],
        home_page: service[:provider][:home_page]
      },
      eligibility: service[:eligibility]&.map do |e|
        {
          id: e[:identifier],
          name: e[:label],
          description: e[:description]
        }
      end || [],
      deliverable_types: service[:deliverable_types].map do |t|
        {
          name: t[:label],
          description: t[:description]
        }
      end,
      functions: service[:functions].map do |t|
        {
          name: t[:label],
          description: t[:description]
        }
      end,
      cost_options: service[:cost_options]&.map do |i|
        {
          name: i[:cost_option],
          amount: i[:amount]
        }
      end || [],
      attending_information: service[:attending_information]&.map do |i|
        {
          days: i[:days],
          opens: i[:opens],
          closes: i[:closes],
          description: i[:description],
          venue: {
            name: i[:venue][:name],
            address: i[:venue][:address],
            accessibility_information: i[:venue][:accessibility_information]
          }
        }
      end || []
    }
    json response
  end
end
