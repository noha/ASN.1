X.680 grammar
encodingControlSection
	"Spec:
		EncodingControlSection ::=
			ENCODING-CONTROL encodingreference EncodingInstructionAssignmentList"
	"spec:
		EncodingReference ::=
   			encodingreference ':' |
   			empty"
	self flag: #nottested.
	^ 'ENCODING-CONTROL' asParser trim, 
		encodingReference,
		encodingInstructionsAssignmentList