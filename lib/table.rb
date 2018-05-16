module ServicesAPI
  module Table
    
    def url
      [
        ENV['API_BASE'],
        self.class.table_name.pluralize.parameterize.underscore.downcase,
        self[:id]
      ].join('/')
    end
    
  end
end
