l = (x...) ->
  console.log y for y in x

userId = '5623ec5786c27348d5b9c799'

# sandbox creds
s = new SynapsePay
  client_id: 'id-ce2646b8-23eb-4219-8775-c459b29977bb'
  client_secret: 'secret-04936235-c82a-47c8-8fe5-daff8e5d03bc'
  development_mode: yes
  fingerprint: 'a'
  ip_address: '1.1.1.1'
, userId

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

bob = null
bob2 = null
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

achNodeNumberData =
  "type" : "ACH-US",
  "info" : {
      "nickname" : "Ruby Library Savings Account",
      "name_on_account" : "Ruby Library",
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

achNodeLoginData =
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
achLoginNodeVerified = null

describe 'sanity', ->
  it 'is visible', ->
    chai.assert.isDefined SynapsePay

describe 'users', ->

  before ->
    bob = s.users.create bobData

  it 'gets single', ->
    user = s.users.get {userId}
    chai.assert.equal user._id, userId

  it 'gets all', ->
    all = s.users.get {}
    chai.assert.isArray all.users
    chai.assert.equal all.error_code, '0'

  it 'gets none', ->
    none = s.users.get userId: 'a'
    chai.assert.equal none.error.en, 'The url is not found.'

  it 'creates', ->
    chai.assert.isString bob._id
    chai.assert.equal bob.legal_names[0], bobData.legal_names[0]

  describe 'with key', ->

    before ->
      oauth = s.users.refresh refresh_token: bob.refresh_token

    it 'can get key', ->
      chai.assert.isString oauth.oauth_key

    describe 'with kba questions', ->

      before ->
        questions = s.users.addDoc kyc

      it 'gets questions', ->
        chai.assert.isString questions.question_set.questions[0].question

      it 'accepts kba answers', ->
        answers.doc.question_set_id = questions.question_set.id
        user = s.users.answerKBA answers
        chai.assert.equal user.permission, 'RECEIVE'

      describe 'with full permissions', ->

        @timeout 6 * 1000

        before ->
          bob2 = s.users.attachFile 'https://s3.amazonaws.com/synapse_django/static_assets/marketing/images/synapse_dark.png'

        it 'accepts ID', ->
          chai.assert.equal bob2.permission, 'SEND-AND-RECEIVE'
          l bob2

        describe 'nodes', ->

          before ->
            achNumberNode = s.nodes.add achNodeNumberData
            mfaQuestion = s.nodes.add achNodeLoginData

          it 'lists all', ->
            # l s.nodes.get null
            0

          it 'creates type synapse', ->
            synNode = s.nodes.add synNodeData
            chai.assert.equal synNode.nodes[0].allowed, 'CREDIT-AND-DEBIT'

          it 'creates ach with account number', ->
            chai.assert.equal achNumberNode.nodes[0].allowed, 'CREDIT'

          it 'returns mfa', ->
            chai.assert.isString mfaQuestion.mfa.message

          describe 'verified nodes', ->

            # @timeout 10 * 1000

            before ->
              l achNumberNode
              achNumberNodeVerified = s.nodes.verify achNumberNode.nodes[0]._id,
                micro: [.1, .1]

              # achLoginNodeVerified = s.nodes.verify
              #   "access_token" : mfaQuestion.mfa.access_token
              #   "mfa_answer" : "test_answer"

              # l achLoginNodeVerified

            it 'verifies micro', ->
              # l 'micro', achNumberNodeVerified
              chai.assert.equal yes, yes

            # it 'verifies login', ->
            #   l 'login', achLoginNodeVerified
