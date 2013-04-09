X.680 grammar
moduleBody
	"spec:
		ModuleBody ::=
   			Exports Imports AssignmentList |
   			empty"
	^ exports, imports, assignmentList  