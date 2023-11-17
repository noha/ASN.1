Class {
	#name : #ASN1ModifierOptional,
	#superclass : #ASN1BasicObject,
	#category : 'ASN1-Model'
}

{ #category : #testing }
ASN1ModifierOptional >> isDefaultValue [
	^ false
]

{ #category : #testing }
ASN1ModifierOptional >> isOptional [
	^ true
]

{ #category : #printing }
ASN1ModifierOptional >> printOn: aStream [
	aStream nextPutAll: 'optional'
]

{ #category : #accessing }
ASN1ModifierOptional >> type: aType [ 
	
]
