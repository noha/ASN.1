as yet unclassified
testBitStringValueCollection
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue namedBits: #( one three ).
	self assert: (bitStringValue namedBits includes: 'one').	
	self assert: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '1010'.
	