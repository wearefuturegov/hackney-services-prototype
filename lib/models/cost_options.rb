class CostOptions < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Cost Options'
  
  def to_json
    {
      name: self[:cost_option],
      amount: self[:amount]
    }
  end
end
