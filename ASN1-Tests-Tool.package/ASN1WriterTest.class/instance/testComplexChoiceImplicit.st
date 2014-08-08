as yet unclassified
testComplexChoiceImplicit
	| data array |
	data := ASN1Dictionary new
		at: 'one' put: (ASN1Dictionary new
			at: 'first' put: 13;
			at: 'second' put: 'DEADBEEF';
			yourself);
		yourself.
	array := self 
		encodeToByteArray: data
		withBinding:  'ComplexChoice'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[97 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).