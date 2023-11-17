Class {
	#name : #ASN1ToolModelTest,
	#superclass : #ASN1ToolTest,
	#instVars : [
		'type'
	],
	#category : 'ASN1-Tests-Tool'
}

{ #category : #accessing }
ASN1ToolModelTest >> object [ 
	^ ASN1AdaptiveTypeObject type: (self bindingAt: 'ComplexSequence')
		
]

{ #category : #tests }
ASN1ToolModelTest >> testAddElementToTypedCollection [
	| col |
	col := self typedCollection.
	col addUsing: [ :object | object foo: 'bar'].
	self assert: col first foo = 'bar'
	
]

{ #category : #tests }
ASN1ToolModelTest >> testReadExistingFieldNoValue [
	| object |
	object := self object.
	self assert: object foo isNil

]

{ #category : #tests }
ASN1ToolModelTest >> testReadExistingFieldWithValue [
	| object |
	object := self object.
	object at: #foo put: 2.
	self assert: object foo notNil

]

{ #category : #tests }
ASN1ToolModelTest >> testReadNonExistingField [
	| object |
	object := self object.
	self 
		should: [ object oof ]
		raise: ASN1InvalidFieldName 
]

{ #category : #tests }
ASN1ToolModelTest >> testWriteExpandingExistingMultiNestedField [
	| object |
	object := self object.
	object beSelfExpanding sub sub3 first: 2
]

{ #category : #tests }
ASN1ToolModelTest >> testWriteExpandingExistingNestedField [
	| object |
	object := self object.
	object beSelfExpanding sub sub1: 2
]

{ #category : #tests }
ASN1ToolModelTest >> testWriteNonExistingField [
	| object |
	object := self object.
	self
		should: [ object at: #oof put: 'bar' ]
		raise: NotFound

]

{ #category : #accessing }
ASN1ToolModelTest >> typedCollection [ 
	^ ASN1AdaptiveTypeCollection type: (self bindingAt: 'TypedComplexSequence')
		
]
