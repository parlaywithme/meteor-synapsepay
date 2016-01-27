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

  @inDevelopment: ->
    @inDevelopment = yes

  @init: (@id, @secret) ->

  @getClient: (method, user_id, opts) ->
    method.connection.synapsepay.client or= new SynapsePay method, user_id, opts

  constructor: (method, @userId, @opts = {}) ->
    @opts.client_id or= SynapsePay.id or Meteor.settings?.synapsepay?.id
    @opts.client_secret or= SynapsePay.secret or Meteor.settings?.synapsepay?.secret

    @opts.ip_address = method?.connection.clientAddress
    @opts.fingerprint = method?.connection.synapsepay.fingerprint

    if SynapsePay.inDevelopment
      @opts.development_mode = yes

    @client = SynapsePayNpm @opts, @userId

    @wrapAsyncAll()

    if @userId and not @opts.dontRefresh
      @refresh()

    method?.connection.synapsepay.client = @

  wrapAsyncAll: ->
    for endpoint, operations of SynapsePay.API
      for operation in operations
        @wrapAsync endpoint, operation

    @http = Meteor.wrapAsync (method, path, cb) =>
      @client.Client[method] path, cb

  wrapAsync: (endpoint, operation) ->
    capital_endpoint = endpoint.charAt(0).toUpperCase() +
      endpoint.slice 1

    makeCall = (args, cb) =>
      @client[capital_endpoint][operation] args..., (response) =>
        invalid_oauth = response.error_code is '110' and
          /oauth_key/.test(response.error.en) and
          @userId

        if invalid_oauth
          # can't use @refresh because it's wrapped
          @client.Users.get
            user_id: @userId
          , ({refresh_token}) =>
            @client.Users.refresh {refresh_token}, =>
              makeCall args, cb

          return

        cb no, response

    @[endpoint][operation] = Meteor.wrapAsync (args..., cb) ->
      makeCall args, cb

  refresh: ->
    {refresh_token} = @users.get
      user_id: @userId

    response = @users.refresh {refresh_token}
    if response.error?.en is 'Fingerprint not verified. Please verify fingerprint via 2FA.'
      phone_number = response.phone_numbers[0]
      @users.refresh {refresh_token, phone_number}
      throw new Meteor.Error 'synapsepay.unverified-fingerprint'

    # now @client.Client.clientOptions.oauth_key is filled in

  users:
    createAndRefresh: (args...) ->
      user = @create args...
      @refresh refresh_token: user.refresh_token
      user

  nodes: {}
  trans: {}
