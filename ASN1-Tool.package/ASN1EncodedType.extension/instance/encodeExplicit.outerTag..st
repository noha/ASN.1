*asn1-tool
encodeExplicit: anObject outerTag: aTag
	^ ASN1ConstructedTaggedValue new
		add: anObject;
		tag: aTag;
		yourself