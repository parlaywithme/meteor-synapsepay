Package.describe({
  name: 'parlay:synapsepay',
  version: '0.0.17',
  summary: 'Wraps and adds to synapse_pay_rest',
  git: 'https://github.com/parlaywithme/meteor-synapsepay',
  documentation: 'README.md'
});

Npm.depends({
  synapse_pay_rest: "0.0.17"
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
  api.use('underscore');
  api.use('mike:mocha-package');
  api.use('parlay:synapsepay');
  api.addFiles('tests.coffee', 'server');
});
