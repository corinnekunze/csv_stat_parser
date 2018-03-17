module CsvStatParser
  class Record
    def initialize(data, id)
      # Adds record_id to beginning of data set
      @data = id_hash(id).merge(data)
      assign_attributes
    end

    def set(attribute, value)
      instance_variable_set("@#{attribute}", value)
    end

    private

    # Set attr_acessor sets getter/setter for attribute name
    # Then set new instance variable with value
    def assign_attributes
      @data.each do |attribute, value|
        self.class.send(:attr_accessor, attribute)
        set(attribute, value)
      end
    end

    def id_hash(id)
      { record_id: id ? id.to_s : id }
    end
  end
end
