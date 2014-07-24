Changelog
=========

v0.2.0
------

* Return list of provided direct debit instruments via PaymentProvider#direct_debit_instruments. The returned list is
  sorted by the speed of the instrument. This way it is possible to select the fastest istrument by calling .first on it

v0.1.0
------

* Replace in-memory datastore with sqlite3 based one. The class api should be
  the same.


v0.0.2
------

* Fix invalid path to data directory

v0.0.1
------

Initial release
