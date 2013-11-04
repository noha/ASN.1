*asn1-tool
encodeImplicit: anObject outerTag: aTag
	"choices are always explicit"
	^ self encodeExplicit: anObject outerTag: aTag