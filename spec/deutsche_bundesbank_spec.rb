require 'spec_helper'

describe SepaClearer::DeutscheBundesbank do
  describe '#parse_raw_data' do
    let(:data) { { name: "My Org \n", bic: 'QWERTZ12345', service_sct: '1' } }
    it 'returns an array' do
      expect(subject.parse_raw_data(data)).to eq(['My Org', 'QWERTZ12345', [:sct]])
    end

    it 'cleans up the name' do
      expect(subject.parse_raw_data(data)[0]).to eq('My Org')
    end

    it 'returns the BIC' do
      expect(subject.parse_raw_data(data)[1]).to eq('QWERTZ12345')
    end

    it 'maps the capabilities' do
      expect(subject.parse_raw_data(data)[2]).to eq([:sct])
    end
  end
end
