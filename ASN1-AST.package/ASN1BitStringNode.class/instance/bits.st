accessing
bits
	^ bits ifNil: [ 
		bits := Set new ]