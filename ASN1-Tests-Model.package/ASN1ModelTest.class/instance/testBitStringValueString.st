as yet unclassified
testBitStringValueString
	|  bitStringValue |
	
	bitStringValue := self bitStringType newValue.
	bitStringValue contents: '0100'.
	self assert: (bitStringValue bits includes: 'two').	
	self assert: bitStringValue binaryStringValue equals: '0100'.
	