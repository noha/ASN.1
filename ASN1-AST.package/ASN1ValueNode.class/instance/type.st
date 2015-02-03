accessing
type
	^ type ifNil: [ 
		type := self defaultTypeClass new ]