require 'sqlite3'

module SepaClearer
  class Clearer
    attr_accessor :db

    # Make sure we always have the correct order of columns
    ATTRIBUTES = [:name, :bic, :sct, :core, :cor1, :b2b]

    def initialize(db_name = 'deutsche_bundesbank')
      self.db = SQLite3::Database.new File.join(File.dirname(__FILE__), '../..', "data/#{db_name}.db")
    end

    def add(provider)
      data = boolean_to_integers(provider.to_a)
      db.execute "INSERT INTO payment_providers (#{ATTRIBUTES.join(',')}) VALUES (?, ?, ?, ?, ?, ?)", data
    end

    def all
      db.execute("SELECT #{ATTRIBUTES.join(',')} FROM payment_providers ORDER BY name").map do |row|
        PaymentProvider.new(hash_from_result(row))
      end
    end

    def find_by_bic(bic)
      db.execute("SELECT #{ATTRIBUTES.join(',')} FROM payment_providers WHERE bic = ?", normalize_bic(bic)).map do |row|
        PaymentProvider.new(hash_from_result(row))
      end.first
    end

    def normalize_bic(bic)
      bic.to_s.ljust(11, 'X').upcase
    end

    protected

    def hash_from_result(raw_array)
      raw_array_with_boolean = integers_to_boolean(raw_array)
      Hash[ATTRIBUTES.zip(raw_array_with_boolean)]
    end

    def boolean_to_integers(array)
      array.map do |element|
        if element.kind_of?(TrueClass) || element.kind_of?(FalseClass)
          element ? 1 : 0
        else
          element
        end
      end
    end

    def integers_to_boolean(array)
      array.map do |element|
        if element.kind_of?(Integer)
          element == 1
        else
          element
        end
      end
    end
  end
end
