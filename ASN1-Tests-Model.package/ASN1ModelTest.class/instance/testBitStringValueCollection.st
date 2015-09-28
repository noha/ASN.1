as yet unclassified
testBitStringValueCollection
	|  bitStringValue |
	
	bitStringValue := self bitStringType newValue.
	bitStringValue contents: #( one three ).
	self assert: (bitStringValue bits includes: 'one').	
	self assert: (bitStringValue bits includes: 'three').	
	self assert: bitStringValue binaryStringValue = '0101'.
	