as yet unclassified
testParseExtendedNumber
	| identifier |
	identifier := BERIdentifier parseFrom: { 63 . 129 . 3 } readStream.
	self assert: identifier tag clazzIdentifier = 0.
	self assert: identifier isConstructed.
	self assert: identifier tag number = 131.