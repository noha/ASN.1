*asn1-tool
encodeImplicit: anObject
	"choices are always explicit"
	^ self encodeExplicit: anObject