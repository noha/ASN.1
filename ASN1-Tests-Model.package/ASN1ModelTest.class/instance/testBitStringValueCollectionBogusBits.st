as yet unclassified
testBitStringValueCollectionBogusBits
	|  bitStringValue |
	
	bitStringValue := self bitStringType newValue.
	self
		should: [ bitStringValue contents: #( one five ) ]
		raise: Error.
	