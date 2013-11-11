*asn1-tool
encodeTaggedValue: aTaggedValue outerTag: aTag 
	"in explicit mode we add another tag around the current tagged value"
	^ ASN1ConstructedTaggedValue new
		add: aTaggedValue;
		tag: aTag;
		yourself