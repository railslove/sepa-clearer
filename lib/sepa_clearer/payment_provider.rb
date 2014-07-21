module SepaClearer
  class PaymentProvider
    SERVICES = [:sct, :core, :cor1, :b2b]

    attr_accessor :name, :bic, :sct, :core, :cor1, :b2b

    def initialize(options = {})
      self.name = options[:name]
      self.bic = options[:bic]
      self.sct = options[:sct] || false
      self.core = options[:core] || false
      self.cor1 = options[:cor1] || false
      self.b2b = options[:b2b] || false
    end

    def capabilities
      SERVICES.map { |s| [s, send(s)] }.select { |_,v| v }.map { |k,v| k }
    end

    def to_hash
      {
        name: name,
        bic: bic,
        sct: sct,
        core: core,
        cor1: cor1,
        b2b: b2b,
      }
    end
  end
end
