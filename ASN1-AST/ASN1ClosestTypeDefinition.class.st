Class {
	#name : #ASN1ClosestTypeDefinition,
	#superclass : #Notification,
	#category : 'ASN1-AST-Visitor'
}

{ #category : #'as yet unclassified' }
ASN1ClosestTypeDefinition class >> defaultAction [
	^ self class defaultValue
]

{ #category : #'as yet unclassified' }
ASN1ClosestTypeDefinition class >> defaultValue [
	^ nil
]

{ #category : #'as yet unclassified' }
ASN1ClosestTypeDefinition class >> use: anObject during: aBlock [
	
	^ aBlock 
		on: self 
		do: [ :notification | notification resume: anObject ]
]

{ #category : #'as yet unclassified' }
ASN1ClosestTypeDefinition class >> value [

	^ self signal
]
