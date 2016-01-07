as yet unclassified
testBitStringValueStringAdding
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue contents: '0100'.
	bitStringValue contents: '0010'.
	self deny: (bitStringValue namedBits includes: 'two').	
	self assert: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '0010'.
	