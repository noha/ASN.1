testing
includesType: aType 
	^ (elementSpec includesType: aType) 
		and: [ exclusions isNil or: [ (exclusions includesType: aType) not ]  ] 