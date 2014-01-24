X.681 grammar
optionalExtensionMarker
	^ super optionalExtensionMarker ==> [:nodes|
		nodes ifNotNil: [  
			ASN1ExtensionNode new  ]]