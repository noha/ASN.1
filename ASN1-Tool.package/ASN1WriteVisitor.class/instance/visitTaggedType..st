visiting
visitTaggedType: aTaggedType 
	^ (self tagEnvironmentOf: aTaggedType) 
		encode: (self visit: aTaggedType type) 
		using: aTaggedType type
		outerTag: aTaggedType tag