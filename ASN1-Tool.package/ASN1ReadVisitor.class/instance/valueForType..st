accessing
valueForType: aType
	fieldFactories 
		at: aType 
		ifPresent: [ :val | ^ self objectFactory newInstance: val "self halt. ^ val asAsn1ValueTyped: aType" ].
	^ aType newValue