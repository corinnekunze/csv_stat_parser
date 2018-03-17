require 'spec_helper'

describe CsvStatParser::Parser do
  include_examples 'shared_headers'
  let(:parser) { CsvStatParser::Parser.new(survey_headers) }

  describe '#parse' do
    context 'when headers provided' do
      subject { parser.parse('spec/fixtures/survey_sample.csv') }

      it 'will overwrite csv headers' do
        expect(subject.last.send(survey_headers.first)).to_not eq(nil)
      end
    end

    context 'when headers not provided' do
      let(:parser) { CsvStatParser::Parser.new }
      subject { parser.parse('spec/fixtures/basic.csv') }

      it 'will return csv headers' do
        expect(subject.first.first_name).to_not eq(nil)
      end
    end
  end
end
