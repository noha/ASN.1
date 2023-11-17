Class {
	#name : #ASN1ObjectIdNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'components'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ObjectIdNode class >> components: aCollection [
	^ self new
		components: aCollection
]

{ #category : #'as yet unclassified' }
ASN1ObjectIdNode class >> fromString: aString [
	^ self new
		components: (($. split: aString) 
			collect: [ :each| ASN1ObjectIdComponentNode number: each  ])
]

{ #category : #comparing }
ASN1ObjectIdNode >> = aObjectIdNode [
	(self class = aObjectIdNode class) ifFalse: [ ^ false ].
	^ self components = aObjectIdNode components
]

{ #category : #visiting }
ASN1ObjectIdNode >> accept: aVisitor [ 
	^ aVisitor visitObjectIdentifierNode: self 
]

{ #category : #accessing }
ASN1ObjectIdNode >> components [
	^ components
]

{ #category : #accessing }
ASN1ObjectIdNode >> components: aCollection [
	components := aCollection
]

{ #category : #accessing }
ASN1ObjectIdNode >> defaultTypeClass [
	^ ASN1ObjectIdentifierTypeNode 
]

{ #category : #comparing }
ASN1ObjectIdNode >> hash [
	^ self components hash
]

{ #category : #accessing }
ASN1ObjectIdNode >> oidString [
	^ String streamContents: [:stream|
		self components
			do: [:component| 
				component isAsn1ReferenceNode 
					ifTrue: [ stream nextPutAll: component label ]
					ifFalse: [ component printNumberOn: stream ]]
			separatedBy: [ stream nextPut: $. ]]
]

{ #category : #printing }
ASN1ObjectIdNode >> printOn: aStream [
	aStream 
		nextPutAll: self class name; 
		nextPut: $[;
		nextPutAll: self oidString;
		nextPut: $]
]
