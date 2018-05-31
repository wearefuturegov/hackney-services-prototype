class Eligibilities < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Eligibility'
  
  has_many :services, class: 'Services', column: 'Services'
  
  def to_json
    {
      id: self[:id],
      identifier: self[:identifier],
      name: self[:label],
      description: self[:description],
      url: url
    }
  end
end
