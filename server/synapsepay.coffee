@l = (x...) ->
  console.log y for y in x

@SynapsePayNpm = Npm.require 'synapse_pay_rest'

class @SynapsePay
  @API:
    users: [
      'create'
      'get'
      'refresh'
      'addDoc'
      'answerKBA'
      'attachFile'
    ]

    nodes: [
      'add'
      'get'
      'verify'
      'delete'
    ]

    trans: [
      'create'
      'get'
      'update'
      'delete'
    ]

  @init: (@id, @secret) ->

  constructor: (@opts, @userId) ->
    {
      @client_id
      @client_secret
      @oauth_key
      @fingerprint
      @ip_address
      @development_mode
    } = @opts

    @client_id or= SynapsePay.id or Meteor.settings?.synapsepay?.id
    @client_secret or= SynapsePay.secret or Meteor.settings?.synapsepay?.secret

    @client = SynapsePayNpm @opts, @userId

    @wrapAsyncAll()

  wrapAsyncAll: ->
    for endpoint, operations of SynapsePay.API
      for operation in operations
        @wrapAsync endpoint, operation

  wrapAsync: (endpoint, operation) ->
    capital_endpoint = endpoint.charAt(0).toUpperCase() +
      endpoint.slice 1

    @[endpoint][operation] = Meteor.wrapAsync (args..., cb) ->
      @client[capital_endpoint][operation] args..., (response) ->
        cb no, response
    , @

  users:
    createAndRefresh: (args...) ->
      user = @create args...
      @refresh refresh_token: user.refresh_token

  nodes: {}
  trans: {}
