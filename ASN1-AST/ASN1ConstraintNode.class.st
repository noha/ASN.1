Class {
	#name : #ASN1ConstraintNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'constraint',
		'exception'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ConstraintNode class >> constraint: aConstraint exception: anException [
	^ self new
		constraint: aConstraint;
		exception: anException 
]

{ #category : #visiting }
ASN1ConstraintNode >> accept: aVisitor [ 
	^ aVisitor visitConstraintNode: self
]

{ #category : #accessing }
ASN1ConstraintNode >> constraint [
	^ constraint
]

{ #category : #accessing }
ASN1ConstraintNode >> constraint: anObject [
	constraint := anObject
]

{ #category : #accessing }
ASN1ConstraintNode >> exception [
	^ exception
]

{ #category : #accessing }
ASN1ConstraintNode >> exception: anObject [
	exception := anObject
]

{ #category : #printing }
ASN1ConstraintNode >> printOn: aStream [
	aStream nextPut: $<. 
	constraint ifNotNil: [
		self constraint printOn: aStream ].
	aStream nextPut: $>
]

{ #category : #accessing }
ASN1ConstraintNode >> type: anObject [
	
]
