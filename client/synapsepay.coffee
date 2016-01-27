@SynapsePay = {}

browserId = ->
  localStorage.getItem 'synapsepay.browserId'

submitFingerprint = ->
  Meteor.call 'synapsepay.submitFingerprint', browserId()


unless browserId()
  localStorage.setItem 'synapsepay.browserId', Random.id 20

submitFingerprint()

Meteor.connection.onReconnect = submitFingerprint
