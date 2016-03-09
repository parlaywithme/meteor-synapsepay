Meteor.methods
  'synapsepay.submitFingerprint': (fingerprint) ->
    @connection.synapsepay or= {}
    @connection.synapsepay.fingerprint = fingerprint
    @unblock()
    SynapsePay.submitFingerprint? fingerprint
