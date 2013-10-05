as yet unclassified
testReadLongIndefiniteForm
	| length |
	length := (BERLength parseFrom: { 128 } readStream).
	self assert: length hasDefiniteForm = false.
	self assert: length contentLength = nil. 