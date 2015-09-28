as yet unclassified
testBitStringValueString
	|  bitStringValue |
	
	bitStringValue := self bitStringType newValue.
	bitStringValue contents: '0010'.
	self assert: (bitStringValue bits includes: 'two').	
	self assert: bitStringValue binaryStringValue = '0010'.
	