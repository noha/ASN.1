as yet unclassified
testComplexChoiceImplicit
	| data array |
	data := (self bindingAt: 'ComplexChoice') newValue beSelfExpanding.
	data one
		first: 13;
		second: 'DEADBEEF'.
	array := self 
		encodeToByteArray: data
		withBinding:  'ComplexChoice'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[97 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).