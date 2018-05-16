class Functions < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Functions'
  
  def to_json
    {
      name: self[:label],
      description: self[:description]
    }
  end
end
