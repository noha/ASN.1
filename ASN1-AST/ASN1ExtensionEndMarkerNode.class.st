Class {
	#name : 'ASN1ExtensionEndMarkerNode',
	#superclass : 'ASN1ASTNode',
	#instVars : [
		'optional'
	],
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'accessing' }
ASN1ExtensionEndMarkerNode >> optional [
	^ optional
]

{ #category : 'accessing' }
ASN1ExtensionEndMarkerNode >> optional: anObject [
	optional := anObject
]
