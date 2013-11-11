as yet unclassified
testConstructedComplexChoiceImplicit
	| result |
	result := self
		readStream:  #[164 5 165 3 131 1 17] readStream
		withBinding: 'SequenceWithConstruction'
		tagEnvironment: ASN1ImplicitTags.
		
	self assert: result basicService ext_Teleservice = '11'.
