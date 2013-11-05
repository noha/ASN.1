*asn1-tool
encodeExplicit: anObject outerTag: aTag
	"in explicit mode we add another tag around the current tagged value"
	^ ASN1ConstructedTaggedValue new
		add: anObject;
		tag: aTag;
		yourself