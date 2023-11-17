Class {
	#name : #ASN1Composite,
	#superclass : #ASN1ValueObject,
	#category : 'ASN1-Model'
}

{ #category : #associating }
ASN1Composite >> -> aSymbol [
	^ self find: aSymbol asString
]

{ #category : #'as yet unclassified' }
ASN1Composite >> basicFind: aKey [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
ASN1Composite >> find: aKey [
	^ self basicFind: aKey
]

{ #category : #'as yet unclassified' }
ASN1Composite >> find: aKey in: aCollection [
	aCollection do: [:each|
		each isAsn1Composite ifTrue: [
			(each basicFind: aKey) ifNotNil: [:elem|
				^ elem ]]].
	^ nil
]

{ #category : #testing }
ASN1Composite >> isAsn1Composite [ 
	^ true
]
