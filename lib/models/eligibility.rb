class Eligibility < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Eligibility'
  
  def to_json
    {
      id: self[:identifier],
      name: self[:label],
      description: self[:description]
    }
  end
end
