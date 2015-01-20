accessing
basicTypeAt: aKey
	^ self 
		basicTypeAt: aKey
		ifAbsent: [ ASN1InvalidFieldName signal: 'cannot find field ', aKey asString ]