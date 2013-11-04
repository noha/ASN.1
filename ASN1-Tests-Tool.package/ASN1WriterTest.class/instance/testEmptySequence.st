as yet unclassified
testEmptySequence
	| data array  |
	data := ASN1Dictionary new.
	array := self 
		encodeToByteArray: data
		withBinding:  'EmptySequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[163 0]).