as yet unclassified
readStream: aStream withBinding: aString tagEnvironment: aTagEnvironment
	| binding |
	binding := self bindingAt: aString.
	self 
		useTagEnvironment: aTagEnvironment  
		for: binding 
		during: [
			^ ASN1
				readEncodedFrom:  aStream 
				usingType: binding ]