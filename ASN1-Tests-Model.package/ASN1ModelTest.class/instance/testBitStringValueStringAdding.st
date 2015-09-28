as yet unclassified
testBitStringValueStringAdding
	|  bitStringValue |
	
	bitStringValue := self bitStringType newValue.
	bitStringValue contents: '0010'.
	bitStringValue contents: '0100'.
	self deny: (bitStringValue bits includes: 'two').	
	self assert: (bitStringValue bits includes: 'three').	
	self assert: bitStringValue binaryStringValue = '0100'.
	