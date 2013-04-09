accessing
number
	^ number ifNil: [
		number :=  self resolveOidName: name asString ]