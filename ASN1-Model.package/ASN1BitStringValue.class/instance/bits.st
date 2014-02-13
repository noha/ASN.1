accessing
bits
	^ bits ifNil: [ 
		bits := OrderedCollection new ]