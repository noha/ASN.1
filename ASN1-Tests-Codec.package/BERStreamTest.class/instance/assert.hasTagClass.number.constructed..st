as yet unclassified
assert: anObject hasTagClass: aClassNumber number: aNumber constructed: aBoolean
	self assert: anObject tag clazz = aClassNumber .
	self assert: anObject tag number = aNumber.
	self assert: anObject isConstructed  = aBoolean.
