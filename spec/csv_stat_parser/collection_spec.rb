require 'spec_helper'

describe CsvStatParser::Collection do
  include_examples 'shared_headers'
  let(:parser) { CsvStatParser::Parser.new(survey_headers) }
  let(:collection) { parser.parse('spec/fixtures/survey_sample.csv') }

  describe '#find_records' do
    it 'returns matching records' do
      records = collection.find_records('male', '1')
      expect(records.map(&:male).uniq).to .eq(['1'])
    end

    context 'when multiple values' do
      it 'returns matching records' do
        one_count = collection.find_records('leadership_position', '1').size
        two_count = collection.find_records('leadership_position', '2').size
        three_count = collection.find_records('leadership_position', '3').size
        all = collection.find_records('leadership_position', ['1', '2', '3']).size
        expect(all).to eq(one_count + two_count + three_count)
      end
    end

    context 'when multiple attributes' do
      it 'returns matching records' do
        male = collection.find_records('male', '1').size
        female = collection.find_records('female', '1').size
        both = collection.find_records(['male', 'female'], '1').size
        expect(both).to eq(male + female)
      end
    end
  end
end
