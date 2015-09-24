as yet unclassified
testBitStringValueString
	|  bitStringValue |
	
	bitStringValue := self bitStringType newValue.
	bitStringValue contents: '1'.
	self assert: (bitStringValue bits includes: 'one').	
	self assert: bitStringValue binaryStringValue = '1'.
	