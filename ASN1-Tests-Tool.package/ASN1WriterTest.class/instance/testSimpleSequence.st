as yet unclassified
testSimpleSequence
	| data array   |
	data := (self bindingAt: 'SimpleSequence') newValue.
	data
		at: 'first' put: 13;
		at: 'second' put:  'DEADBEEF'.
	array := self 
		encodeToByteArray: data
		withBinding:  'SimpleSequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[48 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).