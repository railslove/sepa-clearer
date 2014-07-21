require 'spec_helper'

describe SepaClearer::DeutscheBundesbank do
  describe '#parse_raw_data' do
    let(:data) { { name: "My Org \n", bic: 'QWERTZ12345', service_sct: '1' } }

    it 'returns a hash' do
      expect(subject.parse_raw_data(data)).to be_kind_of(Hash)
    end

    it 'cleans up the name' do
      expect(subject.parse_raw_data(data)[:name]).to eq('My Org')
    end

    it 'returns the BIC' do
      expect(subject.parse_raw_data(data)[:bic]).to eq('QWERTZ12345')
    end

    it 'maps the capabilities' do
      expect(subject.parse_raw_data(data)[:sct]).to eq(true)
      expect(subject.parse_raw_data(data)[:core]).to eq(false)
      expect(subject.parse_raw_data(data)[:cor1]).to eq(false)
      expect(subject.parse_raw_data(data)[:b2b]).to eq(false)
    end
  end
end
