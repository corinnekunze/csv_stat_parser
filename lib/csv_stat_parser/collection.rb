module CsvStatParser
  class Collection < Array
    def initialize
      @records = self
    end

    def find_records(attributes, values)
      return matching_records(attributes, values) unless attributes.is_a?(Array) ||
                                                         values.is_a?(Array)

      # Initializing a new array to push items into
      # Using Collection class so we can further scope if necessary
      new_collection = CsvStatParser::Collection.new

      %w(attributes values).each do |type|
        # alternative to 'eval' to get values from type string
        type_values = binding.local_variable_get(type)
        next unless type_values.is_a?(Array)
        type_values.map do |value|
          matches = find_match_by_type(type, value, attributes, values)
          collect_records(matches, new_collection)
        end
      end

      new_collection
    end

    def matching_records(attribute, value)
      select { |record| record.send(attribute) == value }
    end

    private

    def find_match_by_type(type, value, attributes, values)
      if type == 'attributes'
        matching_records(value, values)
      else
        matching_records(attributes, value)
      end
    end

    # Pushes matching records into a new collection unless they are already in there
    def collect_records(matches, new_collection)
      matches.each do |match|
        next if new_collection.matching_records('record_id', match.record_id).length > 1
        new_collection.push(match)
      end
    end
  end
end
