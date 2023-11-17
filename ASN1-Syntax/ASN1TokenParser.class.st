Class {
	#name : #ASN1TokenParser,
	#superclass : #PPTokenParser,
	#classVars : [
		'SeparatorPredicate'
	],
	#category : 'ASN1-Syntax'
}

{ #category : #'class initialization' }
ASN1TokenParser class >> initialize [
	SeparatorPredicate := PPCharSetPredicate on: [ :char | char isWhiteSpace ]
]

{ #category : #private }
ASN1TokenParser >> defaultTokenClass [
	^ ASN1Token
]

{ #category : #'as yet unclassified' }
ASN1TokenParser >> findSingleLineEndMarkerOn: aStream [
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

]

{ #category : #parsing }
ASN1TokenParser >> parseComments: anArray on: aStream [
	"There are two types of comments:
	1. single line comment. it starts with -- and ends with a second pair of -- or at the end of line
	2. multi line comment. It starts with /* and ends with /*"
	| start comments  peekTwice |
	comments := anArray.
	[
		[ aStream atEnd not and: [ aStream peek isSeparator ] ]
			whileTrue: [ aStream next ].

		peekTwice := aStream peekTwice.	
		((( peekTwice first = $- ) and: [ peekTwice second = $- ]) or: [ 
			(( peekTwice first = $/ ) and: [ peekTwice second = $* ]) ])] 
		whileTrue: [
			"Transcript show: ('position ', aStream position asString, ' char '," aStream next "asString); cr".
			start := aStream position.
			(aStream next = $*) 
				ifTrue: [ aStream upToAll: '*/' . "Transcript show: 'skipping multiline comment'"]
				ifFalse: [ self findSingleLineEndMarkerOn: aStream . "Transcript show: 'skipping singleline comment'"].
			comments := comments copyWith: (start to: aStream position) ].
	^ comments
]

{ #category : #parsing }
ASN1TokenParser >> parseOn: aStream [
	| start comments token |
	start := aStream position.
	comments := self
		parseComments: #()
		on: aStream.
	token := super parseOn: aStream.
	token isPetitFailure ifTrue: [
		aStream position: start.
		^ token ].
	comments := self
		parseComments: comments
		on: aStream.
	^ token comments: comments
]
