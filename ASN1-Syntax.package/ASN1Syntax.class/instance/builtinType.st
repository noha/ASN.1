X.680 grammar
builtinType
	"Reordered parsers in way that the generic character string type is parsed at last"
	"BuiltinType ::=
   		BitStringType | BooleanType | CharacterStringType |
   		ChoiceType | DateType | DateTimeType |
   		DurationType | EmbeddedPDVType | EnumeratedType |
   		ExternalType | InstanceOfType | IntegerType |
   		IRIType | NullType | ObjectClassFieldType |
   		ObjectIdentifierType | OctetStringType | RealType |
   		RelativeIRIType | RelativeOIDType | SequenceType |
   		SequenceOfType | SetType | SetOfType |
   		PrefixedType | TimeType | TimeOfDayType"
	"Spec: NullType ::= NULL"
	^  bitStringType / booleanType / characterStringType  / 
		choiceType / sequenceType / dateType / dateTimeType / durationType / 
		embeddedPDVType / enumeratedType /  externalType / instanceOfType / 
		integerType / iriType /  nullType / objectClassFieldType / 
		objectIdentifierType / octetStringType / realType /  
		relativeIriType / relativeOidType / 
		sequenceOfType / setType / setOfType / prefixedType / timeType / 
		timeOfDayType