@SynapsePay =
  submitFingerprint: ->
    Meteor.call 'synapsepay.submitFingerprint', browserId()

browserId = ->
  localStorage.getItem 'synapsepay.browserId'

unless browserId()
  localStorage.setItem 'synapsepay.browserId', Random.id 30

SynapsePay.submitFingerprint()

Meteor.connection.onReconnect = SynapsePay.submitFingerprint
