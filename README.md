`meteor add parlay:synapsepay`

Wraps and adds to [SynapsePay](synapsepay.com)'s V3 node library [synapse_pay_rest](https://github.com/synapsepay/SynapsePayRest-Node).

1. [Use](#use)
  1. [Example data](#example-data)
  1. [Flow](#flow)
    1. [Create users](#create-users)
    1. [Create accounts](#create-accounts)
      1. [Account numbers](#account-numbers)
      1. [Username password](#username-password)
  1. [Make transactions](#make-transactions)
  1. [Banks](#banks)
1. [Dev](#dev)
  1. [Test](#test)

# Use

Endpoints, arguments, and responses mirror the [V3 REST API](http://docs.synapsepay.com/v3.1).

## Example data

See example arguments and response data in [tests.coffee](https://github.com/parlaywithme/meteor-synapsepay/blob/master/tests.coffee)

## Flow

### Create users

```coffeescript
synapse = new SynapsePay opts

user = synapse.users.create userData
synapse.users.refresh refresh_token: user.refresh_token
# now `synapse` will send user's id and oauth_key in headers of subsequent
# requests

response = synapse.users.addDoc kyc
if response says invalid kyc
  synapse.users.attachFile governmentID
else if response has KBA questions
  user = synapse.users.answerKBA answers
  # if user.permission isn't 'RECEIVE', repeat KBA

# if you need user to have SEND permissions (be able to debit from their bank
# account)
user = synapse.users.attachFile picOrGovernmentID
# now user.permission will be 'SEND-AND-RECEIVE'
```

### Create accounts

(aka Nodes)

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
mfaQuestion = synapse.nodes.add usernamePassword
response = synapse.nodes.add
  access_token: mfaQuestion.mfa.access_token
  mfa_answer: 'test_answer'

# response.nodes has all accounts under that usernamePassword, each with
# 'CREDIT-AND-DEBIT' permissions
```

### Make transactions

```coffeescript
txnData.to =
  type: 'ACH-US'
  id: toNode._id

txn = synapse.trans.create fromNode._id, txnData

# get transaction status updates at the webhook URL you provided with
# txnData.extra.webhook
```

## Banks

If you're not using their [bank login widget](https://synapsepay.com/examples/linkbank), then you'll need the list of banks they support:

```coffeescript
@SynapsePay.banks = [
  {
    code: "bofa"
    name: "Bank of America"
    logo: "https://s3.amazonaws.com/synapse_django/bank_logos/bofa.png"
  }
  ...
]
```

# Dev

## Test

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

Then reload `localhost:3000` to run tests - output in server console.
