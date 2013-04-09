X.680 grammar
referencedType
	"spec:
		ReferencedType ::= 
			DefinedType  |	
			UsefulType |
			SelectionType |	
			TypeFromObject |
			ValueSetFromObjects"
	^ selectionType / typeFromObject / valueSetFromObjects / definedType / usefulType