Class {
	#name : #ASN1BooleanType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1BooleanType class >> decode: aByteArray [
	^ aByteArray first ~= 0
]

{ #category : #codec }
ASN1BooleanType class >> encode: aBoolean [
	^ aBoolean
		ifTrue: #[ 16rff ]
		ifFalse: #[ 16r00 ]
]

{ #category : #accessing }
ASN1BooleanType class >> universalType [
	^ 'BOOLEAN'
]

{ #category : #visiting }
ASN1BooleanType >> accept: aVisitor [ 
	^ aVisitor visitBooleanType: self
]

{ #category : #validating }
ASN1BooleanType >> acceptsValue: anObject [
	^ anObject isKindOf: Boolean
]
