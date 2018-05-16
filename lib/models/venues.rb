class Venues < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Venues'
  
  def to_json
    {
      name: self[:name],
      address: self[:address],
      accessibility_information: self[:accessibility_information]
    }
  end
end
