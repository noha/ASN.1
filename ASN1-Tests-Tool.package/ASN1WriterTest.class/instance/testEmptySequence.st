as yet unclassified
testEmptySequence
	|  array  |
	array := self 
		encodeToByteArray: (self valueFor: 'EmptySequence')
		withBinding:  'EmptySequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[48 0]).