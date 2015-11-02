# http://docs.synapsepay.com/docs/get-oauth_key-refresh-token#document-types

class DocumentType
  constructor: (@code, @displayText) ->

@SynapsePay.documentTypes =
  SSN: new DocumentType 'SSN', 'Social Security Number (last 4)'
  PASSPORT: new DocumentType 'PASSPORT', 'Passport Number'
  DRIVERS_LICENSE: new DocumentType 'DRIVERS_LICENSE', "Driver's License Number"
  PERSONAL_IDENTIFICATION: new DocumentType 'PERSONAL_IDENTIFICATION', 'Personal Identification Number'

  all: -> [
    @SSN
    @PASSPORT
    @DRIVERS_LICENSE
    @PERSONAL_IDENTIFICATION
  ]

  US: -> [
    @SSN
    @DRIVERS_LICENSE
  ]
