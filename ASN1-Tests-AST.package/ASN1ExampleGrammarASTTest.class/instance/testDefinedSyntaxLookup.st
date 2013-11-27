as yet unclassified
testDefinedSyntaxLookup
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
