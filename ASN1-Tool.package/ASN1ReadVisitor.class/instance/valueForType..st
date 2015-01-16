accessing
valueForType: aType
	factories 
		at: aType 
		ifPresent: [ :val | ^ val asAsn1ValueTyped: aType ].
	^ aType newValue