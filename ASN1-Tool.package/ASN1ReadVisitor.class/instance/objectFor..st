accessing
objectFor: aType
	^ valueMap at: aType ifAbsent: [ 
		self objectClass new ]