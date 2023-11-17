Class {
	#name : #ASN1MandatoryElementNotFound,
	#superclass : #ASN1StructureError,
	#category : 'ASN1-Tool-Exception'
}

{ #category : #testing }
ASN1MandatoryElementNotFound >> isResumable [ 
	^ true
]
