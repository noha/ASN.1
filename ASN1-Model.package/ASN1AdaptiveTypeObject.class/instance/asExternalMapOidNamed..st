converting
asExternalMapOidNamed: aString
	^ ASN1AdaptiveTypeExternal new
		oid: (ASN1CurrentModel value bindingNamed: 'map-DialogueAS') value;
		setMap: map