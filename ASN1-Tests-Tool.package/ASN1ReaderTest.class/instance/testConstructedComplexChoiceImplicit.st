as yet unclassified
testConstructedComplexChoiceImplicit
	| result |
	result := self
		readStream:  #[164 6 165 4 131 2 49 49] readStream
		withBinding: 'SequenceWithConstruction'
		tagEnvironment: ASN1ImplicitTags.
		
	self assert: result basicService ext_Teleservice = '11'.
