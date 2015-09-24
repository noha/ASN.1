accessing
bitIndexOf: aString 
	^ (self bits 
		detect: [ :each | each name = aString ]
		ifNone: [Error signal: 'cannot find bit named ', aString asString,' in bit string type ', self asString ] ) value