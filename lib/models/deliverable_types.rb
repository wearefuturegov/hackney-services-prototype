class DeliverableTypes < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Deliverable Types'
  
  def to_json
    {
      name: self[:label],
      description: self[:description]
    }
  end
end
