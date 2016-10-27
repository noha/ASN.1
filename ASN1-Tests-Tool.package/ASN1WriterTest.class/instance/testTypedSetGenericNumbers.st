as yet unclassified
testTypedSetGenericNumbers
	|  array  value |
	value := self valueFor: 'ConnectArgV1'.
	value beSelfExpanding.
	value genericNumbers
		addUsing: [:octetString | octetString contents: #[84 04 13]].
	array := self 
		encodeToByteArray: value
		withBinding:  'ConnectArgV1'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: array equals: #[48 7 174 5 4 3 84 4 13].