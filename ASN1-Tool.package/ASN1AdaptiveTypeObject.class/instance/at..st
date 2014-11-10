accessing
at: aKey
	^ self 
		at: aKey 
		ifAbsent: [ ASN1InvalidFieldName signal: 'cannot find field ', aKey asString ]