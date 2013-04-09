parsing
parseComments: anArray on: aStream
	"There are two types of comments:
	1. single line comment. it starts with -- and ends with a second pair of -- or at the end of line
	2. multi line comment. It starts with /* and ends with /*"
	| start comments found doublePeek |
	comments := anArray.
	[
		[ aStream atEnd not and: [ aStream peek isSeparator ] ]
			whileTrue: [ aStream next ].

		doublePeek := aStream doublePeek.	
		((( doublePeek first = $- ) and: [ doublePeek second = $- ]) or: [ 
			(( doublePeek first = $/ ) and: [ doublePeek second = $* ]) ])] 
		whileTrue: [
			"Transcript show: ('position ', aStream position asString, ' char '," aStream next "asString); cr".
			start := aStream position.
			(aStream next = $*) 
				ifTrue: [ aStream upToAll: '*/' . "Transcript show: 'skipping multiline comment'"]
				ifFalse: [ self findSingleLineEndMarkerOn: aStream . "Transcript show: 'skipping singleline comment'"].
			comments := comments copyWith: (start to: aStream position) ].
	^ comments