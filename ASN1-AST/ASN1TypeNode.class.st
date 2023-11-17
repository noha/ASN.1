Class {
	#name : #ASN1TypeNode,
	#superclass : #ASN1ASTNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #adding }
ASN1TypeNode >> addConstraint: aConstraintNode [
	 self constraints add: aConstraintNode
]

{ #category : #'as yet unclassified' }
ASN1TypeNode >> basicType [
	^ self
]

{ #category : #accessing }
ASN1TypeNode >> constraints [
	^ self propertyAt: #constraints ifAbsentPut: [ Set new]
]

{ #category : #accessing }
ASN1TypeNode >> constraints: aCollection [
	^ self propertyAt: #constraints put: aCollection
]

{ #category : #'as yet unclassified' }
ASN1TypeNode >> createInstance: anObject [
	^ anObject
]

{ #category : #testing }
ASN1TypeNode >> isSameType: aType [
	^ self class = aType class
]

{ #category : #testing }
ASN1TypeNode >> isTypeNode [
	^ true
]

{ #category : #testing }
ASN1TypeNode >> matchesTypeOf: anObject [
	^ anObject type class = self class
]

{ #category : #accessing }
ASN1TypeNode >> modifier [
	^ self propertyAt: #modifier
]

{ #category : #accessing }
ASN1TypeNode >> modifier: anObject [
	^ self propertyAt: #modifier put: anObject
]

{ #category : #printing }
ASN1TypeNode >> printOn: aStream [
	super printOn: aStream.
	self constraints notNil ifTrue: [
		aStream nextPut: $(.
		self constraints 
			do: [:constraint| constraint printOn: aStream ]
			separatedBy: [ aStream nextPut: $, ].
		aStream nextPut: $)
	].
	self propertyAt: #modifier ifPresent: [:modifier|
		aStream
			nextPut: $:;
			nextPutAll: modifier printString ].
]

{ #category : #'as yet unclassified' }
ASN1TypeNode >> tagEnvironment [
	^ self propertyAt: #tagEnvironment
]

{ #category : #'as yet unclassified' }
ASN1TypeNode >> tagEnvironment: aTaggingMode [
	aTaggingMode ifNil: [  ^ self  ].
	self propertyAt: #tagEnvironment put: aTaggingMode 
]

{ #category : #'as yet unclassified' }
ASN1TypeNode >> validate: aValueNode [
	aValueNode isValueNode ifFalse: [
		Error signal: 'is not a value node'].
	^ aValueNode hasSameType: self 
]
