accessing
objectFor: aType
	valueMap 
		at: aType 
		ifPresent: [ :val | 
			val isClass ifTrue: [ ^ val new ].
			val isBlock ifTrue: [ ^ val value ]. 
			Error signal: 'only classes and blocks are supported in an objectmap' ].
	^ self objectClass new