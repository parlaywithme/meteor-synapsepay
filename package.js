Package.describe({
  name: 'parlay:synapsepay',
  version: '0.0.14',
  summary: 'synapse_pay_rest for Meteor',
  git: 'https://github.com/parlaywithme/meteor-synapsepay',
  documentation: 'README.md'
});

Npm.depends({
  synapse_pay_rest: "0.0.14"
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.0.2');
  api.use('coffeescript');
  api.addFiles([
    'lib/synapsepay.coffee',
    'lib/banks.coffee'
  ], 'server');
  // TODO why does this cause it to be undefined?
  // api.export('SynapsePay', 'server');
});

Package.onTest(function(api) {
  api.use('coffeescript');
  api.use('mike:mocha-package');
  api.use('parlay:synapsepay');
  api.addFiles('tests.coffee', 'server');
});
