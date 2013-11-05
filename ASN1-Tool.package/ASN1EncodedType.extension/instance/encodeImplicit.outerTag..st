*asn1-tool
encodeImplicit: anObject outerTag: aTag 
	"in implicit mode the given tag replaces the tag of the current tagged value"
	^ anObject tag: aTag