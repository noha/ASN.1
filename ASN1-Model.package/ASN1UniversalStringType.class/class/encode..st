codec
encode: aString
	^ ByteArray streamContents: [ :stream |
		 aString do: [ :character |
			(character asciiValue <= 16rFF) ifTrue: [ stream nextPut: 0].
			(character asciiValue <= 16rFFFF) ifTrue: [ stream nextPut: 0].
			(character asciiValue <= 16rFFFFFF) ifTrue: [ stream nextPut: 0].
			stream nextPutAll: character asciiValue asByteArray ]]
			