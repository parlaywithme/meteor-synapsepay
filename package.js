Package.describe({
  name: 'parlay:synapsepay',
  version: '0.0.1',
  summary: 'synapse_pay_rest for Meteor',
  git: 'https://github.com/parlaywithme/meteor-synapsepay',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.0.2');
  api.use('coffeescript');
  api.addFiles('synapsepay.coffee');
});

Package.onTest(function(api) {
  api.use('coffeescript');
  api.use('mike:mocha-package');
  api.use('parlay:synapsepay');
  api.addFiles('synapsepay-tests.coffee');
});
