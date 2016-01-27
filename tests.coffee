l = (x...) ->
  console.log y for y in x

user_id = '5625c0d186c27345244db50b'

SynapsePay.init 'id-ce2646b8-23eb-4219-8775-c459b29977bb', 'secret-04936235-c82a-47c8-8fe5-daff8e5d03bc'
SynapsePay.inDevelopment()

# sandbox creds
synapse = new SynapsePay
  connection:
    clientAddress: '1.1.1.1'
    synapsepay:
      fingerprint: 'aaa'

# R08 returned
# achNodeId = '5629b19586c273680d4b1ef4'

achNodeId = '562722af86c2736861713531'
synNodeId = '5627287a86c27368699e55c7'

bobData = {
    "logins" :  [
        {
            "email" :  "javascriptTest@synapsepay.com",
            "password" :  "test1234",
            "read_only" : false
        }
    ],
    "phone_numbers" :  [
        "901.111.1111"
    ],
    "legal_names" :  [
        "bob testuser"
    ],
    "extra" :  {
        "note" :  "Interesting user",
        "supp_id" :  "122eddfgbeafrfvbbb",
        "is_business" :  false
    }
}

bob = bob2 = bob3 = null
# { _id: '5624519386c27302583ce976',
#   _links: { self: { href: 'https://sandbox.synapsepay.com/api/3/users/5624519386c27302583ce976' } },
#   client: { id: 1256, name: 'Parlay Tech' },
#   extra:
#    { date_joined: 1445220755145,
#      is_business: false,
#      supp_id: '122eddfgbeafrfvbbb' },
#   is_hidden: false,
#   legal_names: [ 'bob testuser' ],
#   logins: [ { email: 'javascriptTest@synapsepay.com', read_only: false } ],
#   permission: 'UNVERIFIED',
#   phone_numbers: [ '901.111.1111' ],
#   photos: [],
#   refresh_token: 'refresh-a76412db-63fd-491f-83bd-9041270b78af' }

oauth = null
# { expires_at: '1445228216',
#   expires_in: '7198',
#   oauth_key: 'oauth-cadd6d25-2222-457f-8c89-34cfbcd00b12',
#   refresh_expires_in: 19,
#   refresh_token: 'refresh-9933919b-fdea-4130-a02a-c47442a3a4fc' }

kyc =
  "doc" :
    "birth_day" : 4,
    "birth_month" : 2,
    "birth_year" : 1940,
    "name_first" : "John",
    "name_last" : "doe",
    "address_street1" : "1 Infinite Loop",
    "address_postal_code" : "95014",
    "address_country_code" : "US",
    "document_value" : "3333",
    "document_type" : "SSN"

questions = null
# {
#     "error_code": "10",
#     "http_code": "202",
#     "message": {
#         "en": "Document information submitted. Please answer the attached KBA questions."
#     },
#     "question_set": {
#         "created_at": 1445222614,
#         "expired": false,
#         "id": "562458d633326100030000fa",
#         "livemode": false,
#         "object": "question_set",
#         "person_id": "562458d661666200030000e5",
#         "questions": [
#             {
#                 "answers": [
#                     {
#                         "answer": "New Hampshire",
#                         "id": 1
#                     },
#                     {
#                         "answer": "Maine",
#                         "id": 2
#                     },
#                     {
#                         "answer": "Delaware",
#                         "id": 3
#                     },
#                     {
#                         "answer": "Oregon",
#                         "id": 4
#                     },
#                     {
#                         "answer": "None Of The Above",
#                         "id": 5
#                     }
#                 ],
#                 "id": 1,
#                 "question": "What state was your SSN issued in?"
#             },
#             {
#                 "answers": [
#                     {
#                         "answer": "49532",
#                         "id": 1
#                     },
#                     {
#                         "answer": "49728",
#                         "id": 2
#                     },
#                     {
#                         "answer": "49511",
#                         "id": 3
#                     },
#                     {
#                         "answer": "49230",
#                         "id": 4
#                     },
#                     {
#                         "answer": "None Of The Above",
#                         "id": 5
#                     }
#                 ],
#                 "id": 2,
#                 "question": "Which one of the following zip codes is associated with you?"
#             },
#             {
#                 "answers": [
#                     {
#                         "answer": "Nicole",
#                         "id": 1
#                     },
#                     {
#                         "answer": "Julian",
#                         "id": 2
#                     },
#                     {
#                         "answer": "Jason",
#                         "id": 3
#                     },
#                     {
#                         "answer": "Nathan",
#                         "id": 4
#                     },
#                     {
#                         "answer": "None Of The Above",
#                         "id": 5
#                     }
#                 ],
#                 "id": 3,
#                 "question": "Which one of the following adult individuals is most closely associated with you?"
#             },
#             {
#                 "answers": [
#                     {
#                         "answer": "123 Main St",
#                         "id": 1
#                     },
#                     {
#                         "answer": "902 Grass Lake Rd",
#                         "id": 2
#                     },
#                     {
#                         "answer": "309 Colver Rd",
#                         "id": 3
#                     },
#                     {
#                         "answer": "467 Meridian Rd",
#                         "id": 4
#                     },
#                     {
#                         "answer": "None Of The Above",
#                         "id": 5
#                     }
#                 ],
#                 "id": 4,
#                 "question": "Which one of the following addresses is associated with you?"
#             },
#             {
#                 "answers": [
#                     {
#                         "answer": "812",
#                         "id": 1
#                     },
#                     {
#                         "answer": "904",
#                         "id": 2
#                     },
#                     {
#                         "answer": "832",
#                         "id": 3
#                     },
#                     {
#                         "answer": "605",
#                         "id": 4
#                     },
#                     {
#                         "answer": "None Of The Above",
#                         "id": 5
#                     }
#                 ],
#                 "id": 5,
#                 "question": "Which one of the following area codes is associated with you?"
#             }
#         ],
#         "score": null,
#         "time_limit": 0,
#         "updated_at": 1445222614
#     },
#     "success": true
# }

answers =
  "doc" :
    "answers" : [
      { "question_id" :  1, "answer_id" :  1 },
      { "question_id" :  2, "answer_id" :  1 },
      { "question_id" :  3, "answer_id" :  1 },
      { "question_id" :  4, "answer_id" :  1 },
      { "question_id" :  5, "answer_id" :  1 }
    ]

## NODE

allNodes = null
# { error_code: '0',
#   http_code: '200',
#   node_count: 2,
#   nodes:
#    [ { _id: '5627287a86c27368699e55c7',
#        _links: [Object],
#        allowed: 'CREDIT-AND-DEBIT',
#        extra: [Object],
#        info: [Object],
#        is_active: true,
#        type: 'SYNAPSE-US' },
#      { _id: '5627288186c273686171353f',
#        _links: [Object],
#        allowed: 'CREDIT',
#        extra: [Object],
#        info: [Object],
#        is_active: true,
#        type: 'ACH-US' } ],
#   page: 1,
#   page_count: 1,
#   success: true }


synNodeData =
  "type" : "SYNAPSE-US",
  "info" : {
      "nickname" : "My Synapse Wallet"
  },
  "extra" : {
      "supp_id" : "123sa"
  }

synNode = null
# { error_code: '0',
#   http_code: '200',
#   nodes:
#    [ { _id: '56246f7286c27302583ce986',
#        _links: [Object],
#        allowed: 'CREDIT-AND-DEBIT',
#        extra: [Object],
#        info: [Object],
#        is_active: true,
#        type: 'SYNAPSE-US' } ],
#   success: true }

accountNumbers =
  "type" : "ACH-US",
  "info" : {
      "nickname" : "Ruby Library Savings Account",

      # R08 Payment Stopped
      # "account_num" : "123456789",

      # R10 Customer Advises Not Authorized
      # "account_num" : "123456788",

      # R20 Non-Transaction Account
      # "account_num" : "123456787",

      "account_num" : "72347235423",
      "routing_num" : "051000017",
      "type" : "PERSONAL",
      "class" : "CHECKING"
  },
  "extra" : {
      "supp_id" : "123sa"
  }

achNumberNode = null
# similar to synNode, but allowed: 'CREDIT'

usernamePassword =
  "type" : "ACH-US",
  "info" : {
    "bank_id" : "synapse_good",
    "bank_pw" : "test1234",
    "bank_name" : "fake"
  }

mfaQuestion = null
# { error_code: '10',
#   http_code: '202',
#   mfa:
#    { access_token: '5625b83686c27345244db4f0',
#      message: 'I heard you like questions so we put a question in your question?' },
#   success: true }


achNumberNodeVerified = null
# { _id: '5627224e86c273685db2f6ec',
#   _links: { self: { href: 'https://sandbox.synapsepay.com/api/3/users/5627224786c273685db2f6ea/nodes/5627224e86c273685db2f6ec' } },
#   allowed: 'CREDIT-AND-DEBIT',
#   extra: { supp_id: '123sa' },
#   info:
#    { account_num: '5423',
#      class: 'CHECKING',
#      name_on_account: 'Ruby Library',
#      nickname: 'Ruby Library Savings Account',
#      routing_num: '0017',
#      type: 'PERSONAL' },
#   is_active: true,
#   type: 'ACH-US' }

achLoginNodeVerified = null
# { error_code: '0',
#   http_code: '200',
#   nodes:
#    [ { _id: '562722af86c2736861713531',
#        _links: [Object],
#        allowed: 'CREDIT-AND-DEBIT',
#        extra: [Object],
#        info: [Object],
#        is_active: true,
#        type: 'ACH-US' },
#      { _id: '562722af86c2736861713532',
#        _links: [Object],
#        allowed: 'CREDIT-AND-DEBIT',
#        extra: [Object],
#        info: [Object],
#        is_active: true,
#        type: 'ACH-US' } ],
#   success: true }

txnData = {
    "to" : {
        "type" : "ACH-US",
        "id" : achNodeId
    },
    "amount" : {
      # causes cb SETTLED, then recent_status:
      # "status": "RETURNED", "note": "R01 --- Insufficient Funds...
      # "amount" : 222.22,

      "amount" : 1.10,
      "currency" : "USD"
    },
    "extra" : {
        "supp_id" : "1283764wqwsdd34wd13212",
        "note" : "Deposit to bank account",
        "webhook" : 'http://requestb.in/12t84t51',
        "process_on" : 0,
        "ip" : "192.168.0.1"
    },
    # "fees" : [{
    #     "fee" : 1.00,
    #     "note" : "Facilitator Fee",
    #     "to" : {
    #         "id" : "55d9287486c27365fe3776fb"
    #     }
    # }]
}

achTxn = null
# { _id: '5628019286c2737503307112',
#   _links: { self: { href: 'https://sandbox.synapsepay.com/api/3/users/5628018686c273750330710f/nodes/5628018c86c27375048c36b0/trans/5628019286c2737503307112' } },
#   amount: { amount: 1.1, currency: 'USD' },
#   client: { id: 1256, name: 'Parlay Tech' },
#   extra:
#    { created_on: 1445462418544,
#      ip: '192.168.0.1',
#      latlon: '0,0',
#      note: 'Deposit to bank account',
#      other: {},
#      process_on: 1445548818545,
#      supp_id: '1283764wqwsdd34wd13212',
#      webhook: 'http://requestb.in/1g4vaj81' },
#   fees: [ { fee: 0.2, note: 'Synapse Facilitator Fee', to: [Object] } ],
#   from:
#    { id: '5628018c86c27375048c36b0',
#      nickname: 'Ruby Library Savings Account',
#      type: 'ACH-US',
#      user: { _id: '5628018686c273750330710f', legal_names: [Object] } },
#   recent_status:
#    { date: 1445462418544,
#      note: 'Transaction created',
#      status: 'CREATED',
#      status_id: '1' },
#   timeline:
#    [ { date: 1445462418544,
#        note: 'Transaction created',
#        status: 'CREATED',
#        status_id: '1' } ],
#   to:
#    { id: '562722af86c2736861713531',
#      nickname: 'SynapsePay Test Checking Account',
#      type: 'ACH-US',
#      user: { _id: '562722a586c2736860a71d6e', legal_names: [Object] } } }

synTxn = null
# { _id: '5628026986c27375048c36b7',
#   _links: { self: { href: 'https://sandbox.synapsepay.com/api/3/users/5628025e86c27375048c36b3/nodes/5628026586c27375048c36b5/trans/5628026986c27375048c36b7' } },
#   amount: { amount: 1.1, currency: 'USD' },
#   client: { id: 1256, name: 'Parlay Tech' },
#   extra:
#    { created_on: 1445462633452,
#      ip: '192.168.0.1',
#      latlon: '0,0',
#      note: 'Deposit to bank account',
#      other: {},
#      process_on: 1445549033453,
#      supp_id: '1283764wqwsdd34wd13212',
#      webhook: 'http://requestb.in/1g4vaj81' },
#   fees: [ { fee: 0.2, note: 'Synapse Facilitator Fee', to: [Object] } ],
#   from:
#    { id: '5628026586c27375048c36b5',
#      nickname: 'My Synapse Wallet',
#      type: 'SYNAPSE-US',
#      user: { _id: '5628025e86c27375048c36b3', legal_names: [Object] } },
#   recent_status:
#    { date: 1445462633451,
#      note: 'Transaction created',
#      status: 'CREATED',
#      status_id: '1' },
#   timeline:
#    [ { date: 1445462633451,
#        note: 'Transaction created',
#        status: 'CREATED',
#        status_id: '1' } ],
#   to:
#    { id: '5627287a86c27368699e55c7',
#      nickname: 'Default Synapse Node',
#      type: 'SYNAPSE-US',
#      user: { _id: '5627287a86c27368699e55c6', legal_names: [Object] } } }

describe 'sanity', ->
  it 'is visible', ->
    chai.assert.isDefined SynapsePay

failure = null
# { error: { en: 'Unable to verify document information. Please submit a valid copy of passport/driver\'s license.' },
#   error_code: '400',
#   http_code: '409',
#   success: false }

then_success = null
# { _id: '565fe1dd86c2733694f8ef9d',
#   _links: { self: { href: 'https://sandbox.synapsepay.com/api/3/users/565fe1dd86c2733694f8ef9d' } },
#   client: { id: 1256, name: 'Parlay Tech' },
#   doc_status:
#    { physical_doc: 'SUBMITTED|REVIEWING',
#      virtual_doc: 'SUBMITTED|INVALID' },
#   extra:
#    { date_joined: 1449124317289,
#      extra_security: true,
#      is_business: false,
#      supp_id: '122eddfgbeafrfvbbb' },
#   is_hidden: false,
#   legal_names: [ 'bob testuser' ],
#   logins: [ { email: 'javascriptTest@synapsepay.com', read_only: false } ],
#   permission: 'SEND-AND-RECEIVE',
#   phone_numbers: [ '901.111.1111' ],
#   photos: [],
#   refresh_token: 'refresh-1ea3fbba-9e17-42b9-a7f7-e3c6a97390cf' }

describe 'user fails verification', ->

  @timeout 15 * 1000

  before ->
    synapse.users.createAndRefresh bobData
    doc = _.clone kyc.doc
    doc.document_value = '1111'
    failure = synapse.users.addDoc {doc}

  it 'fails', ->
    chai.assert.isFalse failure.success

  describe 'base64 doc uploads', ->

    before ->
      then_success = synapse.users.addDoc
        doc: attachment: "data:text/csv;base64,SUQsTmFtZSxUb3RhbCAoaW4gJCksRmVlIChpbiAkKSxOb3RlLFRyYW5zYWN0aW9uIFR5cGUsRGF0ZSxTdGF0dXMNCjUxMTksW0RlbW9dIEJlbHogRW50ZXJwcmlzZXMsLTAuMTAsMC4wMCwsQmFuayBBY2NvdW50LDE0MzMxNjMwNTEsU2V0dGxlZA0KNTExOCxbRGVtb10gQmVseiBFbnRlcnByaXNlcywtMS4wMCwwLjAwLCxCYW5rIEFjY291bnQsMTQzMzE2MjkxOSxTZXR0bGVkDQo1MTE3LFtEZW1vXSBCZWx6IEVudGVycHJpc2VzLC0xLjAwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDMzMTYyODI4LFNldHRsZWQNCjUxMTYsW0RlbW9dIEJlbHogRW50ZXJwcmlzZXMsLTEuMDAsMC4wMCwsQmFuayBBY2NvdW50LDE0MzMxNjI2MzQsU2V0dGxlZA0KNTExNSxbRGVtb10gQmVseiBFbnRlcnByaXNlcywtMS4wMCwwLjAwLCxCYW5rIEFjY291bnQsMTQzMzE2MjQ5OCxTZXR0bGVkDQo0ODk1LFtEZW1vXSBMRURJQyBBY2NvdW50LC03LjAwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDMyMjUwNTYyLFNldHRsZWQNCjQ4MTIsS2FyZW4gUGF1bCwtMC4xMCwwLjAwLCxCYW5rIEFjY291bnQsMTQzMTk5NDAzNixTZXR0bGVkDQo0NzgwLFNhbmthZXQgUGF0aGFrLC0wLjEwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDMxODQ5NDgxLFNldHRsZWQNCjQzMTUsU2Fua2FldCBQYXRoYWssLTAuMTAsMC4wMCwsQmFuayBBY2NvdW50LDE0Mjk3NzU5MzcsU2V0dGxlZA0KNDMxNCxTYW5rYWV0IFBhdGhhaywtMC4xMCwwLjAwLCxCYW5rIEFjY291bnQsMTQyOTc3NTQzNCxTZXR0bGVkDQo0MzEzLFNhbmthZXQgUGF0aGFrLC0wLjEwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDI5Nzc1MzY0LFNldHRsZWQNCjQzMTIsU2Fua2FldCBQYXRoYWssLTAuMTAsMC4wMCwsQmFuayBBY2NvdW50LDE0Mjk3NzUyNTAsU2V0dGxlZA0KNDMxMSxTYW5rYWV0IFBhdGhhaywtMC4xMCwwLjAwLCxCYW5rIEFjY291bnQsMTQyOTc3NTAxMyxTZXR0bGVkDQo0MjM1LFtEZW1vXSBCZWx6IEVudGVycHJpc2VzLC0wLjEwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDI5MzMxODA2LFNldHRsZWQNCjQxMzYsU2Fua2FldCBQYXRoYWssLTAuMTAsMC4wMCwsQmFuayBBY2NvdW50LDE0Mjg4OTA4NjMsU2V0dGxlZA0KNDAzMCxTYW5rYWV0IFBhdGhhaywtMC4xMCwwLjAwLCxCYW5rIEFjY291bnQsMTQyODIxNTM5NixTZXR0bGVkDQo0MDE0LFtEZW1vXSBCZWx6IEVudGVycHJpc2VzLC0wLjEwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDI4MTI1MzgwLENhbmNsZWQNCjM4MzIsU2Fua2FldCBQYXRoYWssLTAuMTAsMC4wMCwsQmFuayBBY2NvdW50LDE0MjcxMDc0NzAsU2V0dGxlZA0KMzgyNixTYW5rYWV0IFBhdGhhaywtMC4xMCwwLjAwLCxCYW5rIEFjY291bnQsMTQyNzAzNTM5MixTZXR0bGVkDQozODI1LFNhbmthZXQgUGF0aGFrLC0wLjEwLDAuMDAsLEJhbmsgQWNjb3VudCwxNDI3MDMyOTM3LFNldHRsZWQNCg=="


        # 'data:text/csv;base64,SUQs=='

    it 'succeeds', ->
      chai.assert.equal then_success.permission, 'SEND-AND-RECEIVE'

success = null
# { _id: '5629a61386c27368131d8ce0',
#   _links: { self: { href: 'https://sandbox.synapsepay.com/api/3/users/5629a61386c27368131d8ce0' } },
#   client: { id: 1256, name: 'Parlay Tech' },
#   extra:
#    { date_joined: 1445570067291,
#      is_business: false,
#      supp_id: '122eddfgbeafrfvbbb' },
#   is_hidden: false,
#   legal_names: [ 'bob testuser' ],
#   logins: [ { email: 'javascriptTest@synapsepay.com', read_only: false } ],
#   permission: 'RECEIVE',
#   phone_numbers: [ '901.111.1111' ],
#   photos: [],
#   refresh_token: 'refresh-b73ebea4-7f0e-41b5-b589-b3a91e20b4a6' }

describe 'user validates', ->

  @timeout 15 * 1000

  before ->
    synapse.users.createAndRefresh bobData
    doc = _.clone kyc.doc
    doc.document_value = '2222'
    success = synapse.users.addDoc {doc}

  it 'succeeds', ->
    chai.assert.equal success.permission, 'RECEIVE'

describe 'kba user', ->

  @timeout 15 * 1000

  before ->
    bob = synapse.users.create bobData

  it 'gets single', ->
    user = synapse.users.get {user_id: bob._id}
    chai.assert.equal user._id, bob._id

  it 'gets all', ->
    all = synapse.users.get {}
    chai.assert.isArray all.users
    chai.assert.equal all.error_code, '0'

  it 'gets none', ->
    none = synapse.users.get user_id: 'a'
    chai.assert.equal none.error.en, 'The url is not found.'

  it 'creates', ->
    chai.assert.isString bob._id
    chai.assert.equal bob.legal_names[0], bobData.legal_names[0]

  describe 'with key', ->

    before ->
      oauth = synapse.users.refresh refresh_token: bob.refresh_token

    it 'can get key', ->
      chai.assert.isString oauth.oauth_key

    describe 'with kba', ->

      @timeout 10 * 1000

      before ->
        questions = synapse.users.addDoc kyc
        answers.doc.question_set_id = questions.question_set.id
        bob2 = synapse.users.answerKBA answers

      it 'gets questions', ->
        chai.assert.isString questions.question_set.questions[0].question

      it 'accepts kba answers', ->
        chai.assert.equal bob2.permission, 'RECEIVE'

      describe 'with full permissions', ->

        before ->
          bob3 = synapse.users.attachFile 'https://s3.amazonaws.com/synapse_django/static_assets/marketing/images/synapse_dark.png'

        it 'accepts ID', ->
          chai.assert.equal bob3.permission, 'SEND-AND-RECEIVE'

        describe 'nodes', ->

          before ->
            achNumberNode = synapse.nodes.add accountNumbers
            mfaQuestion = synapse.nodes.add usernamePassword

          it 'lists all', ->
            allNodes = synapse.nodes.get {}
            chai.assert.isTrue allNodes.nodes.length > 0

          it 'creates type synapse', ->
            synNode = synapse.nodes.add synNodeData
            chai.assert.equal synNode.nodes[0].allowed, 'CREDIT-AND-DEBIT'

          it 'creates ach with account number', ->
            chai.assert.equal achNumberNode.nodes[0].allowed, 'CREDIT'

          it 'returns mfa', ->
            chai.assert.isString mfaQuestion.mfa.message

          describe 'verified nodes', ->

            before ->
              achNumberNodeVerified = synapse.nodes.verify achNumberNode.nodes[0]._id,
                micro: [.1, .1]

              achLoginNodeVerified = synapse.nodes.add
                "access_token" : mfaQuestion.mfa.access_token
                "mfa_answer" : "test_answer"

            it 'verifies micro', ->
              chai.assert.equal achNumberNodeVerified.allowed, 'CREDIT-AND-DEBIT'

            it 'verifies login', ->
              for node in achLoginNodeVerified.nodes
                chai.assert.equal node.allowed, 'CREDIT-AND-DEBIT'

            it 'deletes', ->
              response = synapse.nodes.delete achLoginNodeVerified.nodes[0]._id
              chai.assert.isTrue response.success

            describe 'transactions', ->

              @timeout 10 * 1000

              before ->
                achTxn = synapse.trans.create achNumberNodeVerified._id, txnData

                txnData.to =
                  type: 'SYNAPSE-US'
                  id: synNodeId
                txnData.extra.process_on = 1 # process later
                synTxn = synapse.trans.create synNode.nodes[0]._id, txnData

              it 'creates ach', ->
                # l 'achTxn', achTxn
                chai.assert.equal achTxn.recent_status.status, 'CREATED'

              it 'creates syn', ->
                # l 'synTxn', synTxn
                chai.assert.equal synTxn.recent_status.status, 'CREATED'

              # it 'gets one', ->
              #   txn = synapse.trans.get
              #     node_id: achNumberNodeVerified._id
              #     trans_id: achTxn._id
              #   chai.assert.equal txn.trans[0]._id, achTxn._id

# { error_code: '0',
#   http_code: '200',
#   page: 1,
#   page_count: 1,
#   success: true,
#   trans:
#    [ { _id: '56298ca686c2734057a4c5ad',
#        _links: [Object],
#        amount: [Object],
#        client: [Object],
#        extra: [Object],
#        fees: [Object],
#        from: [Object],
#        recent_status: [Object],
#        timeline: [Object],
#        to: [Object] } ],
#   trans_count: 1 }

              it 'gets all', ->
                all = synapse.trans.get node_id: achNumberNodeVerified._id
                chai.assert.isTrue all.success

# { error_code: '0',
#   http_code: '200',
#   page: 1,
#   page_count: 1,
#   success: true,
#   trans:
#    [ { _id: '5628063586c2737509116934',
#        _links: [Object],
#        amount: [Object],
#        client: [Object],
#        extra: [Object],
#        fees: [Object],
#        from: [Object],
#        recent_status: [Object],
#        timeline: [Object],
#        to: [Object] } ],
#   trans_count: 1 }

              it 'updates', ->
                response = synapse.trans.update achNumberNodeVerified._id
                  , achTxn._id
                  , comment: 'hi'

                chai.assert.isTrue /REPLY: hi/.test response.trans.recent_status.note

# { error_code: '0',
#   http_code: '200',
#   success: true,
#   trans:
#    { _id: '562804c886c27374fdd1d7d7',
#      _links: { self: [Object] },
#      amount: { amount: 1.1, currency: 'USD' },
#      client: { id: 1256, name: 'Parlay Tech' },
#      extra:
#       { created_on: 1445463240205,
#         ip: '192.168.0.1',
#         latlon: '0,0',
#         note: 'Deposit to bank account',
#         other: {},
#         process_on: 1445549640205,
#         supp_id: '1283764wqwsdd34wd13212',
#         webhook: 'http://requestb.in/1g4vaj81' },
#      fees: [ [Object] ],
#      from:
#       { id: '562804c486c2737503307116',
#         nickname: 'Ruby Library Savings Account',
#         type: 'ACH-US',
#         user: [Object] },
#      recent_status:
#       { date: 1445463240204,
#         note: 'Transaction created. REPLY: hi',
#         status: 'CREATED',
#         status_id: '1' },
#      timeline: [ [Object] ],
#      to:
#       { id: '562722af86c2736861713531',
#         nickname: 'SynapsePay Test Checking Account',
#         type: 'ACH-US',
#         user: [Object] } } }

              it 'deletes', ->
                txn = synapse.trans.delete synNode.nodes[0]._id
                  , synTxn._id

                chai.assert.equal txn.recent_status.status, 'CANCELED'


# example webhook:
#  {
#     "from": {
#         "type": "ACH-US",
#         "id": {
#             "$oid": "562a9e0886c27366aaa4a3ed"
#         }
#     },
#     "extra": {
#         "ip": "192.168.0.1",
#         "supp_id": "1283764wqwsdd34wd13212",
#         "webhook": "http:\/\/requestb.in\/1i1eyv21",
#         "process_on": {
#             "$date": 1445633548349
#         },
#         "note": "Deposit to bank account",
#         "created_on": {
#             "$date": 1445633548349
#         },
#         "other": null
#     },
#     "timeline": [
#         {
#             "date": {
#                 "$date": 1445633548348
#             },
#             "status": "CREATED",
#             "note": "Transaction created. REPLY: hi",
#             "status_id": "1"
#         },
#         {
#             "date": {
#                 "$date": 1445634302297
#             },
#             "status": "PROCESSING-DEBIT",
#             "note": "Transaction debit being processed.",
#             "status_id": "2"
#         },
#         {
#             "date": {
#                 "$date": 1445637902108
#             },
#             "status": "PROCESSING-CREDIT",
#             "note": "Transaction credit being processed.",
#             "status_id": "3"
#         },
#         {
#             "date": {
#                 "$date": 1445641501560
#             },
#             "status": "SETTLED",
#             "note": "Transaction credit has been made.",
#             "status_id": "4"
#         },
#         {
#             "date": {
#                 "$date": 1445641501658
#             },
#             "status": "RETURNED",
#             "note": "R08 --- Payment Stopped. Money will be pulled back from 5629b19586c273680d4b1ef4",
#             "status_id": "6"
#         }
#     ],
#     "to": {
#         "type": "ACH-US",
#         "id": {
#             "$oid": "5629b19586c273680d4b1ef4"
#         }
#     },
#     "amount": {
#         "currency": "USD",
#         "amount": 1.1
#     },
#     "client": {
#         "id": 1256,
#         "name": "Parlay Tech"
#     },
#     "fees": [
#         {
#             "note": "Synapse Facilitator Fee",
#             "to": {
#                 "id": {
#                     "$oid": "559339aa86c273605ccd35df"
#                 }
#             },
#             "fee": 0.2
#         }
#     ],
#     "_id": {
#         "$oid": "562a9e0c86c27366aaa4a3ee"
#     },
#     "recent_status": {
#         "date": {
#             "$date": 1445641501658
#         },
#         "status": "RETURNED",
#         "note": "R08 --- Payment Stopped. Money will be pulled back from 5629b19586c273680d4b1ef4",
#         "status_id": "6"
#     }
# }
