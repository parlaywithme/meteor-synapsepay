# from https://synapsepay.com/api/v3/institutions/show
#
# in order of size
# https://en.wikipedia.org/wiki/List_of_largest_banks_in_the_United_States
#
# TODO order by # of customers with checking accounts

@SynapsePay.banks = [
  {
    code: "bofa"
    name: "Bank of America"
    logo:
      file: "bofa"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/bofa.png"
  }
  {
    code: "chase"
    name: "Chase"
    logo:
      file: "chase"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/chase.png"
  }
  {
    code: "citi"
    name: "Citibank"
    logo:
      file: "citi"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/citi.png"
  }
  {
    code: "wells"
    name: "Wells Fargo"
    logo:
      file: "wells_fargo"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/wells_fargo.png"
  }
  {
    code: "capone360"
    name: "Capital One 360"
    logo:
      file: "cap360"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/cap360.png"
  }
  {
    code: "pnc"
    name: "PNC"
    logo:
      file: "pnc"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/pnc.png"
  }
  {
    code: "td"
    name: "TD Bank"
    logo:
      file: "td"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/td.png"
  }
  {
    code: "bbt"
    name: "BB&T Bank"
    logo:
      file: "bbt"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/bbt.png"
  }
  {
    code: "suntrust"
    name: "SunTrust"
    logo:
      file: "suntrust"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/suntrust.png"
  }
  {
    code: "ally"
    name: "Ally"
    logo:
      file: "ally"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/ally.png"
  }
  {
    code: "schwab"
    name: "Charles Schwab"
    logo:
      file: "charles_schwab"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/charles_schwab.png"
  }
  {
    code: "fidelity"
    name: "Fidelity"
    logo:
      file: "fidelity"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/fidelity.png"
  }
  {
    code: "regions"
    name: "Regions"
    logo:
      file: "regionsbank"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/regionsbank.png"
  }
  {
    code: "us"
    name: "US Bank"
    logo:
      file: "usbank"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/usbank.png"
  }
  {
    code: "usaa"
    name: "USAA"
    logo:
      file: "usaa"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/usaa.png"
  }
  {
    code: "firsttennessee"
    name: "First Tennessee"
    logo:
      file: "first_tn"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/first_tn.png"
  }
]

@SynapsePay.banks.get = (term) ->
  return unless term

  if typeof term is 'string'
    term = code: term

  check term, Match.OneOf
    code: String
  ,
    name: String

  if term.code is 'fake'
    bank = _.clone @[0]
    bank.code = 'fake'
    bank.name = 'Fake testing bank'
    bank
  else
    _.findWhere @, term

@SynapsePay.banks.isValid = (term) ->
  !! @get term
