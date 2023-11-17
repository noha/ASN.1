Class {
	#name : #ASN1ReadVisitor,
	#superclass : #ASN1ModelVisitor,
	#instVars : [
		'skipErrors',
		'currentTaggedValue',
		'objectFactory'
	],
	#category : 'ASN1-Tool-Visitor'
}

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> checkOptionalAndDefault: anElement with: aCollection [
	"check if the element is optional and add default value if available"
	anElement value isOptional ifFalse: [ 
		(ASN1MandatoryElementNotFound new 
			messageText: 'cannot find element with tag ',  anElement printString) signal ].
	self flag: #needsRedesign.
	"here we get an ugly sequene 'value defaultValue value'. This is because an element is
	a key-value object. The value of the element can be a component type that can have a
	default value. FInally the defaultValue ist a primitive value and we are only interested in
	the value inside the wrapped primitive value"
	anElement value hasDefaultValue ifTrue: [ 
		aCollection privAt: anElement key put: anElement value defaultValue value ] 
]

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> collectionClass [
	^ ASN1AdaptiveTypeCollection 
]

{ #category : #accessing }
ASN1ReadVisitor >> defaultObjectFactory [
	^ ASN1ObjectFactory new
]

{ #category : #accessing }
ASN1ReadVisitor >> defaultValueClass [
	^ ASN1AdaptiveTypeObject 
]

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> error: anError on: anObject [
	skipErrors 
		ifTrue: [  ^ anObject ]
		ifFalse: [ anError signal ]
]

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> externalClass [
	^ ASN1AdaptiveTypeExternal 
]

{ #category : #'initialize-release' }
ASN1ReadVisitor >> initialize [ 
	super initialize.
	skipErrors := false
]

{ #category : #accessing }
ASN1ReadVisitor >> objectFactory [
	^ objectFactory
]

{ #category : #acessing }
ASN1ReadVisitor >> objectFactory: anObjectFactory [ 
	objectFactory := anObjectFactory
]

{ #category : #visiting }
ASN1ReadVisitor >> push: taggedValue during: aBlock [
	| formerTaggedValue result |
	taggedValue ifNil: [  Error signal: 'cannot use nil as taggedValue' ].
	formerTaggedValue := currentTaggedValue.
	currentTaggedValue := taggedValue.
	result := aBlock ifCurtailed: [ currentTaggedValue := formerTaggedValue ].
	currentTaggedValue := formerTaggedValue.
	^ result
]

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> read: anEncodedType using: aType [
	^ self read: anEncodedType using: aType as: nil
]

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> read: anEncodedValue using: aType as: aClass [

	^ self 
		push: anEncodedValue
		during: [ self visit: aType ]
]

{ #category : #visiting }
ASN1ReadVisitor >> read: anEncodedType usingModule: aModule [
	^ self read: anEncodedType using: aModule pdu as: nil
]

{ #category : #'as yet unclassified' }
ASN1ReadVisitor >> read: anEncodedType usingModule: aModule as: aClass [
	^ self read: anEncodedType using: aModule pdu as: aClass
]

{ #category : #accessing }
ASN1ReadVisitor >> skipErrors: aBoolean [
	skipErrors := aBoolean
]

{ #category : #visiting }
ASN1ReadVisitor >> visitAnyType: anAnyType [ 
	^ currentTaggedValue contents
]

{ #category : #visiting }
ASN1ReadVisitor >> visitChoiceType: aChoice [
	| slot result value |
	value := aChoice newValue.
	slot := aChoice elementWithTag: currentTaggedValue tag ifNone: [
		^ self 
			error: (ASN1ElementNotFound new messageText: 'cannot find element for tag ', currentTaggedValue tag printString)
			on:  value ].
	
	result :=self 
		push: currentTaggedValue
		during: [ self visit: slot value ].
	^ value
		type: aChoice;
		privAt: slot key put: result;
		yourself
]

{ #category : #visiting }
ASN1ReadVisitor >> visitCollection: aCollection [
	| value  contentStream elementStream isExtended |
	isExtended := false.
	value := aCollection newValue.
	contentStream := currentTaggedValue elements readStream.
	elementStream := aCollection elements associations readStream.
	[[ elementStream atEnd or: [ contentStream atEnd ] ] whileFalse: [  | element content |
		[ :continue | 
			element := elementStream peek.
			"if next element ist an extension element,mark this sequence as extensible
			and proceed with the next element"
			element value isExtension ifTrue: [ 
				isExtended := true.
				elementStream next.
				continue value ].
			
			content := contentStream peek.
			content isError ifTrue: [  ASN1MandatoryElementNotFound signal  ].
			
			(element value includesTag: content tag) 
				ifTrue: [
					"we have a match so we assign the value"
					self 
						push: content
						during: [ value privAt: element key put:  (self visit: element value) ].
					elementStream next.
					contentStream next ]
				ifFalse: [ 
					element value isOptional  
						ifTrue: [
							element value hasDefaultValue ifTrue: [ 
								"write the default value in the result"
								element value defaultValue isAsn1 
									ifTrue: [ value baseValueAt: element key put: element value defaultValue ]
									ifFalse: [ value at: element key put: element value defaultValue ] ].
							elementStream next  ]						
						ifFalse: [ isExtended ifTrue: [ 
							(aCollection hasElementWithTag: content tag) ifFalse: [
								"if the sequence is extensible and the current content tag is not
								found in the sequence we assume this is an extension value" 
								contentStream next. 
								continue value] ].
							"no escape from checking happened throw error"
							ASN1MandatoryElementNotFound signal ] ]
		] valueWithExit ].

	"after the matching elements phaset here might be still more elements to check.
	These should be optional and/or provide default values"
	[ elementStream atEnd ] whileFalse: [ 
		self checkOptionalAndDefault: elementStream next with: value ] .
	
	"if there are still values left these can only be extensions"
	[ contentStream atEnd ] whileFalse: [ 
		isExtended ifFalse:[ ASN1MandatoryElementNotFound signal] .
		contentStream next.
		 ]] 
	on: ASN1MandatoryElementNotFound 
	do: [ :err | skipErrors ifFalse: [ err pass ] ].
	 
	^ value
]

{ #category : #visiting }
ASN1ReadVisitor >> visitEnumeratedType: anEnumerated [
	| number namedNumber |
	self flag: #hack.
	"this is an ugly hack for enumerated values that are encoded explicitly while being 
	in a implicit tag environment"
	number := currentTaggedValue isConstructed 
		ifTrue: [
			self 
				push: currentTaggedValue contents first
				during: [ self visitPrimitiveType: anEnumerated]]
		ifFalse: [ self visitPrimitiveType: anEnumerated ].
	namedNumber := anEnumerated atNumber: number contents.
	^ anEnumerated newValue contents: namedNumber name
]

{ #category : #visiting }
ASN1ReadVisitor >> visitExternalType: anExternalType [
	| oid  value |
	value := anExternalType newValue.
	oid := self 
		push: currentTaggedValue elements first
		during: [
			((currentTaggedValue tag clazz = 'UNIVERSAL') & (currentTaggedValue tag number = 6)) ifFalse: [ 
				ASN1UnexpectedType signal: 'expected external value' ]. 
			ASN1ObjectIdentifierType decode: currentTaggedValue contents ].
	value oid: oid.

	self 
		push: currentTaggedValue elements second
		during: [
			(ASN1UnresolvedOid oid: oid) signal
				ifNotNil: [:module|
					(currentTaggedValue tag number = 0) ifFalse: [ Error signal: 'unexpected tag number' ].
					value decoded: (self class new 
						objectFactory: objectFactory;
						read: currentTaggedValue elements first 
						usingModule: module
						as: value valueClass) ]
				ifNil:  [ value encoded: currentTaggedValue elements first ]].
	^ value
]

{ #category : #visiting }
ASN1ReadVisitor >> visitObjectIdentifierType: anObjectIdentifier [ 	
	^ self visitPrimitiveType: anObjectIdentifier 
]

{ #category : #visiting }
ASN1ReadVisitor >> visitOpenType: anOpenType [ 
	"an open type does not specify its kind. So we return the anonymous data. The data needs to be parsed
	in a second pass"
	^ currentTaggedValue
]

{ #category : #visiting }
ASN1ReadVisitor >> visitPrimitiveType: aPrimitive [
	^ aPrimitive decodedValue: currentTaggedValue contents
]

{ #category : #visiting }
ASN1ReadVisitor >> visitTaggedType: aTaggedType [ 
	"resolve the tagging environment over the tagged type because it is defined in the module
	defining the tagging environment (the type of the tagged type might be imported from another
	module. Delegate the decoding to the type of the tagged type so that types can alter the tagging 
	environment themselves (e.g. choicces are always explicit)"
	| basicValue |
	basicValue := self 
		push: (aTaggedType readEncodedValue: currentTaggedValue) 
		during: [ self visit: aTaggedType type ].
	basicValue type: aTaggedType type.
	^ ASN1TaggedValue new
		type: aTaggedType; 
		value: basicValue
]

{ #category : #visiting }
ASN1ReadVisitor >> visitTypedCollection: aCollection [
	| seq  |
	seq := self collectionClass new
		type: aCollection.
	currentTaggedValue elements do: [:content| 
		self 
			push: content
			during: [
				seq add: (self visit: aCollection type) ]].
	^ seq
]
