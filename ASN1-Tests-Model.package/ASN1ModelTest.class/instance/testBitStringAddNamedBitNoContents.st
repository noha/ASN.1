as yet unclassified
testBitStringAddNamedBitNoContents
	|  bitStringValue |

	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue addNamedBit: 'two'.
	self assert: (bitStringValue namedBits includes: 'two').	
	self deny: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '0100'.
	