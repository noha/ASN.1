Class {
	#name : #ASN1CollectionNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #testing }
ASN1CollectionNode >> contains: aString [
	^ self elements 
		anySatisfy: [:each| each notNil and: [ each contains: aString ]]
]

{ #category : #accessing }
ASN1CollectionNode >> elements [
	^ elements
]

{ #category : #accessing }
ASN1CollectionNode >> elements: anObject [
	elements := anObject
]

{ #category : #converting }
ASN1CollectionNode >> flattenComponentsOf [
	elements ifNil: [ ^ self ].
	elements := elements 
		inject: OrderedCollection new
		into: [:col :elem| 
			(elem class = ASN1ComponentsOfNode)
				ifTrue: [ col addAll: elem type dereferenced elements ]
				ifFalse: [ col add: elem ].
				col ]
]

{ #category : #converting }
ASN1CollectionNode >> normalized [
	^ self copy 
		flattenComponentsOf
]

{ #category : #printing }
ASN1CollectionNode >> printOn: aStream [
	elements ifNotNil: [
		(elements isCollection) 
			ifTrue: [
				"elements 
					do: [:each| aStream nextPutAll: each greaseString ]
					separatedBy: [ aStream nextPut: $, ]]"
				elements printElementsOn: aStream ]]
]

{ #category : #accessing }
ASN1CollectionNode >> size [
	^ elements isNil
		ifTrue: [ 0 ]
		ifFalse: [ elements size ]
]
