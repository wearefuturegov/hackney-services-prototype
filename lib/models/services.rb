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
  
  def get_association(association)
    self[association]&.map { |a| a.to_json } || []
  end
  
  def to_json(format = :long)
    if format == :long
      {
        id: self[:id],
        name: self[:name],
        type: self[:type][:label],
        contacts: get_association(:contacts),
        provider: self[:provider].to_json,
        eligibility: get_association(:eligibility),
        deliverable_types: get_association(:deliverable_types),
        functions: get_association(:functions),
        cost_options:get_association(:cost_options),
        attending_information: get_association(:attending_information)
      }
    else
      {
        id: self[:id],
        name: self[:name],
        url: url
      }
    end
  end
end
