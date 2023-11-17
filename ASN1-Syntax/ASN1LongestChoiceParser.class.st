Class {
	#name : #ASN1LongestChoiceParser,
	#superclass : #PPListParser,
	#category : 'ASN1-Syntax'
}

{ #category : #'as yet unclassified' }
ASN1LongestChoiceParser >> /> aRule [ 
	^ self copyWith: aRule
]

{ #category : #'as yet unclassified' }
ASN1LongestChoiceParser >> parseOn: aStream [
 	| start element longestEnd longestElement |
 	start := aStream position.
 	1 to: parsers size do: [ :index |
 		element := (parsers at: index)
 			parseOn: aStream. 		
			(longestEnd isNil or: [ longestEnd < aStream position ]) ifTrue: [
 			longestEnd := aStream position.
 			longestElement := element ].
 		aStream position: start ].
 	aStream position: longestEnd.
 	^ longestElement
]
