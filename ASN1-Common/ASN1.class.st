Class {
	#name : #ASN1,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : 'ASN1-Common'
}

{ #category : #initialize }
ASN1 >> initialize [
	super initialize.
	properties := SmallDictionary new
]

{ #category : #accessing }
ASN1 >> properties [
	^ properties
]
