accessing
objectFor: aType
	fieldFactories 
		at: aType 
		ifPresent: [ :val | ^ val asAsn1ValueTyped: aType ].
	^ self defaultValueClass new