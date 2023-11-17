Class {
	#name : #ASN1ExampleGrammarASTTest,
	#superclass : #ASN1ExampleGrammarTest,
	#category : 'ASN1-Tests-AST'
}

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testComplexChoice [
	| type |
	type := self astBindingValue: 'ComplexChoice'.
	self assert: type elements size = 4.

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testDefinedSyntaxLookup [
	| ast module |
	ast := ASN1ASTParser parse: '
CriticalityType ::= ENUMERATED {ignore(0), abort(1)}
	
EXTENSION ::= CLASS {
   &ExtensionType,
   &criticality      CriticalityType DEFAULT ignore,
   &id   Code}

WITH SYNTAX {
   EXTENSION-SYNTAX  &ExtensionType
   CRITICALITY       &criticality
   IDENTIFIED BY     &id
   }

firstExtension EXTENSION ::= {
   EXTENSION-SYNTAX  NULL
   CRITICALITY       ignore
   IDENTIFIED BY     global : {itu-t(0) identified-organization(4) organisation(0) gsm(1)
                  capextension(2)}
   }

Code ::= CHOICE {local   INTEGER,
                 global  OBJECT IDENTIFIER
}
' startingAt: #assignmentList.
	module := ASN1ModuleDefinitionNode new 
		assignments: ast.
	ASN1SymbolResolvingVisitor  new visit: module.

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testDefinedSyntaxObject [
	| obj |
	obj := self astBindingValue: 'mapSpecificAS' .
	self assert: (obj isValid).

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testErrorsParameter [
	| object  |
	object := self astBindingValue: 'Errors' .
	self assert: object elementsSpec elements first entity constraint object definition notNil 
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testObjectIdentifierOnlyNumbers [
	| type |
	type := self astBindingValue: 'id-domainComponent'.
	self assert: (type oidString = '0.9.2342.19200300.100.1.25')
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testOperationDefinition [
	| class |
	class := self astBindingValue: 'OPERATION' .
	self assert: class syntax size = 10
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testOperationInstantiation [
	| object  |
	object := self astBindingValue: 'purgeMS' .
	self assert: ( object syntax size = 8).

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarASTTest >> testSimpleChoice [
	| type |
	type := self astBindingValue: 'SimpleChoice'.
	self assert: type elements size = 2.
]
