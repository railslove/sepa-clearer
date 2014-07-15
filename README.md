# SepaClearer

Check capabilities of european payment providers who participate in the SEPA
system. The gem currently supports only "Deutsche Bundesbank" as a clearer. You
can fetch all providers and their capabilities or fetch only a unique provider
by his BIC.

Currently the gem fetches all data into memory which can be quite heavy. You
might want to store it in your local database for quick and easy access.


## Installation

Add this line to your application's Gemfile:

    gem 'sepa-clearer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sepa-clearer


## Usage

    # Create a new cleaer instance
    clearer = SepaClearer::Clearer.new('DeutscheBundesbank')

    # Fetch all payment providers
    clearer.all
    # => [<PaymentProvider: …>, <PaymentProvider: …>]

    # Fetch a single provider by his identifier code. The BIC is normalized (uppercase and 11 letters filled with X)
    clearer.find_by_bic('DEIRGENDWAS')
    # => <PaymentProvider: @bic="DEIRGENDWAS", @name="Your Provider", @supports=[:core, :cor1]>


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
