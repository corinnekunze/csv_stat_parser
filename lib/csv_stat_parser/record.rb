require 'smarter_csv'

module CsvStatParser
  class Record
    def initialize(data, id)
      # Adds record_id to beginning of data set
      @data = {record_id: id.to_s}.merge(data)
      assign_attributes
    end

    def set(attribute, value)
      send("#{attribute}=", value)
    end

    private

    def assign_attributes
      @data.each do |attribute, value|
        define_setter(attribute)
        define_getter(attribute)
        set(attribute, value)
      end
    end

    def define_setter(attribute)
      create_method( "#{attribute}=".to_sym) { |set_value| instance_variable_set("@#{attribute}", set_value) }
    end

    def define_getter(attribute)
      create_method(attribute.to_sym) { instance_variable_get("@#{attribute}") }
    end

    def create_method(header, &block)
      self.class.send(:define_method, header, &block)
    end
  end
end
