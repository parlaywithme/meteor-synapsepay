`meteor add parlay:synapsepay`

Wraps and adds to [SynapsePay](synapsepay.com)'s API V3 node library [synapse_pay_rest](https://github.com/synapsepay/SynapsePayRest-Node).

- [Setup](#setup)
  - [getClient](#getclient)
  - [Keys](#keys)
  - [User](#user)
- [Flow](#flow)
  - [Create users](#create-users)
  - [Create accounts](#create-accounts)
    - [Account numbers](#account-numbers)
    - [Username password](#username-password)
  - [Transactions](#transactions)
    - [Create](#create)
    - [Receive updates](#receive-updates)
- [Example data](#example-data)
- [Constants](#constants)
  - [Document types](#document-types)
  - [Banks](#banks)
- [Dev](#dev)
  - [Test](#test)

Endpoints, arguments, and responses mirror the [V3 REST API](http://docs.synapsepay.com/v3.1).

## Setup

### getClient

`SynapsePay.getClient method, userId, opts`

All arguments are optional, although usually you'll want to include `method`.

- `method`: The method context (`this` inside of a `Meteor.methods` function).
- `userId`: The SynapsePay id of the user (not `Meteor.userId()`)
- `opts`: Optional object that may have the following keys:
  - `client_id` and `client_secret`: if you don't use one of the global configuration methods below
  - `fingerprint`: if you want to override the random client id that this package generates and keeps in LocalStorage and on the `connection`
  - `dontRefresh`: see [user](#user) section
  - Any other fields that you would pass to `SynapsePayNpm`

The first time you call `getClient`, it creates a new Synapse client. After that, if you're on the same Meteor client connection, it reuses the Synapse client.

If you need to save method context to use at a later time, the only fields you need to save are:

```
{
  connection: {
    clientAddress,
    synapsepay: {
      fingerprint: 'foo'
    }
  }
}   
```

### Keys

There are three options for setting your SynapsePay `client_id` and `client_secret`:

```coffeescript
# 1. settings.json
{
  "synapsepay": {
    "id": "fakeid"
    "secret": "fakesecret"
  }
}
# then in code:
client = SynapsePay.getClient method, userId

# 2. global init function
SynapsePay.init('fakeid', 'fakesecret')
client = SynapsePay.getClient method, userId

# 3. include in opts
client = SynapsePay.getClient method, userId, 
  client_id: 'fakeid'
  client_secret: 'fakesecret'
  ...
```

### User

When hitting a `nodes.*` or `transactions.*` endpoint, the `client` must be created with a user id, and it must have requested an oauth token. Retrieving an oauth token is done automatically for you. If you'd like to do this yourself, use the `dontRefresh: true` option:

```
client = SynapsePay.getClient method, userId, 
  ...
  dontRefresh: true

user = client.users.get user_id: userId
client.users.refresh refresh_token: user.refresh_token
```

## Flow

- [Create users](#create-users)
- [Create accounts](#create-accounts)
  - [Account numbers](#account-numbers)
  - [Username password](#username-password)
- [Transactions](#transactions)
  - [Create](#create)
  - [Receive updates](#receive-updates)

### Create users

```coffeescript
synapse = SynapsePay.getClient method

user = synapse.users.create userData
synapse.users.refresh refresh_token: user.refresh_token
# now `synapse` will send user's id and oauth_key in headers of subsequent
# requests

user = synapse.users.addDoc kyc
if not user.success
  synapse.users.attachFile governmentID
else if response.question_set?
  user = synapse.users.answerKBA answers
  # user.permission is 'RECEIVE'
else
  # user.permission is 'RECEIVE'

# if you need user to have SEND permissions (be able to debit from their bank
# account)
user = synapse.users.attachFile picOrGovernmentID
# now user.permission will be 'SEND-AND-RECEIVE'
```

### Create accounts

Aka nodes. Sometimes these requests can take a few seconds to return, because SynapsePay has to hit slow bank APIs before they can respond to you.

#### Account numbers

```coffeescript
response = synapse.nodes.add accountNumbers
node = response.nodes[0]
# node.allowed should be 'CREDIT'

# after two business days, prompt user to enter microdeposits
response = synapse.nodes.verify node._id, micro: [.1,.1]
node = response.nodes[0]
# node.allowed should be 'CREDIT-AND-DEBIT'
```

#### Username password

```coffeescript
response = synapse.nodes.add usernamePassword
if response.mfa?
  mfaQuestion = response
  response = synapse.nodes.add
    access_token: mfaQuestion.mfa.access_token
    mfa_answer: 'test_answer'

# response.nodes has all accounts under that usernamePassword, each with
# 'CREDIT-AND-DEBIT' permissions
```

### Transactions

#### Create

```coffeescript
txnData.to =
  type: 'ACH-US'
  id: toNode._id

txnData.extra.webhook = 'www.myapp.com/synapse/transactions'

txn = synapse.trans.create fromNode._id, txnData
```

#### Receive updates

Using package `simple:json-routes`:

```coffeescript
JsonRoutes.add 'post', '/synapse/transactions', (req, res, next) ->
  txn = req.body
  signature = req.headers['x-synapse-signature']
  hash = new SynapsePay().client.Client.createHMAC txn

  unless signature is hash
    throw new Meteor.Error 'bad-sig'

  ...

  JsonRoutes.sendResult res, 200
```

## Example data

See example arguments and response data in [tests.coffee](https://github.com/parlaywithme/meteor-synapsepay/blob/master/tests.coffee)

## Constants

### Document types

```coffeescript
SynapsePay.documentTypes =
  SSN:
    code: 'SSN'
    displayText: 'Social Security Number (last 4)'
  ...

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
```

### Banks

If you're not using their [bank login widget](https://synapsepay.com/examples/linkbank), then you'll need the list of banks they support:

```coffeescript
SynapsePay.banks = [
  {
    code: "bofa"
    name: "Bank of America"
    logo:
      file: "bofa"
      url: "https://s3.amazonaws.com/synapse_django/bank_logos/bofa.png"
  }
  ...
]
```

Helper functions:

```
SynapsePay.banks.get code: 'bofa'
SynapsePay.banks.get name: 'Bank of America'
SynapsePay.banks.isValid code: 'bofa'
```

## Dev

### Test

```
meteor create testapp
cd testapp
mkdir packages
cd packages
git clone git@github.com:parlaywithme/meteor-synapsepay.git
cd ..
meteor add parlay:synapsepay
meteor test-packages --driver-package velocity:console-reporter parlay:synapsepay
```

Then reload `localhost:3000` to run tests - output in server console. Some logged errors are expected (409 and 404).
