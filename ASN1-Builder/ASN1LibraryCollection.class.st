Class {
	#name : #ASN1LibraryCollection,
	#superclass : #Object,
	#instVars : [
		'libraries'
	],
	#category : 'ASN1-Builder'
}

{ #category : #accessing }
ASN1LibraryCollection >> add: aModuleLibrary [ 
	libraries add: aModuleLibrary 
]

{ #category : #'as yet unclassified' }
ASN1LibraryCollection >> checkDependencies [
	libraries do: [ :library |
		library dependencies do: [ :dependency |
			(self includesLibrary: dependency )
				ifFalse: [ NotFound signal: library asString, ' has unsolved dependency: ', dependency asString ] 
				ifTrue: [ 
					((self libraryNamed: dependency) dependencies includes: library name)
						ifTrue: [ Error signal: 'cyclic dependency between ', library asString,' and ', dependency asString ] ] ] ]
]

{ #category : #'as yet unclassified' }
ASN1LibraryCollection >> includesLibrary: aString [ 
	^ libraries anySatisfy: [ :each | each name = aString ]
]

{ #category : #initialize }
ASN1LibraryCollection >> initialize [
	super initialize.
	libraries := OrderedCollection new.
	self add: ASN1DefaultModuleLibrary new
]

{ #category : #accessing }
ASN1LibraryCollection >> libraryNamed: aString [ 
	^ libraries detect: [ :each | each name = aString ]
]

{ #category : #'as yet unclassified' }
ASN1LibraryCollection >> moduleNamed: aString [ 
	libraries do: [ :library |
		(library includesModuleNamed: aString) ifTrue: [ 
			^ library moduleNamed: aString ] ].
	NotFound signal: 'Cannot find module named ', aString asString
]

{ #category : #'as yet unclassified' }
ASN1LibraryCollection >> rootModulesDo: aBlock [

	self sortedLibraries do: [ :library |
		library rootModuleNames do: [ :moduleName | 
			aBlock value: (library moduleNamed: moduleName ) ] ]
]

{ #category : #'as yet unclassified' }
ASN1LibraryCollection >> sortedLibraries [
	^ libraries sort: [ :a :b |  
		(b dependencies includes: a name) ]
]
