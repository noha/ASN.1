X.680 grammar
encodingControlSections
	"Spec:
		EncodingControlSections ::= 
			EncodingControlSection EncodingControlSections |
			empty"
	self flag: #nottested.
	^ (encodingControlSection separatedBy: $, asParser trim) withoutSeparators optional