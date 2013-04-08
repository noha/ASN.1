as yet unclassified
encodeToByteArray: anObject withBinding: aString tagEnvironment: aTagEnvironment
	| binding |
	binding := self bindingAt: aString.
	self
		useTagEnvironment: aTagEnvironment
		for: binding 
		during: [
			^ ASN1
				encodeToByteArray: anObject
				usingType: binding ]