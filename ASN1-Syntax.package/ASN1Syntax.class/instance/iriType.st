X.680 grammar
iriType
	"Spec:
		IRIType ::= OID-IRI"
	self flag: #nottested.
	^ 'OID-IRI' asParser trim