accessing
tag
	^ self explicitTag ifNil: [ self universalTag ]