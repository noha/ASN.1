Class {
	#name : #ASN1ModelRoot,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1ModelRoot >> abstractSyntaxes [
	^ self modules 
		inject: Set new 
		into: [:col :module|
			col addAll: modules abstractSyntaxes ] 
]

{ #category : #visiting }
ASN1ModelRoot >> accept: aVisitor [ 
	^ aVisitor visitModelRoot: self
]

{ #category : #accessing }
ASN1ModelRoot >> addModule: aModule [ 
	aModule modelRoot: self.
	modules add: aModule
]

{ #category : #mapping }
ASN1ModelRoot >> applyMapping: aDictionary [ 
	aDictionary keysAndValuesDo: [ :typeName :factory |
		 (self typeNamed: typeName) valueFactory: factory ]
]

{ #category : #converting }
ASN1ModelRoot >> asAsn1Context [
	^ ASN1Context new
		model: self
]

{ #category : #converting }
ASN1ModelRoot >> asModelRootWithClass: aClass [
	^ aClass on: self
]

{ #category : #accessing }
ASN1ModelRoot >> bindingNameOfOid: anOidOrString [
	modules do: [:each|
		(each definesOid: anOidOrString asAsn1Oid) ifTrue: [
			^ each bindingNameOfOid: anOidOrString asAsn1Oid ] ].
	^ nil
]

{ #category : #accessing }
ASN1ModelRoot >> bindingNamed: aString [
	 modules do:[:module|
		module fields associationsDo: [:field|
			(field key = aString)
				ifTrue: [ ^ field ]]].
	^ nil
]

{ #category : #accessing }
ASN1ModelRoot >> fieldDefiningOid: anOid [
	^ (self moduleDefiningOid: anOid)
		fieldDefiningOid: anOid
]

{ #category : #initialize }
ASN1ModelRoot >> initialize [
	super initialize.
	modules := OrderedCollection new
]

{ #category : #initialization }
ASN1ModelRoot >> initializeFromModelRoot: aModelRoot [
	modules := aModelRoot modules
]

{ #category : #accessing }
ASN1ModelRoot >> moduleDefiningOid: anOidOrString [
	| oid |
	oid := anOidOrString asAsn1Oid.
	^ modules
		detect: [:each| each definesOid: oid ]
		ifNone: [ nil ]
]

{ #category : #accessing }
ASN1ModelRoot >> moduleNamed: aString [
	^ modules detect: [:each| each name = aString ]
]

{ #category : #accessing }
ASN1ModelRoot >> modules [
	^ modules
]

{ #category : #accessing }
ASN1ModelRoot >> objectsWithClass: aString [
	| col |
	col := Dictionary new.
	modules do: [:each|
		col addAll: (each objectsWithClass: aString) ].
	^ col
]

{ #category : #accessing }
ASN1ModelRoot >> pduForModule: aModule [
	| visitor  pdu |
	visitor := ASN1PDUFindingVisitor new.
	visitor visit: aModule.
	(visitor candidates size = 1)
		ifTrue: [ pdu := visitor candidates associations first ].
	(visitor candidates size > 1)
		ifTrue: [ 
			(visitor candidates associations select: [:each| each value label includesSubString: 'PDU'])
				ifNotEmpty: [:pdus|
					(pdus size = 1) 
						ifTrue: [ pdu := pdus first ]
						ifFalse: [ Error signal: 'could not determine pdu spec, ',pdus size asString, ' alternatives left']]
				ifEmpty: [ Error signal: 'could not determine pdu. None found']].
	^ aModule fields associations detect: [:each| each left = pdu value ]
	
]

{ #category : #accessing }
ASN1ModelRoot >> typeNamed: aString [ 
	^ (self bindingNamed: aString) value
]
