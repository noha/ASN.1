codec
encode: aString
	^ ByteArray streamContents: [ :stream | 
		aString do: [ :char | | asciiValue |
			asciiValue := char asciiValue.
			(asciiValue > 16rFFFF) ifTrue: [ Error signal: 'cannot encode ', aString, ' to 16-bit' ].
			(asciiValue < 256) ifTrue: [ 
				stream nextPut: 0 ].
			stream nextPut: asciiValue ]]