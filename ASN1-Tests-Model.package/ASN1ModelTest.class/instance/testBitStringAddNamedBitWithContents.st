as yet unclassified
testBitStringAddNamedBitWithContents
	|  bitStringValue |
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue contents: '100'.
	bitStringValue addNamedBit: 'two'.
	self assert: (bitStringValue namedBits includes: 'one').	
	self assert: (bitStringValue namedBits includes: 'two').	
	self deny: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '1100'.
	