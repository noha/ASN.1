accessing
objectFor: aType
	^ typeMap at: aType ifAbsent: [ 
		self objectClass new ]