module CsvStatParser
  class Parser
    attr_accessor :headers

    def initialize(headers)
      @headers = headers
      initialize_attributes
    end

    # add all headers to class
    def initialize_attributes
      @headers.each do |header|
        self.assign_attr(header)
      end

      self.create_attr('record_id')
    end

    def assign_attr(header)
      create_method( "#{header}=".to_sym) { |val| instance_variable_set("@" + header, val) }

      create_method(header.to_sym) { instance_variable_get("@" + header) }
    end

    def create_method(name, &block)
      self.class.send(:define_method, name, &block)
    end

  end
end
