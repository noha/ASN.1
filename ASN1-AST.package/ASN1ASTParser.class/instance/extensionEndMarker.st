X.680 grammar
extensionEndMarker
	^ super extensionEndMarker ==> [:nodes|
		ASN1ExtensionEndMarkerNode new ]