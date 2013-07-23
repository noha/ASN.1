testing
includesType: aType 
	^ (included includesType: aType) 
		and: [ excluded isNil or: [ (excluded includesType: aType) not ]  ] 