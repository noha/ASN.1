testing
includes: anObject
	^ (constraint includes: anObject) and: [ 
		exception notNil and: [ (exception includes: anObject) not ] ]