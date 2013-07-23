testing
includesType: anObject
	^ (constraint includesType: anObject) and: [ 
		exception notNil and: [ (exception includesType: anObject) not ] ]