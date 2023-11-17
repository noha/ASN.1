Class {
	#name : #ASN1ValidatingVisitor,
	#superclass : #ASN1ModelVisitor,
	#instVars : [
		'value'
	],
	#category : 'ASN1-Model-Visitor'
}

{ #category : #'as yet unclassified' }
ASN1ValidatingVisitor >> validate: anObject [
	self validateType: anObject type value: anObject
]

{ #category : #validating }
ASN1ValidatingVisitor >> validateType: aType value: aValue [
	| oldValue |
	oldValue := value.
	value := aValue.
	[ self visit: aType ] 
		ensure: [ value := oldValue ]
]

{ #category : #visiting }
ASN1ValidatingVisitor >> visitChoiceType: aChoice [
	
	(value size = 1) ifFalse: [ 
		Error signal: 'object contains more than one key which is not valid for a choice type' ].
	(aChoice elements anySatisfy: [ :each | each key = value keys first]) ifFalse: [ 
		Error signal: 'key in object does not match type' ].
	self 
		validateType: ( aChoice elementAt: value keys first ) value
		value: value values first

]

{ #category : #visiting }
ASN1ValidatingVisitor >> visitPrimitiveType: aPrimitive [
	aPrimitive validate: value
]

{ #category : #visiting }
ASN1ValidatingVisitor >> visitSequenceType: aSequence [
	aSequence elements do: [ :binding | | fieldType |
		binding isExtension ifFalse: [  
			fieldType := binding value.
			fieldType isOptional ifFalse: [ 
				(value includesKey: binding key) ifFalse: [ ASN1MandatoryElementNotFound signal: binding key, ' not found' ] ].
			(value includesKey: binding key) ifTrue: [
				self validateType: fieldType value: (value privAt: binding key) ] ] ].
]
