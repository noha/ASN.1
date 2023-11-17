Class {
	#name : #ASN1FindByKeyVisitor,
	#superclass : #ASN1ModelVisitor,
	#instVars : [
		'key',
		'objects'
	],
	#category : 'ASN1-Model-Visitor'
}

{ #category : #'initialize-release' }
ASN1FindByKeyVisitor >> initialize [
	super initialize.
	objects := OrderedCollection new
]

{ #category : #accessing }
ASN1FindByKeyVisitor >> key: aString [
	key := aString
]

{ #category : #accessing }
ASN1FindByKeyVisitor >> object [
	(objects size > 1) ifTrue: [ 
		self error: 'multiple objects found with key ', key asString ].
	^ objects 
		ifNotEmpty: [  objects first ]
		ifEmpty: [ nil ]
]

{ #category : #accessing }
ASN1FindByKeyVisitor >> objects [ 
	  ^ objects
]

{ #category : #'as yet unclassified' }
ASN1FindByKeyVisitor >> visitCollection: aCollection [ 

	^ aCollection elements associations collect: [:each|
		(each key = key) ifTrue: [ objects add: each value ].
		self visit: each value ]
]
