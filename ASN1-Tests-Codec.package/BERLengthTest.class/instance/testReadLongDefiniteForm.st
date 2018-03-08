tests
testReadLongDefiniteForm
	| length |
	length := (BERLength parseFrom: { 130 . 1 . 2 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 258. 

	length := (BERLength parseFrom: { 16r81. 16r7F } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 127.

	length := (BERLength parseFrom: { 16r81. 16r80 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 128.