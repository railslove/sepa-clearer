require 'spec_helper'

describe SepaClearer::PaymentProvider do
  describe '.new' do
    subject(:provider) { described_class.new(name: 'Testorg', bic: 'SOMEVALIDID') }

    it 'sets the proper name' do
      expect(provider.name).to eq('Testorg')
    end

    it 'sets the proper BIC' do
      expect(provider.bic).to eq('SOMEVALIDID')
    end

    it 'does not set any capabilities' do
      expect(provider.capabilities).to eq([])
    end
  end

  describe '#capabilities' do
    subject(:provider) { described_class.new(sct: true, core: false, cor1: true, b2b: true) }

    it 'returns all capabilities' do
      expect(provider.capabilities).to eq([:sct, :cor1, :b2b])
    end
  end

  describe '#to_hash' do
    subject(:provider) { described_class.new(name: 'test', bic: 'bic', sct: true, core: false, cor1: true, b2b: true) }

    it 'returns a hash' do
      expect(provider.to_hash).to be_kind_of(Hash)
    end

    it 'sets correct values' do
      expect(provider.to_hash).to match({
        name: 'test',
        bic: 'bic',
        sct: true,
        core: false,
        cor1: true,
        b2b: true
      })
    end
  end
end
