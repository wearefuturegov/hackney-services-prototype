class AttendingInformation < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Attending Information'
  
  belongs_to :venue, class: 'Venues', column: 'Venue'
end
