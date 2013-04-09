X.681 grammar
primitiveFieldName
	"Spec:
		PrimitiveFieldName ::= 
			typefieldreference |
			valuefieldreference |
			valuesetfieldreference |
			objectfieldreference |
			objectsetfieldreference"
	^ typeFieldReference / valueFieldReference / valueSetFieldReference / objectFieldReference / objectSetFieldReference