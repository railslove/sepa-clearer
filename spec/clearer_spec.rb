require 'spec_helper'

describe SepaClearer::Clearer do
  describe '#all' do
    it 'returns an array of payment providers' do
      expect(subject.all.first).to be_kind_of(SepaClearer::PaymentProvider)
    end
  end

  describe '#find_by_bic' do
    it 'returns the provider with the given BIC' do
      expect(subject.find_by_bic('AABAFI22TMS')).to be_kind_of(SepaClearer::PaymentProvider)
    end

    it 'returns nil if no object matches the BIC' do
      expect(subject.find_by_bic('MYTHINGY')).to eq(nil)
    end

    it 'normalizes the bic before searching' do
      allow(subject).to receive(:normalize_bic).and_return('AAA')
      expect(subject.find_by_bic('MYTHINGY')).to eq(nil)
      expect(subject).to have_received(:normalize_bic)
    end

    it 'returns an initialize object' do
      expect(subject.find_by_bic('AABAFI22TMS').name).to eq('BANK OF ALAND PLC')
    end
  end

  describe '#normalize_bic' do
    it 'makes all letters uppercase' do
      expect(subject.normalize_bic('lowercaseid')).to eq('LOWERCASEID')
    end

    it 'always uses 11 letter BICs' do
      expect(subject.normalize_bic('SHORT')).to eq('SHORTXXXXXX')
    end

    it 'handles nil values' do
      expect(subject.normalize_bic(nil)).to eq('XXXXXXXXXXX')
    end
  end
end
