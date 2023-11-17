Class {
	#name : #ASN1EnumeratedValue,
	#superclass : #ASN1PrimitiveValue,
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1EnumeratedValue >> accept: aVisitor [
	^ aVisitor visitEnumeratedValue: self 
]

{ #category : #converting }
ASN1EnumeratedValue >> encodedValue [
	"an enumerated is encoded as an integer. The integer is the numeric presentation
	of the enum selected by the label"
	^ type encodedValue: (type atName: contents) number
]
