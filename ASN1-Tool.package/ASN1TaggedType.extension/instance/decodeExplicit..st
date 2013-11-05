*asn1-tool
decodeExplicit: anObject
	"in explicit mode we throw away the surround tag and return the content"
	^ anObject firstElement