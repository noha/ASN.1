tests
testReadLongIndefiniteForm
	| length |

	length := (BERLength parseFrom: { 128 } readStream).
	self assert: length hasDefiniteForm = false.
	self assert: length contentLength = nil.

	length := (BERLength parseFrom: { 127 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 127.
	
