class Services < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Service'
  
  has_many :deliverable_types, class: 'DeliverableTypes', column: 'Deliverable Types'
  has_many :functions, class: 'Functions', column: 'Functions'
  has_many :cost_options, class: 'CostOptions', column: 'Cost Options'
  has_many :attending_information, class: 'AttendingInformation', column: 'Attending Information'
  has_many :eligibility, class: 'Eligibility', column: 'Eligibility'
  has_many :contacts, class: 'Contacts', column: 'Contacts'
  
  belongs_to :type, class: 'ServiceTypes', column: 'Type'
  belongs_to :provider, class: 'Providers', column: 'Provider'
end
