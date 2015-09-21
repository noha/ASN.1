as yet unclassified
testComplexChoiceExplicit
	| data array  |
	data := (self bindingAt: 'ComplexChoice') newValue beSelfExpanding.
	data one
		first: 13;
		second: 'DEADBEEF'.
	array := self 
		encodeToByteArray: data
		withBinding:  'ComplexChoice'
		tagEnvironment: ASN1ExplicitTags. 
	self assert: (array = #[97 15 48 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).