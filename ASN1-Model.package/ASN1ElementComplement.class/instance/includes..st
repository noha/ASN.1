testing
includes: aType 
	^ (included includes: aType) 
		and: [ excluded isNil or: [ (excluded includes: aType) not ]  ] 