X.681 grammar
fixedTypeValueSetFieldSpec
	"Spec:
		FixedTypeValueSetFieldSpec ::= valuesetfieldreference Type ValueSetOptionalitySpec ?"
	^ valueSetFieldReference, type trim, valueSetOptionalitySpec optional trim