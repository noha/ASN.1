visiting
visitTaggedType: aTaggedType 
	"tag the type based on the existance of an explicit tag and itsaTaggedType
	tag environment"
	^ aTaggedType encodeTaggedValue: (self visit: aTaggedType type)