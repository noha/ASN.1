Class {
	#name : 'ASN1ExtensionAndExceptionNode',
	#superclass : 'ASN1ExtensionNode',
	#instVars : [
		'exception'
	],
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'as yet unclassified' }
ASN1ExtensionAndExceptionNode >> accept: aVisitor [
	^ aVisitor visitExtensionAndExceptionNode: self 
]

{ #category : 'accessing' }
ASN1ExtensionAndExceptionNode >> exception [
	^ exception
]

{ #category : 'accessing' }
ASN1ExtensionAndExceptionNode >> exception: anObject [
	exception := anObject
]

{ #category : 'printing' }
ASN1ExtensionAndExceptionNode >> printOn: aStream [
	aStream nextPutAll: self class name
]
