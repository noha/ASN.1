X.681 grammar
optionalExtensionMarker
	^ super optionalExtensionMarker ==> [:nodes|
		"ASN1OptionalExtensionMarkerNode new "
		nodes ]