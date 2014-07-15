module SepaClearer
  class PaymentProvider
    SERVICES = [:sct, :core, :cor1, :b2b]

    attr_accessor :name, :bic, :capabilities

    def initialize(name, bic, capabilities)
      self.name = name
      self.bic = bic
      self.capabilities = capabilities
    end
  end
end
