X.681 grammar
objectClassAssignment
	"Spec:
		ObjectClassAssignment ::= objectclassreference '::=' ObjectClass "
	^ objectClassReference , '::=' asParser trim, objectClass