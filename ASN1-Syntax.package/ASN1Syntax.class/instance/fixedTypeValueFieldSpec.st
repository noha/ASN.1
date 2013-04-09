X.681 grammar
fixedTypeValueFieldSpec
	"Spec:
		FixedTypeValueFieldSpec ::= valuefieldreference Type UNIQUE ? ValueOptionalitySpec ?"
	^ valueFieldReference, type trim, 'UNIQUE' asParser optional trim, valueOptionalitySpec optional trim