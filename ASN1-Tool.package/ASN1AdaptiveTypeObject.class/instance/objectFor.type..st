accessing
objectFor: aKey type: aType
	^ (self objectMap at: aKey ifAbsent: [ 
		[ :v | aType adaptiveTypeValueClass type: aType parent: self ] ]) value: aType