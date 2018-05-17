class DeliverableTypes < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Deliverable Types'
  
  has_many :services, class: 'Services', column: 'Services'
  
  def to_json
    {
      name: self[:label],
      description: self[:description],
      url: url
    }
  end
end
