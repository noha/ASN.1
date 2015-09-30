*asn1-tool
writeEncodedValue: anEncodedValue withTag: aTag 
	"in explicit mode we add another tag around the current tagged value"
	^ ASN1EncodedConstructedValue new
		add: anEncodedValue;
		tag: aTag;
		yourself