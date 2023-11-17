Class {
	#name : #ASN1OptionalExtensionMarkerNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'optional'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #accessing }
ASN1OptionalExtensionMarkerNode >> optional [
	^ optional
]

{ #category : #accessing }
ASN1OptionalExtensionMarkerNode >> optional: anObject [
	optional := anObject
]

{ #category : #printing }
ASN1OptionalExtensionMarkerNode >> printOn: aStream [
	aStream nextPutAll: self class name
]
