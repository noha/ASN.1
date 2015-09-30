*asn1-tool
encodeTaggedValue: aTaggedValue 
	"a tagged type consists of an inner tag and an outer tag. While encoding
	the tag environment indicates if both tags are encoded (explicit) or if 
	the outer tag overwrites the inner tag (implicit)"
	^ type 
		encodeTaggedValue: aTaggedValue 
		tagEnvironment: self tagEnvironment 
		outerTag: tag