Class {
	#name : #ASN1Syntax,
	#superclass : #PPCompositeParser,
	#instVars : [
		'type',
		'builtinType',
		'typeAssignment',
		'prefixedType',
		'taggedType',
		'tag',
		'componentTypeLists',
		'componentTypeList',
		'componentType',
		'namedType',
		'value',
		'setType',
		'sequenceOfType',
		'builtinValue',
		'sequenceType',
		'exceptionSpec',
		'exceptionIdentification',
		'encodingPrefixedType',
		'extensionAndException',
		'optionalExtensionMarker',
		'componentValueList',
		'namedValue',
		'extensionAdditions',
		'extensionEndMarker',
		'extensionAdditionList',
		'extensionAddition',
		'extensionAdditionGroup',
		'referencedValue',
		'exports',
		'imports',
		'assignmentList',
		'symbolList',
		'symbol',
		'reference',
		'symbolsFromModule',
		'globalModuleReference',
		'objectReference',
		'objectSetReference',
		'valueFromObject',
		'referencedType',
		'tagDefault',
		'extensionDefault',
		'moduleBody',
		'moduleDefinition',
		'valueAssignment',
		'valueSetTypeAssignment',
		'valueSet',
		'elementSetSpecs',
		'elementSetSpec',
		'unions',
		'exclusions',
		'intersections',
		'elements',
		'subTypeElements',
		'objectSetElements',
		'numericRealValue',
		'specialRealValue',
		'valueList',
		'namedValueList',
		'choiceType',
		'extensionAdditionAlternatives',
		'alternativeTypeList',
		'extensionAdditionAlternativesList',
		'extensionAdditionAlternative',
		'extensionAdditionAlternativesGroup',
		'embeddedPDVType',
		'enumeratedType',
		'enumerations',
		'instanceOfType',
		'objectClassFieldType',
		'octetStringType',
		'setOfType',
		'selectionType',
		'typeFromObject',
		'valueSetFromObjects',
		'constraint',
		'typeWithConstraint',
		'generalConstraint',
		'includes',
		'containedSubtype',
		'valueRange',
		'lowerEndPoint',
		'upperEndPoint',
		'multipleTypeConstraint',
		'innerTypeConstraints',
		'fullSpecification',
		'partialSpecification',
		'typeConstraints',
		'namedConstraint',
		'presenceConstraint',
		'patternConstraint',
		'propertySettings',
		'object',
		'definedObject',
		'objectDefn',
		'externalObjectReference',
		'defaultSyntax',
		'fieldSetting',
		'primitiveFieldName',
		'setting',
		'typeFieldReference',
		'valueFieldReference',
		'valueSetFieldReference',
		'objectFieldReference',
		'objectSetFieldReference',
		'objectSet',
		'objectSetSpec',
		'definedSyntax',
		'definedSyntaxToken',
		'literal',
		'objectFromObject',
		'referencedObjects',
		'fieldName',
		'definedObjectSet',
		'externalObjectSetReference',
		'objectSetFromObjects',
		'objectClassAssignment',
		'objectClass',
		'definedObjectClass',
		'objectClassDefn',
		'externalObjectClassReference',
		'usefulObjectClassReference',
		'fieldSpec',
		'typeFieldSpec',
		'fixedTypeValueFieldSpec',
		'variableTypeValueFieldSpec',
		'fixedTypeValueSetFieldSpec',
		'variableTypeValueSetFieldSpec',
		'objectFieldSpec',
		'objectSetFieldSpec',
		'typeOptionalitySpec',
		'valueOptionalitySpec',
		'valueSetOptionalitySpec',
		'objectOptionalitySpec',
		'objectSetOptionality',
		'objectAssignment',
		'objectSetAssignment',
		'openTypeFieldVal',
		'parameterizedReference',
		'parameterizedAssignment',
		'parameterizedTypeAssignment',
		'parameterizedValueAssignment',
		'parameterizedValueSetTypeAssignment',
		'parameterizedObjectClassAssignment',
		'parameterizedObjectAssignment',
		'parameterizedObjectSetAssignment',
		'parameterList',
		'parameter',
		'paramGovernor',
		'governor',
		'simpleDefinedType',
		'actualParameterList',
		'parameterizedType',
		'parameterizedValueSetType',
		'definedType',
		'parameterizedObjectSet',
		'withSyntaxSpec',
		'syntaxList',
		'tokenOrGroupSpec',
		'requiredToken',
		'optionalGroup',
		'definedValue',
		'assignedIdentifier',
		'charsDefn',
		'namedBit',
		'namedBitList',
		'namedNumber',
		'namedNumberList',
		'objIdComponents',
		'numberForm',
		'relativeOidComponents',
		'charSyms',
		'characterStringList',
		'bitStringType',
		'integerType',
		'tagNumber',
		'enumeration',
		'restrictedCharacterStringValue',
		'nameAndNumberForm',
		'parameterizedValue',
		'simpleDefinedValue',
		'tString',
		'definitiveIdentification',
		'moduleIdentifier',
		'objectIdentifierValue',
		'iriValue',
		'sequenceValue',
		'restrictedCharacterStringType',
		'encodingReference',
		'encodingInstructionsAssignmentList',
		'encodingControlSection',
		'bString',
		'hString',
		'identifierList',
		'booleanType',
		'characterStringType',
		'dateType',
		'dateTimeType',
		'durationType',
		'externalType',
		'iriType',
		'objectIdentifierType',
		'realType',
		'relativeIriType',
		'relativeOidType',
		'timeType',
		'timeOfDayType',
		'cString',
		'quadruple',
		'tuple',
		'identifier',
		'number',
		'objectClassReference',
		'externalTypeReference',
		'externalValueReference',
		'valueReference',
		'definitiveOid',
		'definitiveNameAndNumberForm',
		'definitiveObjIdComponent',
		'signedNumber',
		'versionNumber',
		'moduleReference',
		'integerUnicodeLabel',
		'nonIntegerUnicodeLabel',
		'encodingReferenceDefault',
		'encodingControlSections',
		'realNumber',
		'typeReference',
		'tagClass',
		'choiceValue',
		'parameterizedObjectClass',
		'parameterizedObject',
		'typeReferenceToken',
		'userDefinedConstraint',
		'tableConstraint',
		'contentsConstraint',
		'userDefinedConstraintParameter',
		'componentRelationConstraint',
		'atNotation',
		'valueReferenceToken',
		'nullType',
		'sizeConstraint',
		'bitStringValue',
		'integerValue',
		'realValue',
		'relativeOidValue',
		'sequenceOfValue',
		'setOfValue',
		'setValue',
		'usefulType',
		'anyType'
	],
	#category : 'ASN1-Syntax'
}

{ #category : #'as yet unclassified' }
ASN1Syntax class >> abstractSyntax [
	^ 
	'ABSTRACT-SYNTAX ::= CLASS {
       	&id       OBJECT IDENTIFIER,
       	&Type     ,
       	&property BIT STRING {handles-invalid-encodings(0)}
                   DEFAULT {} }
     		WITH SYNTAX { &Type IDENTIFIED BY &id
                   [HAS PROPERTY &property] }'
]

{ #category : #'as yet unclassified' }
ASN1Syntax class >> reservedLiteralWords [
	^ #('BIT' 'BOOLEAN' 'CHARACTER' 'CHOICE' 'DATE' 'DATE-TIME' 'DURATION' 'EMBEDDED'
		'END' 'ENUMERATED' 'EXTERNAL' 'FALSE' 'INSTANCE' 'INTEGER' 'INTERSECTION' 'MINUS-INFINITY' 
		'NULL' 'OBJECT' 'OCTET' 'PLUS-INFINITY' 'REAL' 'RELATIVE-OID' 'SEQUENCE' 'SET'
		'TIME' 'TIME-OF-DAY' 'TRUE' 'UNION')
]

{ #category : #'as yet unclassified' }
ASN1Syntax class >> reservedWords [
	^ #('ABSENT' 'ABSTRACT-SYNTAX' 'ALL' 'APPLICATION' 'AUTOMATIC' 'BEGIN' 'BIT' 'BMPString' 
		'BOOLEAN' 'BY' 'CHARACTER' 'CHOICE' 'CLASS' 'COMPONENT' 'COMPONENTS' 'CONSTRAINED' 
		'CONTAINING' 'DATE' 'DATE-TIME' 'DEFAULT' 'DEFINITIONS' 'DURATION' 'EMBEDDED'
		'ENCODED' 'ENCODING-CONTROL' 'END' 'ENUMERATED' 'EXCEPT' 'EXPLICIT' 'EXPORTS' 
		'EXTENSIBILITY' 'EXTERNAL' 'FALSE' 'FROM' 'GeneralizedTime' 'GeneralString' 'GraphicString' 
		'IA5String' 'IDENTIFIER' 'IMPLICIT' 'IMPLIED' 'IMPORTS' 'INCLUDES' 'INSTANCE' 'INSTRUCTIONS' 
		'INTEGER' 'INTERSECTION' 'ISO646String' 'MAX' 'MIN' 'MINUS-INFINITY' 'NOT-A-NUMBER' 'NULL' 
		'NumericString' 'OBJECT' 'ObjectDescriptor' 'OCTET' 'OF' 'OID-IRI' 'OPTIONAL' 'PATTERN' 
		'PDV' 'PLUS-INFINITY' 'PRESENT' 'PrintableString' 'PRIVATE' 'REAL' 'RELATIVE-OID' 'RELATIVE-OID-IRI'
		'SEQUENCE' 'SET' 'SETTINGS' 'SIZE' 'STRING' 'SYNTAX' 'T61String' 'TAGS' 'TeletexString' 
		'TIME' 'TIME-OF-DAY' 'TRUE' 'TYPE-IDENTIFIER' 'UNION' 'UNIQUE' 'UNIVERSAL' 'UniversalString' 
		'UTCTime' 'UTF8String' 'VideotexString' 'VisibleString' 'WITH')
]

{ #category : #'as yet unclassified' }
ASN1Syntax class >> typeIdentifier [
	^ 
	'TYPE-IDENTIFIER ::= CLASS {
      	&id OBJECT IDENTIFIER UNIQUE,
      	&Type 
   	}
   	WITH SYNTAX {&Type IDENTIFIED BY &id}'

]

{ #category : #'X.683 grammar' }
ASN1Syntax >> actualParameterList [
	|  actualParameter |
	"Spec:
		ActualParameter ::= Type | Value | ValueSet | DefinedObjectClass | Object | ObjectSet"
	actualParameter := type / objectSet / object / valueSet / definedObjectClass / value.
	"Spec:
		ActualParameterList ::= '{' ActualParameter ',' + '}' "
	^ ${ asParser trim,  
		(actualParameter separatedBy:  $, asParser trim) withoutSeparators , 
		$} asParser trim ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> alternativeTypeList [
	"Spec:
		AlternativeTypeList ::= 
			NamedType |
			AlternativeTypeList ',' NamedType"
	^ (namedType separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'x.680 grammer 1998' }
ASN1Syntax >> anyType [
	"spec 1994"
	"AnyType ::= ANY | ANY DEFINED BY identifier"
	^ 'ANY' asParser trim, ('DEFINED' asParser trim, 'BY' asParser trim, identifier) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> assignedIdentifier [
	"spec: 
		AssignedIdentifier ::=
   			ObjectIdentifierValue |
   			DefinedValue |
   			empty"
	^ (objectIdentifierValue / definedValue) optional 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> assignmentList [
	"spec:
		AssignmentList ::=
   			Assignment |
   			AssignmentList Assignment"
	"spec:
		Assignment ::=
   			TypeAssignment | ValueAssignment | XMLValueAssignment | ValueSetTypeAssignment |
   			ObjectClassAssignment | ObjectAssignment | ObjectSetAssignment | ParameterizedAssignment"
	^ (typeAssignment /
		valueAssignment /
		valueSetTypeAssignment /
		objectClassAssignment /
		objectAssignment /
		objectSetAssignment / 
		parameterizedAssignment ) trim plus optional
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> atNotation [ 
	"Spec: 
		AtNotation ::= '@' ComponentIdList | '@.' Level ComponentIdList
		ComponentIdList ::= identifier '.' +
		Level ::= '.' Level | empty"
	^ ($@ asParser, identifier separatedBy: $. asParser) 
		/ ('@.' asParser, $. asParser star, (identifier separatedBy: $. asParser))
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> bString [
	"Spec:
		A 'bstring'  shall consist of an arbitrary number (possibly zero) of the characters:
		0 1 possibly intermixed with white-space, preceded by an APOSTROPHE (39) 
		character (') and followed by the pair of characters: 'B"
	^ $' asParser trim, 
		(( $0 asParser / $1 asParser / #space asParser) star) flatten,
		($' asParser, $B asParser ) ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> bitStringType [
	"Spec:
		BitStringType ::=
			BIT STRING |
			BIT STRING '{' NamedBitList '}'"
	^ ('BIT STRING' asParser trim,
		(${ asParser trim, 
			namedBitList,
			$} asParser trim) optional) 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> bitStringValue [
	"Spec:
		BitStringValue ::= 
			bstring |	
			hstring |	
			'{' IdentifierList '}'  |	
			'{' '}' |
			CONTAINING Value"
	^ bString / 
		 hString / 
		(( ${ asParser asn1Token, identifierList optional, $} asParser asn1Token) ==> #second) /
		('CONTAINING' asParser trim, value)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> booleanType [
	"Spec:
		BooleanType ::=BOOLEAN"
	^ 'BOOLEAN' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> booleanValue [
	"Spec:
		BooleanValue::= TRUE|FALSE"
	^ ('TRUE' asParser / 'FALSE' asParser) trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> builtinType [
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
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> builtinValue [
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
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> cString [
	"allow any character between double quotes. Double quotes are escaped by using a double double quote"
	^(($" asParser, 
		((($" asParser negate plus) /  ($" asParser, $" asParser)) star) flatten,
		$" asParser))  ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> charSyms [
	"spec:
		CharSyms ::= 
			CharsDefn |	
			CharSyms ',' CharsDefn"
	^ charsDefn separatedBy: $, asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> characterStringList [
	"spec:
		CharacterStringList ::= '{' CharSyms '}'"
	^ ${ asParser trim, charSyms, $} asParser trim ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> characterStringType [
	"spec:
		CharacterStringType ::= 
			RestrictedCharacterStringType |	
			UnrestrictedCharacterStringType"
	^ restrictedCharacterStringType / 'CHARACTER STRING' asParser "unrestrictedCharacterStringType"

]

{ #category : #'X.680 grammar' }
ASN1Syntax >> characterStringValue [
	"Spec:
		CharacterStringValue ::= 
			RestrictedCharacterStringValue |	
			UnrestrictedCharacterStringValue"
	"Spec:
		UnrestrictedCharacterStringValue ::= SequenceValue"
	^ restrictedCharacterStringValue / sequenceValue 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> charsDefn [
	"spec:
		CharsDefn ::= 
			cstring |	
			Quadruple |	
			Tuple |	
			DefinedValue"
	^ cString / quadruple / tuple / definedValue
]

{ #category : #accessing }
ASN1Syntax >> choiceOf: aCollection [
	^ aCollection allButFirst 
		inject: (self perform: aCollection first) 
		into: [: p : rule| p / (self perform: rule ) ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> choiceType [
	"Spec:
		ChoiceType	::= CHOICE '{' AlternativeTypeLists '}' "
	"Spec:
		AlternativeTypeLists ::= 
			RootAlternativeTypeList |
			RootAlternativeTypeList ',' ExtensionAndException ExtensionAdditionAlternatives OptionalExtensionMarker"
	"Spec:
		RootAlternativeTypeList ::= AlternativeTypeList"
	^ ('CHOICE' asParser trim, 
		${asParser trim,
			(alternativeTypeList, 
				extensionAndException optional, extensionAdditionAlternatives optional, optionalExtensionMarker optional), 
			$} asParser trim) ==> #third
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> choiceValue [
	"Spec:
		ChoiceValue ::= 
			identifier ':' Value"
	^ identifier , $: asParser trim , value
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> componentRelationConstraint [
	"ComponentRelationConstraint ::= '{' DefinedObjectSet '}' '{' AtNotation ',' + '}' "
	^ ${ asParser trim, definedObjectSet, $} asParser trim, 
		${ asParser trim, (atNotation separatedBy: $, asParser), $} asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> componentType [
	"spec:
		ComponentType ::=
   			NamedType |
   			NamedType OPTIONAL |
   			NamedType DEFAULT Value |
   			COMPONENTS OF  Type"
	^ (namedType , 
		(('OPTIONAL' asParser trim) / 
		('DEFAULT' asParser trim,  value)) optional)  / 
	  ('COMPONENTS OF' asParser trim, type)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> componentTypeList [
	"spec:
		ComponentTypeList ::=
   			ComponentType |
   			ComponentTypeList ',' ComponentType"
	^ (componentType separatedBy: $, asParser asn1Token) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> componentTypeLists [
	"spec:
		ComponentTypeLists ::=
   			RootComponentTypeList |
   			RootComponentTypeList ',' ExtensionAndException ExtensionAdditions OptionalExtensionMarker |
   			RootComponentTypeList ',' ExtensionAndException ExtensionAdditions ExtensionEndMarker ',' RootComponentTypeList |
   			ExtensionAndException ExtensionAdditions ExensionEndMarker ',' RootComponentTypeList |
   			ExtensionAndException ExtensionAdditions OptionalExtensionMarker"
	"spec:
		RootComponentTypeList ::= ComponentTypeList"

	^ ((componentTypeList , $, asParser asn1Token, extensionAndException, extensionAdditions, extensionEndMarker, $, asParser asn1Token , componentTypeList   ) /
		(componentTypeList , $, asParser asn1Token, extensionAndException, extensionAdditions, optionalExtensionMarker  ) /

		(extensionAndException, extensionAdditions, extensionEndMarker, $, asParser asn1Token, componentTypeList) /
		(extensionAndException, extensionAdditions, optionalExtensionMarker ) /
		componentTypeList ) ==> [:nodes| nodes copyWithout: ',' ]
		
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> componentValueList [
	"spec:
		ComponentValueList ::=
   			NamedValue |
   			ComponentValueList ',' NamedValue"
	^ (namedValue separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> constraint [
	"Spec:
		Constraint ::= '(' ConstraintSpec ExceptionSpec ')' "
	"Spec:
		ConstraintSpec ::=	
			SubtypeConstraint |
			GeneralConstraint"
	"Spec:
		SubtypeConstraint ::= ElementSetSpecs"
	^ $( asParser trim,
		(generalConstraint / elementSetSpecs) ,
		exceptionSpec, 
		$) asParser trim ==> [:nodes|  Array with: nodes second with: nodes third ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> containedSubtype [
	"Spec:
		ContainedSubtype ::= Includes Type"
	^ includes, type ==> #second
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> contentsConstraint [
	"Spec:
		ContentsConstraint ::= CONTAINING Type
		| ENCODED BY Value
		| CONTAINING Type ENCODED BY Value"
	^ ('CONTAINING' asParser trim, type, 'ENCODED BY' asParser trim, value)
		/ ('CONTAINING' asParser trim, type)
		/ ('ENCODED BY' asParser trim, value)

]

{ #category : #'X.680 grammar' }
ASN1Syntax >> dateTimeType [
	"Spec:
		DateTimeType ::= DATE-TIME"
	^ 'DATE-TIME' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> dateType [
	"Spec:
		DateType ::= DATE"
	^ 'DATE' asParser trim
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> defaultSyntax [ 
	"Spec:
		DefaultSyntax ::= '{' FieldSetting ',' * '}' "
	^ (${ asParser trim, 
		(fieldSetting separatedBy: $, asParser trim) withoutSeparators optional ,
		$} asParser trim ) ==> #second
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> definedObject [
	"Spec:
		DefinedObject ::= 
			ExternalObjectReference | 
			objectreference"
	^ externalObjectReference / objectReference
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> definedObjectClass [
	"Spec:
		DefinedObjectClass ::= 
			ExternalObjectClassReference |
			objectclassreference |
			UsefulObjectClassReference"
	^ externalObjectClassReference /
		objectClassReference /
		usefulObjectClassReference
		
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> definedObjectSet [
	"Spec:
		DefinedObjectSet ::= 
			ExternalObjectSetReference | 
			objectsetreference"
	^ externalObjectSetReference / objectSetReference 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> definedSyntax [
	"Spec:
		DefinedSyntax ::= '{' DefinedSyntaxToken empty * '}' "
	^ ${ asParser asn1Token,
		definedSyntaxToken plus,
		$} asParser asn1Token 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> definedSyntaxToken [
	"Spec:
		DefinedSyntaxToken ::= Literal | Setting"
	^ (literal / setting) trim 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> definedType [
	"spec:
		DefinedType ::= 
			ExternalTypeReference |
			typereference |
			ParameterizedType |
			ParameterizedValueSetType"
	^ parameterizedType / parameterizedValueSetType / 
		externalTypeReference /  typeReferenceToken 
		
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> definedValue [
	"spec:
		DefinedValue ::=
   			ExternalValueReference |
   			valuereference |
   			ParameterizedValue"
	^ parameterizedValue / externalValueReference / valueReference
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> definitiveIdentification [
	"Spec:
		DefinitiveIdentification ::= 
			DefinitiveOID  |	
			DefinitiveOIDandIRI  |
			empty"
	"Spec:
		DefinitiveOIDandIRI ::= 
			DefinitiveOID IRIValue"
	^(definitiveOid, iriValue optional) optional 

	
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> definitiveNameAndNumberForm [
	"Spec: 
		DefinitiveNameAndNumberForm ::= identifier '(' DefinitiveNumberForm ')' "
	"Spec:
		DefinitiveNumberForm	::= number"
	^ (identifier, $( asParser trim,  number, $) asParser trim)
		==> [:nodes| Array with: nodes first with: nodes third]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> definitiveObjIdComponent [
	"Spec:
		DefinitiveObjIdComponent ::= 
			NameForm |	
			DefinitiveNumberForm  |	
			DefinitiveNameAndNumberForm"
	"Spec: DefinitiveNumberForm	::= number"
	"spec: NameForm ::= identifier"
	^ definitiveNameAndNumberForm / 
		identifier /
		number "definitiveNumberForm"
		
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> definitiveOid [
	"Spec:
		DefinitiveOID ::= '{' DefinitiveObjIdComponentList '}' "
	"Spec:
		DefinitiveObjIdComponentList ::= 
			DefinitiveObjIdComponent |
			DefinitiveObjIdComponent DefinitiveObjIdComponentList"
	^ (${ asParser trim,
		definitiveObjIdComponent trim plus, 
		$} asParser trim) ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> durationType [
	"Spec:
		DurationType ::= DURATION"
	^ 'DURATION' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> elementSetSpec [
	"Spec:
		ElementSetSpec ::= Unions |	ALL Exclusions"
	^ unions / ('ALL' asParser trim, exclusions)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> elementSetSpecs [
	"Spec:
		ElementSetSpecs ::= 
			RootElementSetSpec |
			RootElementSetSpec ',' '...'  |	
			RootElementSetSpec ',' '...' ',' AdditionalElementSetSpec"
	"Spec: AdditionalElementSetSpec ::= ElementSetSpec"
	"Spec: RootElementSetSpec ::= ElementSetSpec"
	^ elementSetSpec, 
		($, asParser trim, '...' asParser trim, 
			($, asParser trim, elementSetSpec) optional) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> elements [
	"Spec:
		Elements ::= 
			SubtypeElements |
			ObjectSetElements |	
			'(' ElementSetSpec ')' "
	^ subTypeElements /
		objectSetElements /
		(( $( asParser trim, elementSetSpec, $) asParser trim ) ==> #second)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> embeddedPDVType [
	"Spec:
		EmbeddedPDVType ::= EMBEDDED PDV"
	^ 'EMBEDDED PDV' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> embeddedPdvValue [
	"Spec: 
		EmbeddedPDVValue ::= SequenceValue"
	^ sequenceValue
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> encodingControlSection [
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
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> encodingControlSections [
	"Spec:
		EncodingControlSections ::= 
			EncodingControlSection EncodingControlSections |
			empty"
	self flag: #nottested.
	^ (encodingControlSection separatedBy: $, asParser trim) withoutSeparators optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> encodingInstructionsAssignmentList [
	self flag: #incomplete.
	self flag: #nottested.
	^ 'encodingInstructionsAssignmentList' asParser star ==> [:n| n ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> encodingPrefixedType [
	"spec:
		EncodingPrefixedType ::=
  			 EncodingPrefix Type"
	"spec: 
		EncodingPrefix ::=
			'[' EncodingReference EncodingInstruction ']'"
	"spec: ecodingInstruction  all lexical items are allowed. To be able to return something use identifier"
	^ ($[ asParser, 
			encodingReference, 
			identifier, 
			$] asParser) , type 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> encodingReference [
	"spec:
		EncodingReference ::=
   			encodingreference ':' |
   			empty"
	"spec:
		An 'encodingreference' shall consist of a sequence of characters as 
		specified for a 'typereference' in 12.2, except that no lower-case letters 
		shall be included."
	 ^ (((#uppercase asParser, (
		((#uppercase asParser / #digit asParser) star, ($- asParser, (#uppercase asParser / #digit asParser) plus) plus) /
		((#uppercase asParser / #digit asParser) star) 
		)) flatten), $: asParser) optional 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> encodingReferenceDefault [
	"Spec:
		EncodingReferenceDefault ::= 
			encodingreference INSTRUCTIONS |	
			empty"
	^ (encodingReference , 'INSTRUCTIONS' asParser trim) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> enumeratedType [
	"Spec:
		EnumeratedType ::= ENUMERATED '{' Enumerations '}' "
	^ 'ENUMERATED' asParser asn1Token, ${ asParser asn1Token, enumerations, $} asParser asn1Token
		==> #third
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> enumeratedValue [
	"Spec:
		 EnumeratedValue ::= identifier"
	^ identifier
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> enumeration [
	"Spec:
		Enumeration ::= 
			EnumerationItem | 
			EnumerationItem ',' Enumeration"
	"Spec:
		EnumerationItem ::=
		 	identifier | 
			NamedNumber"
	^ ((namedNumber / identifier) separatedBy: $, asParser asn1Token) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> enumerations [
	"Spec:
		Enumerations ::= 
			RootEnumeration |
			RootEnumeration ',' '...' ExceptionSpec |
			RootEnumeration ',' '...' ExceptionSpec ',' AdditionalEnumeration"
	"Spec: AdditionalEnumeration ::= Enumeration"
	"Spec: RootEnumeration ::= Enumeration"
	^ enumeration,
		($, asParser trim, 
			'...' asParser trim, 
			"exceptionSpec, "
			(($, asParser trim,  enumeration) optional  ==> [ :n | n ifNotNil: [ n second ]])
			) optional
		
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> exceptionIdentification [
	"spec:
	ExceptionIdentification ::=
            SignedNumber |
            DefinedValue |
           Type ':' Value"
	^ signedNumber / definedValue / ( type , $: asParser, value)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> exceptionSpec [
	"spec:
	ExceptionSpec ::= '!' ExceptionIdentification | empty"
	
	^ ('!' asParser trim, exceptionIdentification) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> exclusions [
	"Spec:
		Exclusions ::= EXCEPT Elements"
	^ 'EXCEPT' asParser trim, elements ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> exports [
	"spec: 
		Exports ::=
   			EXPORTS SymbolsExported ';' |
   			EXPORTS ALL ';' |
   			empty"
	"spec:
		SymbolsExported ::=
   			SymbolList |
   			empty"
	^ ('EXPORTS' asParser trim , 
		(symbolList trim optional / 'ALL' asParser) trim,  $; asParser trim) optional  ==> [:nodes| 
			nodes ifNotNil: [ nodes second ] ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAddition [
	"spec:
		ExtensionAddition ::=
   			ComponentType |
   			ExtensionAdditionGroup"
	^ componentType / extensionAdditionGroup
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditionAlternative [
	"Spec:
		ExtensionAdditionAlternative ::= 
			ExtensionAdditionAlternativesGroup |
			NamedType"
	^ extensionAdditionAlternativesGroup / namedType 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditionAlternatives [
	"Spec:
		ExtensionAdditionAlternatives ::= 
			',' ExtensionAdditionAlternativesList |
			empty"
	^ ($, asParser trim, extensionAdditionAlternativesList ) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditionAlternativesGroup [
	"Spec:
		ExtensionAdditionAlternativesGroup ::=
			'[[' VersionNumber AlternativeTypeList ']]' "
	^ '[[' asParser trim, 
			versionNumber, 
			alternativeTypeList, ']]' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditionAlternativesList [
	"Spec:
		ExtensionAdditionAlternativesList ::= 
			ExtensionAdditionAlternative |
			ExtensionAdditionAlternativesList ',' ExtensionAdditionAlternative"
	^(extensionAdditionAlternative separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditionGroup [
	"spec:
		ExtensionAdditionGroup ::= '[[' VersionNumber ComponentTypeList ']]'"
	^ '[[' asParser trim, 
			 versionNumber, 
			componentTypeList , 
			']]' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditionList [
	"spec:
		ExtensionAdditionList ::=
   			ExtensionAddition |
   			ExtensionAdditionList ',' ExtensionAddition"
	^ (extensionAddition separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAdditions [
	"spec:
		ExtensionAdditions ::=
   			',' ExtensionAdditionList |
   			empty"
	^ (($, asParser trim, extensionAdditionList) optional) ==> [:nodes|
		nodes ifNotNil: [ nodes second ]]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionAndException [
	"spec:
		ExtensionAndException ::= '...' | '...' ExceptionSpec"
	^ '...' asParser asn1Token, (exceptionSpec optional)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionDefault [
	"Spec:
		ExtensionDefault ::=
			EXTENSIBILITY IMPLIED |
			empty"
	^ ('EXTENSIBILITY IMPLIED' asParser trim) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> extensionEndMarker [
	"spec:
		ExtensionEndMarker ::= ',' '..'"
	^ $, asParser trim, '...' asParser trim
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> externalObjectClassReference [
	"Spec:
		ExternalObjectClassReference ::= modulereference '.' objectclassreference"
	^  moduleReference, $. asParser,  objectClassReference  
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> externalObjectReference [
	"Spec:
		ExternalObjectReference ::= 
			modulereference '.' objectreference"
	^ moduleReference, $. asParser, objectReference
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> externalObjectSetReference [
	"Spec:
		ExternalObjectSetReference ::= modulereference '.' objectsetreference"
	^ moduleReference, $. asParser, objectSetReference 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> externalType [
	"Spec:
		ExternalType ::= EXTERNAL"
	^ 'EXTERNAL' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> externalTypeReference [ 
	"spec:
		ExternalTypeReference ::= 
			modulereference
			'.' 
			typereference"
	^ moduleReference , $. asParser, typeReference
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> externalValue [
	"Spec: 
		ExternalValue ::= SequenceValue"
	^ sequenceValue
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> externalValueReference [
	"spec:
		ExternalValueReference ::=
   			modulereference
   			'.'
   			valuereference"
	^ moduleReference , $. asParser, valueReference
]

{ #category : #actions }
ASN1Syntax >> failOnReservedLiteralWords: aParser [
	^ aParser >=> [:stream :cc| | string position |
			position := stream position.
			string := cc value. 
			(self class reservedLiteralWords includes: string) 
				ifTrue: [
					stream position: position. 
					PPFailure message: 'reserved token' at: stream position]
				ifFalse: [ string]]
]

{ #category : #actions }
ASN1Syntax >> failOnReservedWords: aParser [
	^ ASN1Configuration default failOnReservedWords
		ifTrue: [
			aParser >=> [:stream :cc| | string position |
				position := stream position.
				string := cc value. 
				(self class reservedWords includes: string) 
					ifTrue: [
						stream position: position. 
						PPFailure message: 'reserved token' at: stream position]
					ifFalse: [ string]]]
		ifFalse: [ aParser ]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> fieldName [
	"Spec:
		FieldName ::= PrimitiveFieldName '.' +"
	^ (primitiveFieldName separatedBy: $. asParser) withoutSeparators 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> fieldSetting [
	"Spec:
		FieldSetting ::= 
			PrimitiveFieldName Setting"
	^ primitiveFieldName trim, setting
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> fieldSpec [
	"Spec:
		FieldSpec ::=
			TypeFieldSpec |
			FixedTypeValueFieldSpec |
			VariableTypeValueFieldSpec |
			FixedTypeValueSetFieldSpec | 
			VariableTypeValueSetFieldSpec |
			ObjectFieldSpec |
			ObjectSetFieldSpec"
	^ fixedTypeValueFieldSpec /
		variableTypeValueFieldSpec / fixedTypeValueSetFieldSpec /
		variableTypeValueSetFieldSpec / objectFieldSpec / objectSetFieldSpec /
		typeFieldSpec 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> fixedTypeValueFieldSpec [
	"Spec:
		FixedTypeValueFieldSpec ::= valuefieldreference Type UNIQUE ? ValueOptionalitySpec ?"
	^ valueFieldReference, type trim, 'UNIQUE' asParser optional trim, valueOptionalitySpec optional trim
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> fixedTypeValueSetFieldSpec [
	"Spec:
		FixedTypeValueSetFieldSpec ::= valuesetfieldreference Type ValueSetOptionalitySpec ?"
	^ valueSetFieldReference, type trim, valueSetOptionalitySpec optional trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> fullSpecification [
	"Spec:
		FullSpecification	::= '{' TypeConstraints '}' "
	^ (${ asParser trim, 
		typeConstraints, 
		$} asParser trim) ==> #second
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> generalConstraint [
	"Spec:
		GeneralConstraint ::= UserDefinedConstraint | TableConstraint | ContentsConstraint"
	^ userDefinedConstraint / tableConstraint / contentsConstraint
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> globalModuleReference [
	"spec: 
		GlobalModuleReference ::=
  			 modulereference AssignedIdentifier"
	^ (moduleReference trim, assignedIdentifier)
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> governor [
	"Spec:
		Governor ::= Type | DefinedObjectClass"
	^ type / definedObjectClass 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> hString [
	"Spec:
		An 'hstring' shall consist of an arbitrary number (possibly zero) of the characters:
		ABCDEF0123456789 possibly intermixed with white-space, preceded by an APOSTROPHE (39) 
		character (') and followed by the pair of characters: 'H"
	^ $' asParser trim,
		( $A asParser / $B asParser / $C asParser / $D asParser / $E asParser / $F asParser / #digit asParser / #space asParser) star flatten,
		($' asParser, $H asParser) trim ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> identifier [
	"spec:
		An 'identifier' shall consist of an arbitrary number (one or more) of letters, digits, 
		and hyphens. The initial character shall be a lower-case letter. A hyphen shall not 
		be the last character. A hyphen shall not be immediately followed by another hyphen."
	"letting each identifier be an asn1Token is probably too permissive"
	^ (#lowercase asParser, (
		(#word asParser star, ($- asParser, #word asParser plus) star)
		)) flatten asn1Token
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> identifierList [ 
	"Spec: 
		IdentifierList ::= 
			identifier |
			IdentifierList ',' identifier"
	^ (identifier separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> imports [
	"spec: 
		Imports ::=
   			IMPORTS SymbolsImported ';' |
   			empty"
	"spec:
		SymbolsImported ::=
   			SymbolsFromModuleList |
   			empty"
	"spec:
		SymbolsFromModuleList ::=
   			SymbolsFromModule |
   			SymbolsFromModuleList SymbolsFromModule"
	^ ('IMPORTS' asParser asn1Token ,  
		 symbolsFromModule trim star, 
		$; asParser asn1Token) optional ==> [:nodes| nodes ifNotNil: [ nodes second ]]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> includes [
	"Spec:
		Includes ::= INCLUDES | empty"
	^ 'INCLUDES' asParser trim optional 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> innerTypeConstraints [
	"Spec:
		InnerTypeConstraints ::=
			 WITH COMPONENT SingleTypeConstraint |
			WITH COMPONENTS MultipleTypeConstraints"
	"Spec:
		SingleTypeConstraint::= Constraint"
	^ 'WITH COMPONENTS' asParser trim, (multipleTypeConstraint / constraint ) 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> instanceOfType [ 
	"Spec:
		InstanceOfType ::= INSTANCE OF DefinedObjectClass"
	^ 'INSTANCE OF' asParser trim, definedObjectClass 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> instanceOfValue [
	self flag: #notimplemented.
	^ 'INSTANCE OF NOT FOUND' asParser
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> integerType [
	"spec:
		IntegerType ::=
  			INTEGER |
   			INTEGER '{' NamedNumberList '}' "
	^ ('INTEGER' asParser trim, 
		( ${ asParser trim , namedNumberList, $} asParser trim) optional )  ==> [:nodes|
				 Array with: nodes first with: ((nodes second notNil)
					ifTrue: [ nodes second second ]
					ifFalse: [ nil ])
			 ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> integerUnicodeLabel [
	self flag: #incomplete.
	self flag: #nottested.
	^ #digit asParser optional ==> [:n| self notYetImplemented  ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> integerValue [
	"Spec:
		IntegerValue ::= 
			SignedNumber |	
			identifier"
	^ signedNumber flatten 
		/ identifier trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> intersections [
	"Spec:
		Intersections ::= 
			IntersectionElements |
			IElems IntersectionMark IntersectionElements"
	"Skipped IElems rule (IElems returns intersections). This would introduce a left recursion which can resolved to a star parser"
	"Spec:
		IntersectionMark ::= 
			'^' |
			INTERSECTION"
	"Spec:
		IntersectionElements ::= Elements | Elems Exclusions"
	"elems contains only elements. Removed elems rule to simplify this rule"
	"included intersectionElements rule"
	^ ((elements, exclusions optional) separatedBy: ( $^ asParser trim / 'INTERSECTION' asParser trim)) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> iriType [
	"Spec:
		IRIType ::= OID-IRI"
	self flag: #nottested.
	^ 'OID-IRI' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> iriValue [
	"Spec:
		IRIValue ::= '""'
			FirstArcIdentifier SubsequentArcIdentifier '""' '"
	"Spec: FirstArcIdentifier ::= '/' ArcIdentifier"
	"Spec: ArcIdentifier ::= 
			integerUnicodeLabel |	
			non-integerUnicodeLabel"
	"Spec: SubsequentArcIdentifier ::= 
			'/' ArcIdentifier SubsequentArcIdentifier |
			empty"
	self flag: #nottested.
	^ $" asParser trim, 
		($/ asParser trim, (integerUnicodeLabel / nonIntegerUnicodeLabel)) plus,
		$" asParser trim
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> literal [
	"Spec:
		Literal ::= word |
		',' "
	"Spec:
		A 'word' shall consist of a sequence of characters as specified for a 'typereference' in
		 ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2.1, except that no lower-case letters or digits shall be included."
	"Parse literal syntax ABC-DEF with guard clause to avoid the rule matching A in Abc-def. That would prevent
	the rule from matching type references"
	^ self failOnReservedLiteralWords: (
		((#uppercase asParser plus separatedBy: $- asParser), (#letter asParser / $- asParser)  not ) flatten 
		/ ',' asParser) 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> lowerEndPoint [
	"Spec:
		LowerEndpoint ::= LowerEndValue | LowerEndValue '<' "
	"Spec:
		LowerEndValue ::= Value | MIN"
	^ (value / 'MIN' asParser trim), $< asParser trim optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> moduleBody [
	"spec:
		ModuleBody ::=
   			Exports Imports AssignmentList |
   			empty"
	^ exports, imports, assignmentList  
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> moduleDefinition [
	"Spec:
		ModuleDefinition ::= 
			ModuleIdentifier 
			DEFINITIONS
			EncodingReferenceDefault 
			TagDefault 
			ExtensionDefault '::='
			BEGIN
			ModuleBody EncodingControlSections
			END"
	^ moduleIdentifier,
		'DEFINITIONS' asParser asn1Token,
		encodingReferenceDefault,
		tagDefault,
		extensionDefault,
		'::=' asParser trim,
		'BEGIN' asParser asn1Token,
		moduleBody,
		encodingControlSections,
		'END' asParser asn1Token ==> [:n| 
			Array with: n first with: n third with: n fourth with: n fifth with: n eighth with: n ninth ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> moduleIdentifier [
	"Spec:
		ModuleIdentifier ::= 
			modulereference DefinitiveIdentification"
	^ moduleReference asn1Token, definitiveIdentification
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> moduleReference [
	"spec says it is the same as type reference. Difference is in the used context"
	^ typeReference
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> multipleTypeConstraint [
	"Spec:
		MultipleTypeConstraints ::= 
			FullSpecification |
			PartialSpecification"
	^ fullSpecification / partialSpecification
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> nameAndNumberForm [
	"spec:
		NameAndNumberForm ::= identifier '(' NumberForm ')'"
	^ identifier, $( asParser trim, numberForm, $) asParser trim 
		==> [:nodes| Array with: nodes first with: nodes third ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedBit [
	"Spec:
		NamedBit ::= 
			identifier '(' number ')' |
			identifier '(' DefinedValue ')'"
	^ (identifier, 
		$( asParser trim, 
		(number / definedValue ), 
		$) asParser trim) ==> [:nodes| Array with: nodes first with: nodes third]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedBitList [
	"Spec:
		NamedBitList ::= 
			NamedBit |
			NamedBitList ',' NamedBit"
	^ (namedBit separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedConstraint [
	"Spec:
		NamedConstraint ::= identifier ComponentConstraint"
		"Spec:
		ComponentConstraint ::= ValueConstraint PresenceConstraint"
	"Spec:
		ValueConstraint ::= Constraint | empty"
	^ identifier, (constraint optional, presenceConstraint)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedNumber [
	"spec:
		NamedNumber ::=
   			identifier '(' SignedNumber ')' |
   			identifier '(' DefinedValue ')'"
	^ identifier , $( asParser trim , ( signedNumber / definedValue ), $) asParser trim
		==> [:nodes| Array with: nodes first with: nodes third ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedNumberList [
	"spec:
		NamedNumberList ::=
  			 NamedNumber |
   			NamedNumberList ',' NamedNumber"
	^ (namedNumber separatedBy:  $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedType [
	"spec:
		NamedType ::= identifier Type"
	^ identifier, type
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedValue [
	"spec:
		NamedValue ::= identifier Value"
	^ identifier , value 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> namedValueList [
	"spec:
		NamedValueList ::=
   			NamedValue |
   			NamedValueList ',' NamedValue"
	^ (namedValue separatedBy:  $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> nonIntegerUnicodeLabel [
	self flag: #incomplete.
	^ 'imnotparable' asParser optional ==> [:n| self notYetImplemented  ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> nullType [
	"Spec: NullType ::= NULL"
	^ 'NULL' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> nullValue [
	"Spec:
		 NullValue ::= NULL"

	^ 'NULL' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> number [
	^ #digit asParser plus flatten
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> numberForm [
	"spec:
		NumberForm ::= number | DefinedValue"
	^ (number / definedValue) flatten trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> numericRealValue [
	"Spec: 
		NumericRealValue ::= 
			realnumber |
			'-' realnumber |	
			SequenceValue"
	^ realNumber /
		($- asParser, realNumber) /
		sequenceValue 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> objIdComponents [
	"spec: 
		ObjIdComponents ::= 
			NameForm |	
			NumberForm |	
			NameAndNumberForm  |	
			DefinedValue"
	"spec:
		NameForm ::= identifier"
	^ nameAndNumberForm / identifier /  numberForm / definedValue
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> object [
	"Spec:
		Object ::= 
			DefinedObject | 
			ObjectDefn | 
			ObjectFromObject |
			 ParameterizedObject"
	^  parameterizedObject / objectDefn / objectFromObject  / definedObject   
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectAssignment [
	"Spec:
		ObjectAssignment ::= objectreference DefinedObjectClass '::=' Object"
	^ objectReference, definedObjectClass, 
		'::=' asParser trim, object 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectClass [
	"Spec:
		ObjectClass ::= DefinedObjectClass | ObjectClassDefn | ParameterizedObjectClass"
	^ objectClassDefn / definedObjectClass / parameterizedObjectClass
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectClassAssignment [
	"Spec:
		ObjectClassAssignment ::= objectclassreference '::=' ObjectClass "
	^ objectClassReference , '::=' asParser trim, objectClass
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectClassDefn [
	"Spec:
		ObjectClassDefn ::= CLASS '{' FieldSpec ',' + '}' WithSyntaxSpec?"
	^ ('CLASS' asParser trim, 
		${ asParser asn1Token, 
			(fieldSpec separatedBy:  $, asParser trim) withoutSeparators,
		$} asParser asn1Token, 
		withSyntaxSpec optional trim) ==> [:nodes| Array with: nodes third with: nodes fifth ]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectClassFieldType [
	"Spec:
		ObjectClassFieldType ::= DefinedObjectClass '.' FieldName"
	^ definedObjectClass, $. asParser, fieldName 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectClassReference [
	"spec:
		An 'objectclassreference'  shall consist of a sequence of characters as 
		specified for a 'typereference' in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2, 
		except that no lower-case letters shall be included."
	^ self failOnReservedWords: (
		(#uppercase asParser plus separatedBy: $- asParser), (#lowercase asParser not)) asn1Token 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectDefn [
	"Spec:
		ObjectDefn ::= 
			DefaultSyntax | 
			DefinedSyntax"
	^ defaultSyntax / definedSyntax 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectFieldReference [
	"Spec:
		An 'objectfieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for an 'objectreference' in 7.2."
	^ $& asParser, objectReference 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectFieldSpec [
	"Spec:
		ObjectFieldSpec ::= objectfieldreference DefinedObjectClass ObjectOptionalitySpec?"
 	^ objectFieldReference trim, definedObjectClass, objectOptionalitySpec optional
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectFromObject [
	"Spec:
		ObjectFromObject ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> objectIdentifierType [
	"Spec:
		ObjectIdentifierType ::=
			OBJECT IDENTIFIER"
	^ 'OBJECT IDENTIFIER' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> objectIdentifierValue [ 
	"spec: 
		ObjectIdentifierValue ::= 
			'{' ObjIdComponentsList '}' |	
			'{' DefinedValue ObjIdComponentsList '}'"
	"spec: 
		ObjIdComponentsList ::= 
			ObjIdComponents  |	
			ObjIdComponents ObjIdComponentsList"
	^ ${ asParser trim,
		((definedValue trim optional , objIdComponents trim plus) /
		(objIdComponents trim plus)), 
		$} asParser trim ==> #second
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectOptionalitySpec [
	"Spec:
		ObjectOptionalitySpec ::= OPTIONAL | DEFAULT Object"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim , object)
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectReference [
	"spec:
		An 'objectreference' shall consist of a sequence of characters as 
		specified for a 'valuereference' in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.4."
	^ valueReference
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSet [
	"Spec:
		ObjectSet ::= '{' ObjectSetSpec '}' "
	^ ${ asParser asn1Token,
		objectSetSpec,
		$} asParser asn1Token ==> [:nodes| nodes second ]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetAssignment [
	"Spec:
		ObjectSetAssignment ::= objectsetreference DefinedObjectClass '::=' ObjectSet"
	^ objectSetReference trim, definedObjectClass, '::=' asParser trim, objectSet 
		==> [:nodes| Array with: nodes first with: nodes second with: nodes fourth ]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetElements [
	"Spec:
		ObjectSetElements ::= 
			Object | 
			DefinedObjectSet | 
			ObjectSetFromObjects | 
			ParameterizedObjectSet"
	^ object / parameterizedObjectSet / definedObjectSet / objectSetFromObjects 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetFieldReference [
	"Spec:
		An objectsetfieldreference shall consist of an ampersand (&) immediately followed by a sequence of 
		characters as specified for an 'objectsetreference' in 7.3."
	^ $& asParser, objectSetReference ==> #second
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetFieldSpec [
	"Spec:
		ObjectSetFieldSpec ::= objectsetfieldreference DefinedObjectClass ObjectSetOptionalitySpec ?"
	^ (objectSetFieldReference, definedObjectClass, objectSetOptionality optional) 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetFromObjects [
	"Spec:
		ObjectSetFromObjects ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetOptionality [
	"Spec:
		ObjectSetOptionalitySpec ::= OPTIONAL | DEFAULT ObjectSet"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim, objectSet)
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetReference [
	"spec:
		An 'objectsetreference' shall consist of a sequence of characters as 
		specified for a 'typereference' in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2."
	^ typeReferenceToken
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> objectSetSpec [
	"Spec:
		ObjectSetSpec ::= 
			RootElementSetSpec |
			RootElementSetSpec ',' '...' |
			'...' |	
			'...' ',' AdditionalElementSetSpec |
			RootElementSetSpec ',' '...' ',' AdditionalElementSetSpec"
	"Spec: AdditionalElementSetSpec ::= ElementSetSpec"
	"Spec:RootElementSetSpec ::= ElementSetSpec"
	^ ((elementSetSpec, 
			$, asParser asn1Token , 
			'...' asParser asn1Token, 
			$, asParser asn1Token, 
			elementSetSpec) ==> [:n | Array with: n first with: n third with:n fifth ])  /
		((elementSetSpec, 
			$, asParser asn1Token, 
			'...' asParser asn1Token) ==> [ :n | Array with: n first with: n third ])  /
		(elementSetSpec ==> [ :n| Array with: n ])  /
		(('...' asParser trim, 
			$, asParser asn1Token, 
			elementSetSpec) ==> [ :n | Array with: n first with: n third ])  /
		( '...' asParser asn1Token ==> [ :n | Array with: n  ])
			
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> octetStringType [
	"Spec:
		OctetStringType ::= OCTET STRING"
	^ 'OCTET STRING' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> octetStringValue [
	"Spec:
		OctetStringValue ::=
			bstring |	
			hstring |	
			CONTAINING Value"
	^ bString / hString / ('CONTAINING' asParser trim, value)
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> openTypeFieldVal [
	"Spec:
		OpenTypeFieldVal ::= Type ':' Value"
	^ type, $: asParser, value
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> optionalExtensionMarker [
	"spec:
		OptionalExtensionMarker ::= ',' '...' | empty"
	^ (($, asParser trim , '...' asParser trim) ==> [:nodes| 
		nodes second ]) optional
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> optionalGroup [
	"Spec:
		OptionalGroup ::= '[' TokenOrGroupSpec empty + ']' "
	^ ($[ asParser trim, tokenOrGroupSpec trim plus, $] asParser trim) ==> #second
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> paramGovernor [
	"Spec:
		ParamGovernor ::= Governor | DummyGovernor"
	"Spec:
		DummyGovernor ::= DummyReference"
	"Spec:
		DummyReference ::= Reference"
	^ governor / reference
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameter [
	"Spec:
		Parameter ::= ParamGovernor ':' DummyReference | DummyReference"
	"Spec:
		DummyReference ::= Reference"
	^ (paramGovernor, $: asParser) optional, reference 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterList [
	"Spec:
		ParameterList ::= '{' Parameter ',' + '}' "
	^ ${ asParser asn1Token, 
		(parameter separatedBy:  $, asParser trim) withoutSeparators , 
		$} asParser asn1Token ==> #second
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedAssignment [
	"Spec:
		ParameterizedAssignment ::= 
			ParameterizedTypeAssignment |
			ParameterizedValueAssignment |
			ParameterizedValueSetTypeAssignment |
			ParameterizedObjectClassAssignment |
			ParameterizedObjectAssignment |
			ParameterizedObjectSetAssignment"
	^ parameterizedTypeAssignment / 
		parameterizedValueAssignment /
		parameterizedValueSetTypeAssignment /
		parameterizedObjectClassAssignment /
		parameterizedObjectAssignment /
		parameterizedObjectSetAssignment 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedObject [
	"Spec:
		ParameterizedObject ::= 
			DefinedObject ActualParameterList"
	^ definedObject, actualParameterList 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedObjectAssignment [
	"Spec:
		ParameterizedObjectAssignment ::=
			objectreference ParameterList DefinedObjectClass '::=' Object"
	^ objectReference, parameterList trim, definedObjectClass, '::=' asParser trim, object 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedObjectClass [
	"Spec:
		ParameterizedObjectClass ::= 
			DefinedObjectClass ActualParameterList"
	^definedObjectClass, actualParameterList 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedObjectClassAssignment [
	"Spec:
		ParameterizedObjectClassAssignment ::= objectclassreference ParameterList '::=' ObjectClass"
	^ objectClassReference, parameterList trim, '::=' asParser trim, objectClass 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedObjectSet [
	"Spec:
		ParameterizedObjectSet ::= DefinedObjectSet ActualParameterList"
	^ definedObjectSet trim, actualParameterList
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedObjectSetAssignment [
	"Spec:
		ParameterizedObjectSetAssignment ::=
			objectsetreference ParameterList DefinedObjectClass '::=' ObjectSet"
	^ objectSetReference, parameterList trim, definedObjectClass, '::=' asParser trim, objectSet 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedReference [
	"Spec:
		ParameterizedReference ::=
			Reference | 
			Reference '{' '}' "
	^ reference, (${ asParser trim, $} asParser trim) optional 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedType [
	"Spec:
		ParameterizedType ::= SimpleDefinedType ActualParameterList"
	^ simpleDefinedType, actualParameterList 
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedTypeAssignment [
	"Spec:
		ParameterizedTypeAssignment ::= 
			typereference ParameterList '::=' Type"
	^ typeReferenceToken, parameterList , '::=' asParser trim, type
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedValue [
	"Spec:
		ParameterizedValue ::= SimpleDefinedValue ActualParameterList"
	^ simpleDefinedValue, actualParameterList
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedValueAssignment [
	"Spec:
		ParameterizedValueAssignment ::= valuereference ParameterList Type '::=' Value"
	^ valueReference trim, parameterList trim, type, '::=' asParser trim, value
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedValueSetType [
	"Spec:
		ParameterizedValueSetType ::= SimpleDefinedType ActualParameterList"
	^ simpleDefinedType, actualParameterList trim
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> parameterizedValueSetTypeAssignment [
	"Spec:
		ParameterizedValueSetTypeAssignment ::= typereference ParameterList Type '::=' ValueSet"
	^ typeReferenceToken, parameterList trim, type, '::=' asParser trim, valueSet 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> partialSpecification [
	"Spec:
		PartialSpecification ::= '{' '...' ',' TypeConstraints '}' "
	^ ${ asParser trim, '...' asParser trim, $, asParser trim, typeConstraints, $} asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> patternConstraint [
	"Spec:
		PatternConstraint ::= PATTERN Value"
	^ 'PATTERN' asParser trim, value
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> prefixedType [
	"spec:
		PrefixedType ::=
   			 TaggedType |
    			EncodingPrefixedType"
    ^ taggedType / encodingPrefixedType

]

{ #category : #'X.680 grammar' }
ASN1Syntax >> presenceConstraint [
	"Spec:
		PresenceConstraint ::=PRESENT|ABSENT|OPTIONAL|empty"
	^ ( 'PRESENT' asParser / 'ABSENT' asParser / 'OPTIONAL' asParser) trim optional
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> primitiveFieldName [
	"Spec:
		PrimitiveFieldName ::= 
			typefieldreference |
			valuefieldreference |
			valuesetfieldreference |
			objectfieldreference |
			objectsetfieldreference"
	^ typeFieldReference / valueFieldReference / valueSetFieldReference / objectFieldReference / objectSetFieldReference
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> propertySettings [
	"Spec:
		PropertySettings ::= SETTINGS simplestring"
	"Spec:
		A 'simplestring' shall consist of one or more ISO/IEC 10646 characters whose character code 
		is in the range 32 to 126, preceded and followed by a QUOTATION MARK (34) character (''). 
		It shall not contain a QUOTATION MARK (34) character (''). The 'simplestring' may span more 
		than one line of text, in which case any characters representing end-of- line shall be treated as 
		spacing characters. In analyzing an instance of use of this notation, a 'simplestring' is distinguished 
		from a 'cstring' by the context in which it appears."
	^ 'SETTINGS' asParser trim, cString
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> quadruple [
	"spec: Quadruple ::= '{' Group ',' Plane ',' Row ',' Cell '}'"
	"spec: Group ::= number"
	"spec: Plane ::= number"
	"spec: Row ::= number"
	"spec: Cell ::= number"
	^ ${ asParser trim,
		number "Group", $, asParser trim,
		number "Plane", $, asParser trim,
		number, $, asParser trim,
		number "cell", 
		$} asParser trim 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> realNumber [
	"Spec:
		A 'realnumber' shall consist of an integer part that is a series of one or more digits, and optionally 
		a decimal point (.). The decimal point can optionally be followed by a fractional part which is one 
		or more digits. The integer part, decimal point or fractional part (whichever is last present) can 
		optionally be followed by an e or E and an optionally-signed exponent which is one or more digits. 
		The leading digit of the exponent shall not be zero unless the exponent is a single digit."
	^ number , 
		((($. asParser, number ) / $. asParser) optional), 
		(($e asParser / $E asParser), signedNumber) optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> realType [
	"Spec:
		RealType ::= REAL"
	^ 'REAL' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> realValue [
	"Spec:
		RealValue ::=
			NumericRealValue |	
				SpecialRealValue"
	^ numericRealValue / specialRealValue
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> reference [
	"spec:
		Reference ::=
   			typereference |
   			valuereference |
   			objectclassreference |
   			objectreference |
   			objectsetreference"
	^ typeReferenceToken / valueReference /
	  	objectClassReference / objectReference / objectSetReference
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> referencedObjects [
	"Spec:
		ReferencedObjects ::= 
			DefinedObject | 
			ParameterizedObject | 
			DefinedObjectSet | 
			ParameterizedObjectSet"
	^ parameterizedObject / parameterizedObjectSet / definedObject / definedObjectSet 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> referencedType [
	"spec:
		ReferencedType ::= 
			DefinedType  |	
			UsefulType |
			SelectionType |	
			TypeFromObject |
			ValueSetFromObjects"
	^ selectionType / typeFromObject / valueSetFromObjects / definedType / usefulType
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> referencedValue [
	"spec: 
		ReferencedValue ::= 
			DefinedValue |	
			ValueFromObject"
	^  valueFromObject / definedValue
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> relativeIriType [
	"Spec:
		RelativeIRIType ::= RELATIVE-OID-IRI"
	^ 'RELATIVE-OID-IRI' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> relativeIriValue [
	"Spec:
		RelativeIRIType ::= RELATIVE-OID-IRI"
	^ 'RELATIVE-OID-IRI' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> relativeOidComponents [
	"Spec:
		RelativeOIDComponents ::= 
			NumberForm |
			NameAndNumberForm |
			DefinedValue"
	^ nameAndNumberForm / numberForm / definedValue 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> relativeOidType [
	"Spec:
		RelativeOIDType ::= RELATIVE-OID"
	^ 'RELATIVE-OID' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> relativeOidValue [
	"Spec:
		RelativeOIDValue ::= '{' RelativeOIDComponentsList '}'"
	"Spec:
		RelativeOIDComponentsList ::= 
			RelativeOIDComponents |
			RelativeOIDComponents RelativeOIDComponentsList"
	^ (${ asParser trim, 
		relativeOidComponents plus, 
		$} asParser trim) ==> #second
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> requiredToken [
	"Spec:
		RequiredToken ::= Literal | PrimitiveFieldName"
	^ literal / primitiveFieldName
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> reservedWords [
	^ (PPChoiceParser new setParsers: (self class reservedWords collect: [:each| each asParser])) trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> restrictedCharacterStringType [
	"spec:
		RestrictedCharacterStringType ::=
			BMPString |  GeneralString |  GraphicString | 
			IA5String |  ISO646String | NumericString | 
			PrintableString | TeletexString |  T61String | 
			UniversalString |  UTF8String |  VideotexString | 
			VisibleString"
	^ ('BMPString' asParser / 'GeneralString' asParser / 'GraphicString' asParser / 'IA5String' asParser / 
		'ISO646String' asParser / 'NumericString' asParser / 'PrintableString' asParser / 
		'TeletexString' asParser /  'T61String' asParser / 'UniversalString' asParser / 'UTF8String' asParser / 
		'VideotexString' asParser / 'VisibleString' asParser) asn1Token
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> restrictedCharacterStringValue [
	"Spec:
		RestrictedCharacterStringValue ::= 
			cstring |	
			CharacterStringList |
			Quadruple |
			Tuple"
	^ cString / characterStringList / quadruple / tuple 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> selectionType [
	"Spec:
		SelectionType ::= identifier '<' Type"
	^ identifier, $< asParser trim, type
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> sequenceOfType [
	"spec:
		SequenceOfType ::= SEQUENCE OF Type | SEQUENCE OF NamedType"
	^ 'SEQUENCE' asParser trim, 'OF' asParser trim, (type / namedType) ==> #third
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> sequenceOfValue [
	"Spec:
		SequenceOfValue ::= 
			'{' ValueList '}' |
			'{' NamedValueList '}' |
			'{' '}'"
	^ ${ asParser trim, 
		( valueList / namedValueList ) optional,
		$} asParser trim ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> sequenceType [
	"spec:
		SequenceType ::=
   			SEQUENCE '{' '}' |
   			SEQUENCE '{' ExtensionAndException OptionalExtensionMarker '}' |
   			SEQUENCE '{' ComponentTypeLists '}'"
	^ 'SEQUENCE' asParser trim, 
		${ asParser asn1Token, (
			componentTypeLists /
			(extensionAndException, optionalExtensionMarker) 
			) optional,  
		$} asParser asn1Token ==> #third
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> sequenceValue [
	"Spec: 
		SequenceValue ::= 
			'{' ComponentValueList '}' |	
			'{' '}'"
	^ (${ asParser trim, 
		componentValueList optional , 
		$} asParser trim) ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> setOfType [
	"Spec:
		SetOfType ::= 
			SET OF Type |
			SET OF NamedType"
	^ 'SET' asParser trim, 'OF' asParser trim, (type / namedType) ==> #third
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> setOfValue [
	"Spec:
		SetOfValue ::= 
			'{' ValueList '}' |
			'{' NamedValueList '}' |
			'{' '}'"
	^ ${ asParser trim, 
		( valueList / namedValueList ) optional,
		$} asParser trim ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> setType [
	"spec:
		SetType ::=
   			SET '{' '}' |
   			SET '{' ExtensionAndException OptionalExtensionMarker '}' |
   			SET '{' ComponentTypeLists '}'"
	^ 'SET' asParser, 
		${ asParser trim, (
			(extensionAndException , optionalExtensionMarker) /
			componentTypeLists) optional,  
		$} asParser trim ==> #third
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> setValue [
	"spec: 
		SetValue ::=
  			 '{' ComponentValueList '}' |
   			'{' '}'"
	^ ${ asParser,
		componentValueList optional, 
		$} asParser ==> #second
]

{ #category : #grammar }
ASN1Syntax >> setting [
	"Spec:
		Setting ::= 
			Type | Value | ValueSet | Object | ObjectSet"
	^  type / valueSet / objectSet  / value / object
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> signedNumber [
	"spec:
		SignedNumber ::=
   			number |
   			'-' number"
	^ $- asParser optional, number
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> simpleDefinedType [
	"Spec:
		SimpleDefinedType ::= ExternalTypeReference | typereference"
	^ externalTypeReference / typeReferenceToken
]

{ #category : #'X.683 grammar' }
ASN1Syntax >> simpleDefinedValue [
	"Spec:
		SimpleDefinedValue ::= ExternalValueReference | valuereference"
	^ externalValueReference / valueReference 
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> sizeConstraint [
	"Spec: SizeConstraint ::= SIZE Constraint"
	^ 'SIZE' asParser asn1Token, constraint
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> specialRealValue [
	"Spec:
		SpecialRealValue ::=
			PLUS-INFINITY | 
			MINUS-INFINITY | 
			NOT-A-NUMBER"
	^ 'PLUS-INFINITY' asParser trim /
		'MINUS-INFINITY' asParser trim /
		'NOT-A-NUMBER' asParser trim
]

{ #category : #accessing }
ASN1Syntax >> start [
	^ moduleDefinition end
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> subTypeElements [
	| permittedAlphabet |
	"Spec:
		SubtypeElements ::= 
			SingleValue | ContainedSubtype | ValueRange |
			PermittedAlphabet | SizeConstraint | TypeConstraint |
			InnerTypeConstraints | PatternConstraint | PropertySettings |
			DurationRange | TimePointRange | RecurrenceRange "
	"Spec: DurationRange ::= ValueRange"
	"Spec: PermittedAlphabet ::= FROM Constraint"
	permittedAlphabet :=  'FROM' asParser trim, constraint.
	"Spec: RecurrenceRange ::= ValueRange"
	"Spec: TimePointRange ::= ValueRange"
	"Spec: TypeConstraint ::= Type"
	"Spec: SingleValue ::= Value"
	^ valueRange / containedSubtype / permittedAlphabet / sizeConstraint /
		 innerTypeConstraints / patternConstraint / propertySettings /
		valueRange "durationRange" / valueRange "timePointRange" / valueRange "recurrenceRange"  /  value "singleValue" / type "typeConstraint"
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> symbol [
	"spec:
		Symbol ::=
   			Reference |
   			ParameterizedReference"
	^ parameterizedReference / reference  
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> symbolList [
	"spec:
		SymbolList ::=
   			Symbol |
   			SymbolList ',' Symbol"
	^ (symbol separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> symbolsFromModule [
	"spec:
		SymbolsFromModule ::=
   			SymbolList FROM GlobalModuleReference"
	^ symbolList, 'FROM' asParser asn1Token, globalModuleReference 
		==> [:nodes| Array with: nodes first with: nodes third]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> syntaxList [
	"Spec:
		SyntaxList ::= '{' TokenOrGroupSpec empty + '}'"
	^ ${ asParser trim, tokenOrGroupSpec trim plus, $} asParser trim 
		==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> tString [
	"Spec:
		A 'tstring' shall consist of one or more of the characters:
		0123456789+-:.,/CDHMRPSTWYZ
		preceded and followed by a QUOTATION MARK (34) character."
	^ $" asParser,
		 (#digit asParser / $+ asParser / $- asParser / $: asParser / $. asParser / $, asParser / $/ asParser /
		$C asParser / $D asParser / $H asParser / $M asParser / $R asParser / $P asParser /
		$S asParser / $T asParser / $W asParser / $Y asParser / $Z asParser ) flatten plus,
		$" asParser ==> #second
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> tableConstraint [
	"Spec:
		TableConstraint ::= SimpleTableConstraint | ComponentRelationConstraint
		SimpleTableConstraint ::= ObjectSet"
	^ componentRelationConstraint / objectSet 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> tag [
	"spec:
		Tag ::= '[' EncodingReference Class ClassNumber ']' "
	^ $[ asParser trim, 
			encodingReference, 
			tagClass, 
			tagNumber trim, 
		$] asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> tagClass [
	"spec:
		Class ::=
   			UNIVERSAL |
   			APPLICATION |
   			PRIVATE |
  			 empty"
	^ ('UNIVERSAL' asParser / 'APPLICATION' asParser / 'PRIVATE' asParser) optional 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> tagDefault [
	"Spec:
		TagDefault ::=
			EXPLICIT TAGS  |
			IMPLICIT TAGS  |
			AUTOMATIC TAGS |
			empty"
	^ ('EXPLICIT TAGS' asParser / 'IMPLICIT TAGS' asParser / 'AUTOMATIC TAGS' asParser ) trim optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> tagNumber [
	"spec:
		ClassNumber ::=
   			number |
   			DefinedValue"
	^ number / definedValue
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> taggedType [
	"spec:
		TaggedType ::=
   			Tag Type |
   			Tag IMPLICIT Type |
   			Tag EXPLICIT Type"
	^ tag trim, 
		( 'IMPLICIT' asParser / 'EXPLICIT' asParser ) trim optional , 
		type 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> timeOfDayType [
	"Spec: 
		TimeOfDayType ::= TIME-OF-DAY"
	^ 'TIME-OF-DAY' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> timeType [
	"Spec:
		TimeType ::= TIME"
	^ 'TIME' asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> timeValue [
	"Spec:
		 TimeValue ::= tstring."
	^ tString
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> tokenOrGroupSpec [
	"Spec:
		TokenOrGroupSpec ::= RequiredToken | OptionalGroup"
	^ requiredToken / optionalGroup
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> tuple [
	"spec:
		Tuple ::= '{' TableColumns ',' TableRow '}' "
	"spec: TableColumn ::= number"
	"spec: TableRow ::= number"
	^ ${ asParser trim, number, $, asParser trim, number, $} asParser trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> type [
	"spec:
		Type ::= BuiltinType | ReferencedType | ConstrainedType
		ConstrainedType ::= 
			Type Constraint |
			TypeWithConstraint"
	"Mixed in constrainedTypeDefintion: '(type, constraint) / typeWithContstraint' to avoid left recursion "
	^ (typeWithConstraint / builtinType / anyType / referencedType  ) , (constraint star)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeAssignment [
	"spec:
		TypeAssignment ::=
  			 typereference
  			 '::='
   			Type"
	^ typeReferenceToken, '::=' asParser trim , type ==> [:nodes| Array with: nodes first with: nodes third ] 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeConstraints [
	"Spec:
		TypeConstraints ::= 
			NamedConstraint |
			NamedConstraint ',' TypeConstraints"
	^ (namedConstraint separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> typeFieldReference [
	"Spec:
		A 'typefieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for a 'typereference' in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2."
	^ $& asParser, typeReference ==> #second
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> typeFieldSpec [
	"Spec:
		TypeFieldSpec ::= typefieldreference TypeOptionalitySpec?"
	^ (typeFieldReference, typeOptionalitySpec optional)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeFromObject [
	"SPec:
		TypeFromObject ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> typeOptionalitySpec [
	"Spec:
		TypeOptionalitySpec ::= OPTIONAL | DEFAULT Type"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim, type)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeReference [
	^self typeReferenceRule 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeReferenceRule [
	"spec:
		12.2.1	A 'typereference' shall consist of an arbitrary number (one or more) of letters, 
			digits, and hyphens. The initial character shall be an upper-case letter. A hyphen shall 
			not be the last character. A hyphen shall not be immediately followed by another hyphen."
	^ self failOnReservedWords:   (#uppercase asParser, (
		(#word asParser star, ($- asParser, #word asParser plus) star)  
		)) flatten 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeReferenceToken [
	^ self typeReferenceRule asn1Token
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> typeWithConstraint [
	"Spec:
		TypeWithConstraint ::= 
			SET Constraint OF Type |
			SET SizeConstraint OF Type |
			SEQUENCE Constraint OF Type |
			SEQUENCE SizeConstraint OF Type |
			SET Constraint OF NamedType |
			SET SizeConstraint OF NamedType |
			SEQUENCE Constraint OF NamedType |
			SEQUENCE SizeConstraint OF NamedType"
	"Spec:
		SizeConstraint ::= SIZE Constraint"
	^ ('SET' asParser /'SEQUENCE' asParser) trim, 
		('SIZE' asParser optional, constraint ), 
		'OF' asParser trim, 
		(namedType / type)
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> unions [
	"Spec:
		Unions ::= 
			Intersections |
			UElems UnionMark Intersections"
	"Skipped UElems rule (UElems returns unions). Removed left recursion and simplyfied this rule at the same time"
	"Spec:
		UnionMark ::= '|' | UNION"
	^ (intersections separatedBy: (($| asParser / 'UNION' asParser) asn1Token )) withoutSeparators 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> upperEndPoint [
	"Spec:
		UpperEndpoint ::= UpperEndValue | '<' UpperEndValue"
	"Spec:
		UpperEndValue ::= Value | MAX"
	^ $< asParser trim optional,  (value / 'MAX' asParser trim)
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> usefulObjectClassReference [
	"Spec:
		UsefulObjectClassReference ::=
			TYPE-IDENTIFIER | 
			ABSTRACT-SYNTAX"
	^ ('TYPE-IDENTIFIER' asParser / 'ABSTRACT-SYNTAX' asParser) trim
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> usefulType [
	"spec: UsefulType	::= typereference"
	"Usefultypes are further specified as the following types"
	^ 'GeneralizedTime' asParser / 'UTCTime' asParser / 'ObjectDescriptior' asParser
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> userDefinedConstraint [
	"Spec:
		UserDefinedConstraint ::= CONSTRAINED BY '{' UserDefinedConstraintParameter ',' * '}' "
	^ 'CONSTRAINED' asParser trim, 'BY' asParser, 
		${ asParser asn1Token trim , 
			(userDefinedConstraintParameter separatedBy: $, asParser trim) optional, 
		$} asParser asn1Token trim
]

{ #category : #'X.682 grammar' }
ASN1Syntax >> userDefinedConstraintParameter [
	"Spec:
		UserDefinedConstraintParameter ::= Governor ':' Value
		| Governor ':' ValueSet
		| Governor ':' Object
		| Governor ':' ObjectSet
		| Type
		| DefinedObjectClass"
	^ (governor, $: asParser, (value / valueSet / object / objectSet)) 
		/ type
		/ definedObjectClass 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> value [
	"spec:
		Value ::=
   			BuiltinValue |
   			ReferencedValue |
   			ObjectClassFieldValue"
	"Spec: ObjectClassFieldValue ::= OpenTypeFieldVal | FixedTypeFieldVal"
	"Spec: FixedTypeFieldVal ::= BuiltinValue | ReferencedValue"
	"using longest match parser because builtinValue and referencedValue are ambiguous. At least the
	integerValue in builtValue can resolve to identifier preventing extended value formats like
	parameterizedValue to be parsed"
	^   openTypeFieldVal /  builtinValue /> referencedValue
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueAssignment [
	"Spec:
		ValueAssignment ::= 
			valuereference Type '::=' Value"
	^ valueReferenceToken, type, '::=' asParser trim, value ==> [:nodes|  Array with: nodes first with: nodes second with: nodes fourth ]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> valueFieldReference [
	"Spec:
		A 'valuefieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for a valuereference in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.4."
	^ $& asParser, valueReference ==> #second
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueFromObject [
	"Spec:
		ValueFromObject ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName 
		==> [:nodes| Array with: nodes first with: nodes third. ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueList [
	"Spec:
		ValueList ::= 
			Value |
			ValueList ',' Value"
	^ (value separatedBy: $, asParser trim) withoutSeparators 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> valueOptionalitySpec [
	"Spec:
		ValueOptionalitySpec ::= OPTIONAL | DEFAULT Value"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim, value )
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueRange [
	"Spec:
		ValueRange ::= LowerEndpoint '..' UpperEndpoint"
	^ lowerEndPoint, '..' asParser trim, upperEndPoint ==> [:nodes| nodes copyWithout: nodes second ]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueReference [
	"spec:
		A 'valuereference' shall consist of the sequence of characters specified for 
		an 'identifier' in 12.3. In analyzing an instance of use of this notation, a 
		'valuereference' is distinguished from an 'identifier by the context in which it appears."
	^ identifier
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueReferenceToken [
	^ valueReference ==> [:node| node value]
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueSet [
	"Spec:
		ValueSet ::= '{' ElementSetSpecs '}' "
	^ ${ asParser asn1Token, elementSetSpecs, $} asParser asn1Token ==> #second
	
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> valueSetFieldReference [
	"Spec:
		A 'valuesetfieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for a typereference in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2."
	^ $& asParser, typeReference ==> #second
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> valueSetFromObjects [
	"Spec:
		ValueSetFromObjects ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser,  fieldName
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> valueSetOptionalitySpec [ 
	"Spec:
		ValueSetOptionalitySpec ::= OPTIONAL | DEFAULT ValueSet"
	^ 'OPTIONAL' asParser  / ('DEFAULT' asParser, valueSet) 
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> valueSetTypeAssignment [
	"Spec:
		ValueSetTypeAssignment ::= 
			typereference Type '::=' ValueSet"
	^ typeReferenceToken, type, '::=' asParser trim, valueSet  
		==> [:nodes|  Array with: nodes first with: nodes second with: nodes fourth ]
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> variableTypeValueFieldSpec [
	"Spec:
		VariableTypeValueFieldSpec ::= valuefieldreference FieldName ValueOptionalitySpec ?"
	^ (valueFieldReference, fieldName, valueOptionalitySpec optional ) 
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> variableTypeValueSetFieldSpec [
	"Spec:
		VariableTypeValueSetFieldSpec ::= valuesetfieldreference FieldName ValueSetOptionalitySpec?"
	^ valueSetFieldReference, fieldName trim , valueSetOptionalitySpec optional
]

{ #category : #'X.680 grammar' }
ASN1Syntax >> versionNumber [
	"spec:
		VersionNumber ::= empty | number ':'"
	^ (number, $: asParser) optional
]

{ #category : #'X.681 grammar' }
ASN1Syntax >> withSyntaxSpec [
	"Spec:
		WithSyntaxSpec ::= WITH SYNTAX SyntaxList"
	^ 'WITH SYNTAX' asParser trim, syntaxList ==> #second
]
