require 'csv'

module SepaClearer
  class DeutscheBundesbank
    CAPABILITIES_MAPPING = {
                        service_sct: :sct,
                        service_sdd: :core,
                        service_cor1: :cor1,
                        service_b2b: :b2b
                      }

    def data(file = nil)
      @data ||= begin
        [].tap do |data|
          CSV.foreach(file || default_data_file, { headers: true, col_sep: ';', header_converters: :symbol }) do |row|
            data.push PaymentProvider.new(*parse_raw_data(row))
          end
        end
      end
    end

    def parse_raw_data(data)
      [
        data[:name].strip.chomp,
        data[:bic],
        CAPABILITIES_MAPPING.map { |key, service| data[key] == '1' ? service : nil }.compact
      ]
    end

    def default_data_file
      File.join(File.dirname(__FILE__), '../..', 'data/deutsche_bundesbank.csv')
    end
  end
end
