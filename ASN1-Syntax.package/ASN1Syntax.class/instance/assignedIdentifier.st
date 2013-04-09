X.680 grammar
assignedIdentifier
	"spec: 
		AssignedIdentifier ::=
   			ObjectIdentifierValue |
   			DefinedValue |
   			empty"
	^ (objectIdentifierValue / definedValue) optional 