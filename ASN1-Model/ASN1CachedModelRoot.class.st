Class {
	#name : #ASN1CachedModelRoot,
	#superclass : #ASN1ModelRoot,
	#instVars : [
		'types',
		'modulesByOid',
		'moduleByName'
	],
	#category : 'ASN1-Model'
}

{ #category : #'instance creation' }
ASN1CachedModelRoot class >> on: anASN1ModelRoot [ 
	^ self new
		initializeFromModelRoot: anASN1ModelRoot 
]

{ #category : #'as yet unclassified' }
ASN1CachedModelRoot >> bindingNamed: aString [
	types
		at: aString
		ifPresent:[ :v | ^ aString -> v ].
	^ super bindingNamed: aString
]

{ #category : #'as yet unclassified' }
ASN1CachedModelRoot >> initialize [
	super initialize.
	types := IdentityDictionary new.
	modulesByOid := Dictionary new. 
	moduleByName := IdentityDictionary new
]

{ #category : #initialization }
ASN1CachedModelRoot >> initializeFromModelRoot: aModelRoot [

]

{ #category : #accessing }
ASN1CachedModelRoot >> moduleDefiningOid: anOid [ 
	^ modulesByOid 
		at: anOid
		ifAbsentPut: [ super moduleDefiningOid: anOid ]
]

{ #category : #accessing }
ASN1CachedModelRoot >> moduleNamed: aString [ 
	^ moduleByName 
		at: aString asSymbol
		ifAbsentPut: [ super moduleNamed: aString ] 
]

{ #category : #'as yet unclassified' }
ASN1CachedModelRoot >> reset [
	types := IdentityDictionary new.
	modulesByOid := Dictionary new.
	moduleByName := IdentityDictionary new
]

{ #category : #accessing }
ASN1CachedModelRoot >> typeNamed: aString [ 
	| type |
	type := types at: aString asSymbol ifPresent: [ :v | ^ v ].
	type := super typeNamed: aString.
	type ifNotNil: [ 
		types at: aString asSymbol put: type ].
	^ type 
]
