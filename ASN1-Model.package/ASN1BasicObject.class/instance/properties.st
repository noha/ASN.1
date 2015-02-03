accessing
properties
	^ properties ifNil: [
		properties := SmallIdentityDictionary new ]