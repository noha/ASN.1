X.680 grammar
typeAssignment
	"spec:
		TypeAssignment ::=
  			 typereference
  			 '::='
   			Type"
	^ typeReferenceToken, '::=' asParser trim , type ==> [:nodes| Array with: nodes first with: nodes third ] 