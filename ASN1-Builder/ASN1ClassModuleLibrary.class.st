Class {
	#name : #ASN1ClassModuleLibrary,
	#superclass : #ASN1ModuleLibrary,
	#instVars : [
		'path',
		'manifest'
	],
	#category : 'ASN1-Builder'
}

{ #category : #'as yet unclassified' }
ASN1ClassModuleLibrary >> compile: aString selector: aSelector [
	self class compile: (String streamContents: [:stream| 
		stream 
			nextPutAll: aSelector; 
			nextPut: Character cr;
			nextPut: Character tab;
			nextPutAll: '^ ';
			nextPutAll: aString  storeString ]) 
]

{ #category : #accessing }
ASN1ClassModuleLibrary >> dependencies: aCollection [ 
	self compile: aCollection selector: #dependencies
]

{ #category : #'as yet unclassified' }
ASN1ClassModuleLibrary >> escape: aString [
	^ aString select: [:each| each asciiValue between: 0 and: 127]
]

{ #category : #testing }
ASN1ClassModuleLibrary >> includesModuleNamed: aString [ 
	^ self respondsTo: (self selectorNameFrom: aString)
]

{ #category : #accessing }
ASN1ClassModuleLibrary >> moduleNamed: aString [
	^ (self perform: (self selectorNameFrom: aString) asSymbol )
]

{ #category : #accessing }
ASN1ClassModuleLibrary >> name: aString [ 
	self compile: aString selector: #name
]

{ #category : #accessing }
ASN1ClassModuleLibrary >> rootModules: aCollection [ 
	self compile: aCollection selector: #rootModules
]

{ #category : #'as yet unclassified' }
ASN1ClassModuleLibrary >> selectorNameFrom: aString [
	^ ( aString copyWithout: $-  ) uncapitalized asSymbol
]

{ #category : #'as yet unclassified' }
ASN1ClassModuleLibrary >> storeModule: aString named: moduleName [
	self 
		compile: (self escape: aString) 
		selector: (self selectorNameFrom: moduleName)
]
