Class {
	#name : #ASN1FileModuleLibrary,
	#superclass : #ASN1ModuleLibrary,
	#instVars : [
		'path',
		'manifest'
	],
	#category : 'ASN1-Builder'
}

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary class >> path: aString [
	^ self new 
		path: aString asFileReference asAbsolute
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> allModuleNames [
	^ (path allFiles copyWithout: (path / self manifestFilename))
		collect: #basenameWithoutExtension
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> defaultConverter [
	^ TextConverter newForEncoding: 'latin1'
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> dependencies [
	^ self manifest at: 'dependencies'
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> filename: aString [ 
	^ aString, '.asn'
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> includesModuleNamed: aString [ 
	^ ( path / (self filename: aString)) exists
]

{ #category : #accessing }
ASN1FileModuleLibrary >> manifest [
	^ manifest ifNil: [ 
		manifest := self parseJson: self readManifest ]
]

{ #category : #accessing }
ASN1FileModuleLibrary >> manifestFilename [
	^ 'manifest.json'
]

{ #category : #loading }
ASN1FileModuleLibrary >> moduleNamed: aString [ 
	Transcript show: self name asString, ': loading module ', aString asString; cr.
	^ self readFile: (self filename: aString)
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> name [
	^ self manifest at: 'name'
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> parseJson: aString [ 
	^ NeoJSONReader fromString: aString
]

{ #category : #accessing }
ASN1FileModuleLibrary >> path [
	^ path
]

{ #category : #accessing }
ASN1FileModuleLibrary >> path: anObject [
	path := anObject
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> readFile: aString [ 
	^ (path / aString) readStream
		converter: self defaultConverter;
		contents
]

{ #category : #loading }
ASN1FileModuleLibrary >> readManifest [
	^ self readFile: self manifestFilename
]

{ #category : #'as yet unclassified' }
ASN1FileModuleLibrary >> rootModules [
	^ self manifest at: 'rootModules'
]
