as yet unclassified
testParse
	| identifier |
	identifier := BERIdentifier parseFrom: { 106 } readStream.
	self assert: identifier tag clazzIdentifier = 1.
	self assert: identifier isConstructed.
	self assert: identifier tag number = 10.