module ServicesAPI
  module Table
    
    def self.included(klass)
      klass.extend ClassMethods
    end
    
    def url
      [
        ENV['API_BASE'],
        self.class.table_name.pluralize.parameterize.underscore.downcase,
        self[:id]
      ].join('/')
    end
    
    module ClassMethods
      def all_as_json
        all.map { |s| s.to_json }
      end
      
      def find_by(query)
        all(query)&.first || nil
      end
      
      def find_by_id(id)
        find_by(filter: "{id} = '#{id}'")
      end
    end
    
  end
end
