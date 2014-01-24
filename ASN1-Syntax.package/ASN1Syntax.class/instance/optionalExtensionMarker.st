X.681 grammar
optionalExtensionMarker
	"spec:
		OptionalExtensionMarker ::= ',' '...' | empty"
	^ (($, asParser trim , '...' asParser trim) ==> [:nodes| 
		nodes second ]) optional