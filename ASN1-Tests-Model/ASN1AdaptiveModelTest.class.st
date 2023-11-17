Class {
	#name : #ASN1AdaptiveModelTest,
	#superclass : #Phexample,
	#category : 'ASN1-Tests-Model'
}

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> model [
	^ ASN1SequenceType new
		elements: { 
			'firstElement' -> (
				ASN1SequenceType new
					elements: { 
						'firstElement' -> ASN1OctetStringType new.
						'secondElement' -> ASN1IntegerType new } asDictionary).
			'secondElement' -> ASN1OctetStringType new } asDictionary 
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldAddBottomPrimitiveString [
	| val |
	val := self given: #shouldAddTopPrimitive.
	val beSelfExpanding.
	val firstElement firstElement: 'bottom primitive' asByteArray.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldAddTopPrimitive [
	| val |
	val := self given: #shouldCreateValue.
	val secondElement: 'hallo' asByteArray.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldCreateValue [
	| val |
	val := self model newValue.
	self assert: val notNil.
	^ val
	
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldGetBasicBottomPrimitiveString [
	| val |
	val := self given: #shouldProvideValue.
	self assert: (val firstElement privAt: #firstElement) contents = 'bottom primitive' asByteArray.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldGetBasicTopPrimitive [
	| val |
	val := self given: #shouldProvideValue.
	self assert: (val privAt: #secondElement) contents = 'hallo' asByteArray.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldGetBottomPrimitiveInteger [
	| val |
	val := self given: #shouldProvideValue.
	self assert: val firstElement secondElement = 112.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldGetBottomPrimitiveString [
	| val |
	val := self given: #shouldProvideValue.
	self assert: val firstElement firstElement = 'bottom primitive' asByteArray.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldGetTopPrimitive [
	| val |
	val := self given: #shouldProvideValue.
	self assert: val secondElement = 'hallo' asByteArray.
	^ val
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveModelTest >> shouldProvideValue [
	| val |
	val := self given: #shouldAddBottomPrimitiveString.
	val beSelfExpanding.
	val firstElement secondElement: 112.
	^ val
]
