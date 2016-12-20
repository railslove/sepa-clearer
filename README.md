# SepaClearer

Check capabilities of european payment providers who participate in the SEPA
system. The gem currently supports only "Deutsche Bundesbank" as a clearer. You
can fetch all providers and their capabilities or fetch only a unique provider
by his BIC.

The gem comes with a sqlite3 database which contains all data. In order to access
it, you need to have sqlite3 installed.

__Last data update: 2016-12-20__

## Installation

Add this line to your application's Gemfile:

    gem 'sepa_clearer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sepa_clearer


## Usage
    require 'sepa_clearer'

    # Create a new cleaer instance
    clearer = SepaClearer::Clearer.new

    # Fetch all payment providers
    clearer.all
    # => [<PaymentProvider: …>, <PaymentProvider: …>]

    # Fetch a single provider by his identifier code. The BIC is normalized (uppercase and 11 letters filled with X)
    provider = clearer.find_by_bic('DEIRGENDWAS')
    # => <PaymentProvider: @bic="DEIRGENDWAS", @name="YOUR PROVIDER", @sct=false, @core=true, @cor1=true, @b2b=false>

    # Get all capabilities
    provider.capabilities
    # => [:core, :cor1]


## Update clearer list

Run ```bin/update_data``` from your command line. The script should fetch the
latest data and replace the clearer lists with the new data.

If the script fails, check if the urls have changed. You should find the data here:
http://www.bundesbank.de/Navigation/EN/Tasks/Payment_systems/SEPA/SCL_Directory/scl_directory.html


## Contributing

1. Fork it ( https://github.com/railslove/sepa-clearer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
