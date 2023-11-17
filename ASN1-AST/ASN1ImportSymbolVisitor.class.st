"
I'm a visitor that annotates all tokens of an import statement with their definition modules and assignments.   
"
Class {
	#name : #ASN1ImportSymbolVisitor,
	#superclass : #ASN1ASTVisitor,
	#instVars : [
		'root'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #accessing }
ASN1ImportSymbolVisitor >> root [
	^ root
]

{ #category : #accessing }
ASN1ImportSymbolVisitor >> root: anObject [
	root := anObject
]

{ #category : #visiting }
ASN1ImportSymbolVisitor >> visitImportNode: anImport [
	| importModule |
	importModule := root moduleWithIdentifier: anImport moduleIdentifier.
	anImport moduleIdentifier name propertyAt: #definition put: importModule.
	anImport symbols do: [:each|
		each propertyAt: #definition put: (importModule localNames at: each label) ]
]

{ #category : #visiting }
ASN1ImportSymbolVisitor >> visitModuleDefinitionNode: aModule [
	self visitAll: aModule imports
]
