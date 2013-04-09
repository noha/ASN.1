*asn1-tool
encodeExplicit: anObject
	^ self isExplicitlyTagged 
		ifTrue: [
			ASN1ConstructedEncoding new
				add: anObject;
				tag: self explicitTag;
				yourself ]
		ifFalse: [ anObject ]