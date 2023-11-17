Class {
	#name : #ASN1ComponentTypeListNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'components'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ComponentTypeListNode >> accept: aVisitor [ 
	^ aVisitor visitComponentTypeListNode: self
]

{ #category : #accessing }
ASN1ComponentTypeListNode >> components [
	^ components
]

{ #category : #accessing }
ASN1ComponentTypeListNode >> components: anObject [
	components := anObject
]

{ #category : #printing }
ASN1ComponentTypeListNode >> printOn: aStream [
	aStream nextPutAll: 'component type list: '.
	components 
		do: [:each| each printOn: aStream]
		separatedBy: [ aStream nextPutAll: ', ']
]
