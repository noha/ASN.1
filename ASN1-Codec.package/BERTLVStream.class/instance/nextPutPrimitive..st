accessing
nextPutPrimitive: anEncodedPrimitive
	anEncodedPrimitive hasContent ifTrue: [
		stream nextPutAll: anEncodedPrimitive contents asByteArray ]