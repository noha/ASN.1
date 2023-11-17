Class {
	#name : #ASN1ModuleIdentifierNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'oid',
		'name'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ModuleIdentifierNode class >> nodes: aCollection [
	^ self new
		name: aCollection first;
		oid: aCollection second;
		yourself
]

{ #category : #comparing }
ASN1ModuleIdentifierNode >> = aModuleIdentifier [
	^ self oid = aModuleIdentifier oid
]

{ #category : #visiting }
ASN1ModuleIdentifierNode >> accept: anASN1Visitor [ 
	^ anASN1Visitor visitModuleIdentifierNode: self
]

{ #category : #comparing }
ASN1ModuleIdentifierNode >> hash [
	^ self oid hash
]

{ #category : #accessing }
ASN1ModuleIdentifierNode >> name [
	^ name
]

{ #category : #accessing }
ASN1ModuleIdentifierNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1ModuleIdentifierNode >> oid [
	^ oid
]

{ #category : #accessing }
ASN1ModuleIdentifierNode >> oid: anObject [
	oid := anObject
]

{ #category : #printing }
ASN1ModuleIdentifierNode >> printOn: aStream [
	self name 
		ifNotNil: [ self name printOn: aStream ]
		ifNil: [ aStream nextPutAll: 'default' ].
	self oid ifNotNil: [
		aStream
			nextPutAll: ' ( ';
			nextPutAll: self oid oidString;
			nextPutAll: ' )' ]
]
