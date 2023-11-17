Class {
	#name : #ASN1BitStringValueNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1BitStringValueNode >> accept: aVisitor [ 
	^ aVisitor visitBitStringValueNode: self 
]

{ #category : #testing }
ASN1BitStringValueNode >> canBeAssignedTo: aTypeNode [ 
	^ aTypeNode matchesTypeOf: ASN1BitStringTypeNode 
]

{ #category : #accessing }
ASN1BitStringValueNode >> defaultTypeClass [
	^ ASN1BitStringTypeNode 
]

{ #category : #testing }
ASN1BitStringValueNode >> hasSameType: aTypeInstance [
	^ self type class = aTypeInstance class 
]

{ #category : #accessing }
ASN1BitStringValueNode >> setBitValues: aCollection [
	| number |
	number := 0.
	aCollection do: [ :bitNumber |
		number := number bitOr: (2 raisedTo: bitNumber asNumber)
	].
	self resolvedValue: (number printStringBase: 2)
]

{ #category : #accessing }
ASN1BitStringValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1BitStringValueNode >> value: anObject [
	value := anObject
]
