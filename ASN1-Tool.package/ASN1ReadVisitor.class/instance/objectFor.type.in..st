accessing
objectFor: aKey type: aType in: aValue
	^ (aValue objectFor: aKey type: aType) ifNil: [ 
		self objectFor: aType ]