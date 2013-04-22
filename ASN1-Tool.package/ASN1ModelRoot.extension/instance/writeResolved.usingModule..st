*asn1-tool
writeResolved: aDictionary usingModule: aModule
	^ self resolveOidsWhile: [ 
		aModule write: aDictionary  ]