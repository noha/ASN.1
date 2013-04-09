X.680 grammar
globalModuleReference
	"spec: 
		GlobalModuleReference ::=
  			 modulereference AssignedIdentifier"
	^ (moduleReference trim, assignedIdentifier)