Class {
	#name : #ASN1DefaultModuleLibrary,
	#superclass : #ASN1ClassModuleLibrary,
	#category : 'ASN1-Builder'
}

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary class >> globalDeclarations [ 
	^'
	itu-t OBJECT IDENTIFIER ::= { itu-t (0) }
	iso OBJECT IDENTIFIER ::= { iso (1) }
	joint-iso-itu-t OBJECT IDENTIFIER ::= { joint-iso-itu-t (2) }'
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> abstractSyntaxClass [
	 ^ (ASN1ASTParser 
		parse: ASN1Syntax abstractSyntax 
		startingAt: #objectClassAssignment).

]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> dependencies [
	^ #()
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> globalDeclarations [
	^ ASN1ASTParser 
		parse: self class globalDeclarations 
		startingAt: #assignmentList
]

{ #category : #testing }
ASN1DefaultModuleLibrary >> includesModuleNamed: aString [ 
	^ false
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> moduleNamed: aString [ 
	^ self newDefaultModule 
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> name [
	^ 'default'
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> newDefaultModule [
	| module |
	ASN1Configuration default failOnReservedWords: false.
	module := ASN1ModuleDefinitionNode new.
	"oid repository gives oid 2.5.9 for abstract syntax so we are using 2.5
	as the module oid"
	module identifier: (ASN1ModuleIdentifierNode new
		name: 'default';
		oid: (ASN1ObjectIdNode fromString: '2.5')).
	module assignments 
			add: self abstractSyntaxClass ;
			add: self typeIdentifierClass;
			addAll: self globalDeclarations.
	ASN1Configuration default failOnReservedWords: true.
	^ module
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> rootModules [
	^ #( default )
]

{ #category : #'as yet unclassified' }
ASN1DefaultModuleLibrary >> typeIdentifierClass [
	^ (ASN1ASTParser 
		parse: ASN1Syntax typeIdentifier 
		startingAt: #objectClassAssignment)
]
