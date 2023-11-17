Class {
	#name : #ASN1ModelConfiguration,
	#superclass : #Object,
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1ModelConfiguration >> applyTo: aModel [
	self mappings associations do: [  :mapping |
		 (aModel typeNamed: mapping key) valueFactory: mapping value ]
]

{ #category : #'as yet unclassified' }
ASN1ModelConfiguration >> clean: aModel [
	self mappings associations do: [  :mapping |
		 (aModel typeNamed: mapping key) valueFactory: nil ]
]

{ #category : #'as yet unclassified' }
ASN1ModelConfiguration >> mappings [
	^ Dictionary new
]
