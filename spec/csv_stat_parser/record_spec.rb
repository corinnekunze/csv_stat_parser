require 'spec_helper'

describe CsvStatParser::Record do
  let(:data) { { apples: '3', oranges: '6'} }
  let(:record) { CsvStatParser::Record.new(data, 5) }

  describe '#initialize' do
    context 'when id provided' do
      it 'assigns id successfully' do
        expect(record.record_id).to eq('5')
      end
    end

    context 'when id is not provided' do
      let(:record) { CsvStatParser::Record.new(data, nil) }
      it 'it returns nil' do
        expect(record.record_id).to eq(nil)
      end
    end
  end

  describe '#set' do
    it 'changes attribute value' do
      record.set('apples', '20')
      expect(record.apples).to eq('20')
    end
  end
end
