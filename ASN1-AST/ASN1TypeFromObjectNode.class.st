Class {
	#name : #ASN1TypeFromObjectNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'object',
		'field'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1TypeFromObjectNode >> accept: aVisitor [ 
	^ aVisitor visitTypeFromObjectNode: self
]

{ #category : #accessing }
ASN1TypeFromObjectNode >> field [
	^ field
]

{ #category : #accessing }
ASN1TypeFromObjectNode >> field: anObject [
	field := anObject
]

{ #category : #accessing }
ASN1TypeFromObjectNode >> object [
	^ object
]

{ #category : #accessing }
ASN1TypeFromObjectNode >> object: anObject [
	object := anObject
]

{ #category : #printing }
ASN1TypeFromObjectNode >> printOn: aStream [
	aStream
		nextPutAll: self object printString;
		nextPut: $.;
		nextPutAll: self field printString 
]
