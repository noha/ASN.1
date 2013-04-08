as yet unclassified
testSimpleSequence
	| data array encoded model |
	model := self modelBindingValue: 'SimpleSequence'.
	data := ASN1Dictionary new
			at: 'first' put: 13;
			at: 'second' put:  'DEADBEEF';
			yourself.
	array := self 
		encodeToByteArray: data
		withBinding:  'SimpleSequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[48 9 2 1 13 4 4 222 173 190 239]).