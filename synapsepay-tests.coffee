MochaWeb?.testOnly ->
  describe 'sanity', ->
    it 'is visible', ->
      chai.assert.isDefined SynapsePay
