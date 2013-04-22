*asn1-tool
encodeExplicit: anObject
	^ self isExplicitlyTagged 
		ifTrue: [
			ASN1ConstructedTaggedValue new
				add: anObject;
				tag: self explicitTag;
				yourself ]
		ifFalse: [ anObject ]