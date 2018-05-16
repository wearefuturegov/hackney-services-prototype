class AttendingInformation < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Attending Information'
  
  belongs_to :venue, class: 'Venues', column: 'Venue'
  
  def to_json
    {
      days: self[:days],
      opens: self[:opens],
      closes: self[:closes],
      description: self[:description],
      venue: self[:venue].to_json
    }
  end
end
