*asn1-tool
encodeTaggedValue: aTaggedValue 
	"encode the type with an explicit tag if present conditionally based
	on the tag environment of the receiver. "
	^ self type 
		encodeTaggedValue: aTaggedValue 
		tagEnvironment: self tagEnvironment 
		outerTag: self tag