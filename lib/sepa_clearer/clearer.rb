module SepaClearer
  class Clearer
    def initialize(clearer = 'DeutscheBundesbank')
      @klass = SepaClearer.const_get(clearer).new
    end

    def all
      @klass.data
    end

    def find_by_bic(bic)
      normalized_bic = normalize_bic(bic)
      @klass.data.find { |provider| provider.bic == normalized_bic }
    end

    def normalize_bic(bic)
      bic.to_s.ljust(11, 'X').upcase
    end
  end
end
