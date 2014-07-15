require 'spec_helper'

describe SepaClearer::PaymentProvider do
  describe '.new' do
    subject(:provider) { described_class.new('Testorg', 'SOMEVALIDID', [:core]) }

    it 'sets the proper name' do
      expect(provider.name).to eq('Testorg')
    end

    it 'sets the proper BIC' do
      expect(provider.bic).to eq('SOMEVALIDID')
    end

    it 'sets the proper capabilities' do
      expect(provider.capabilities).to eq([:core])
    end
  end
end
