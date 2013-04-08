as yet unclassified
assert: anObject hasTagClassNumber: aClassNumber number: aNumber constructed: aBoolean
	self assert: anObject tag clazzIdentifier = aClassNumber .
	self assert: anObject tag number = aNumber.
	self assert: anObject isConstructed  = aBoolean.
