as yet unclassified
basicTypeAt: aKey
	^ self 
		basicTypeAt: aKey
		ifNone: [ ASN1InvalidFieldName signal: 'cannot find field ', aKey asString ]