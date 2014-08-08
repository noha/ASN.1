as yet unclassified
testSimpleSequence
	| data array  model |
	model := self modelBindingValue: 'SimpleSequence'.
	data := ASN1Dictionary new
			at: 'first' put: 13;
			at: 'second' put:  'DEADBEEF';
			yourself.
	array := self 
		encodeToByteArray: data
		withBinding:  'SimpleSequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[48 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).