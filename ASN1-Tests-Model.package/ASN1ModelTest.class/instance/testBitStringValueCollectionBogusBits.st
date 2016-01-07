as yet unclassified
testBitStringValueCollectionBogusBits
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	self
		should: [ bitStringValue contents: #( one five ) ]
		raise: Error.
	