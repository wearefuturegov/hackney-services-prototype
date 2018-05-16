class Contacts < Airrecord::Table
  self.base_key = 'appN5BkQD7FQPkleM'
  self.table_name = 'Contacts'
  
  def to_json
    {
      webpage: self[:webpage],
      email: self[:email],
      phone_number: self[:phone_number],
      contact_person: self[:contact_person],
      contact_person_position: self[:contact_person_position]
    }
  end
end
