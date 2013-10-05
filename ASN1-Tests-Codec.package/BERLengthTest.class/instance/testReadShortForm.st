as yet unclassified
testReadShortForm
	| length |
	length := (BERLength parseFrom: { 38 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 38. 