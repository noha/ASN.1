Class {
	#name : #ASN1ElementsNode,
	#superclass : #ASN1ArithmeticNode,
	#instVars : [
		'entity',
		'exclusions'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ElementsNode >> accept: aVisitor [ 
	^ aVisitor visitElementsNode: self 
]

{ #category : #testing }
ASN1ElementsNode >> contains: aString [
	^ self entity label = aString
]

{ #category : #accessing }
ASN1ElementsNode >> entity [
	^ entity
]

{ #category : #accessing }
ASN1ElementsNode >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
ASN1ElementsNode >> exclusions [
	^ exclusions
]

{ #category : #accessing }
ASN1ElementsNode >> exclusions: anObject [
	exclusions := anObject
]

{ #category : #printing }
ASN1ElementsNode >> printOn: aStream [
	entity printOn: aStream.
	exclusions ifNotNil: [
		aStream nextPutAll: ' - '.
		exclusions printOn: aStream ]
]

{ #category : #accessing }
ASN1ElementsNode >> type: anObject [
	entity type: anObject.
	exclusions ifNotNil: [ 
		exclusions type: anObject ]
]
