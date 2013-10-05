as yet unclassified
testReadLongDefiniteForm
	| length |
	length := (BERLength parseFrom: { 130 . 1 . 2 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 258. 