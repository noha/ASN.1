accessing
objectFor: aKey type: aType
	^ (self objectMap at: aKey ifAbsent: [ 
		[ :v | (aType asAsn1Value parent: self)
			initializeFrom: self ] ]) value: aType