as yet unclassified
bindingOf: aString
	"a bit string consists of a collection of named bits. Resolve the named bit and 
	return its value"
	^ (bits 
		detect: [ :bit | bit name = aString ]
		ifNone: [ nil ])
			ifNotNil: [ :namedBit | namedBit value ]