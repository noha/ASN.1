Class {
	#name : #ASN1ModuleLibrary,
	#superclass : #Object,
	#category : 'ASN1-Builder'
}

{ #category : #copying }
ASN1ModuleLibrary >> copyModulesTo: aModuleLibrary [
	self allModuleNames do: [ :moduleName |
		aModuleLibrary storeModule: (self moduleNamed: moduleName) named: moduleName ]
]

{ #category : #copying }
ASN1ModuleLibrary >> copyTo: aModuleLibrary [
	self copyModulesTo: aModuleLibrary.
	aModuleLibrary 
		name: self name;
		dependencies: self dependencies;
		rootModules: self rootModules.
]

{ #category : #accessing }
ASN1ModuleLibrary >> dependencies [
	self subclassResponsibility 
]

{ #category : #accessing }
ASN1ModuleLibrary >> name [
	self subclassResponsibility 
]

{ #category : #printing }
ASN1ModuleLibrary >> printOn: aStream [
	aStream
		nextPutAll: self name;
		nextPutAll: ' module library'
]

{ #category : #accessing }
ASN1ModuleLibrary >> rootModuleNames [
	^ self rootModules 
]

{ #category : #accessing }
ASN1ModuleLibrary >> rootModules [
	self subclassResponsibility 
]
