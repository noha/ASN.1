Class {
	#name : #ASN1Extension,
	#superclass : #ASN1BasicObject,
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1Extension >> accept: aVisitor [ 
	^ aVisitor visitExtension: self
]

{ #category : #testing }
ASN1Extension >> hasDefaultValue [
	^ false
]

{ #category : #'as yet unclassified' }
ASN1Extension >> includesTag: anASN1Tag [ 
	^ false
]

{ #category : #testing }
ASN1Extension >> isExtension [
	^ true
]

{ #category : #testing }
ASN1Extension >> isOptional [ 
	^ true
]

{ #category : #'as yet unclassified' }
ASN1Extension >> tag [
	^ nil
]
