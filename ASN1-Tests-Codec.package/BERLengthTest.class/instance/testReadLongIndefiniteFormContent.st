tests
testReadLongIndefiniteFormContent
	| length value |
	length := (BERLength parseFrom: { 128 } readStream).
	value := length readFrom: { 1 . 2 . 3. 0. 0 } readStream.
	self assert: value = #[ 1  2  3 ]