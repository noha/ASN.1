accessing
nextPutPrimitive: aPrimitiveTaggedValue
	aPrimitiveTaggedValue hasContent ifTrue: [
		stream nextPutAll: aPrimitiveTaggedValue contents asByteArray ]