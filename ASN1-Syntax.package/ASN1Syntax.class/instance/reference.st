X.680 grammar
reference
	"spec:
		Reference ::=
   			typereference |
   			valuereference |
   			objectclassreference |
   			objectreference |
   			objectsetreference"
	^ typeReferenceToken / valueReference /
	  	objectClassReference / objectReference / objectSetReference