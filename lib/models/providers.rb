class Providers < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Provider'
  
  def to_json
    {
      name: self[:name],
      home_page: self[:home_page]
    }
  end
end
