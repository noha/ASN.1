*asn1-tool
decodeImplicit: anObject
	"choices are always explicit"
	^ self decodeExplicit: anObject