as yet unclassified
findSingleLineEndMarkerOn: aStream
	|  char |
	[
		[aStream atEnd or: [
			(CharacterSet crlf copyWith: $-) includes: aStream peek
		]] whileFalse: [ aStream next ].
		char := aStream next.
		(char = $-) 
			ifTrue: [ (aStream peek = $-) 
				ifTrue: [ aStream next.  false]
				ifFalse: [ true ]]
			ifFalse: [ false ] 
	] whileTrue
