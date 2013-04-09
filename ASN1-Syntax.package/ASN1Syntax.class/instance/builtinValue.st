X.680 grammar
builtinValue
	"spec:
		BuiltinValue ::=
  		 BitStringValue | BooleanValue | CharacterStringValue |
   		ChoiceValue | EmbeddedPDVValue | EnumeratedValue |
   		ExternalValue | InstanceOfValue | IntegerValue |
   		IRIValue | NullValue | ObjectIdentifierValue |
   		OctetStringValue | RealValue | RelativeIRIValue |
   		RelativeOIDValue | SequenceValue | SequenceOfValue |
   		SetValue | SetOfValue | PrefixedValue | TimeValue"
	"disabled prefixedValue. It just introduces a left recursion without adding anything"
	^ self choiceOf: #( 
		bitStringValue  booleanValue objectIdentifierValue characterStringValue  choiceValue embeddedPdvValue 
		externalValue instanceOfValue integerValue iriValue nullValue  
		octetStringValue realValue relativeIriValue relativeOidValue sequenceValue sequenceOfValue 
		setValue setOfValue timeValue "enumeratedValue")