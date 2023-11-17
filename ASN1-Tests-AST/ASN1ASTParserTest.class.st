Class {
	#name : #ASN1ASTParserTest,
	#superclass : #PPCompositeParserTest,
	#category : 'ASN1-Tests-AST'
}

{ #category : #'as yet unclassified' }
ASN1ASTParserTest class >> methodsNotToBeImplemented [
	^ #(
		alternativeTypeList
		assignedIdentifier
		builtinType
		builtinValue
		characterStringList
		characterStringValue
		charsDefn
		charSyms
		choiceOf:
		componentTypeList
		componentValueList
		constraintSpec
		definedObject
		definedObjectSet
		definedSyntaxToken
		definedType
		definedValue
		definitiveNameAndNumberForm
		elements
		elementSetSpec
		elementSetSpecs
		enumeratedValue
		enumeration
		extensionAddition
		extensionAdditionAlternative
		extensionAdditionAlternativesList
		extensionAdditionAlternatives
		extensionAdditionList
		exceptionIdentification
		exceptionSpec	
		exclusions
		externalValue
		exports
		failOnReservedLiteralWords:
		failOnReservedWords:
		fieldName
		fieldSetting
		fieldSpec
		fullSpecification
		generalConstraint
		governor
		imports
		identifier
		identifierList
		includes
		moduleBody
		moduleReference
		multipleTypeConstraint
		namedBitList
		namedNumberList
		namedValue
		namedValueList
		nullValue
		number
		numberForm
		numericRealValue
		objectClass
		objectDefn
		objectFieldReference
		objectFieldSpec
		objectOptionalitySpec
		objectSetElements
		objectSetFieldReference
		objectSetFieldSpec
		objectSetOptionality
		objectSetSpec
		openTypeFieldVal
		parameterizedAssignment
		parameterList
		paramGovernor
		prefixedType
		primitiveFieldName
		realNumber
		realValue
		relativeOidComponents
		referencedObjects
		referencedType
		referencedValue
		requiredToken
		reservedWords
		restrictedCharacterStringValue
		simpleDefinedType
		simpleDefinedValue
		specialRealValue
		start
		subTypeElements
		symbol
		symbolList
		tagClass
		tagNumber
		tokenOrGroupSpec
		typeConstraints
		typeFieldReference
		typeOptionalitySpec
		typeReferenceRule
		usefulObjectClassReference
		valueFieldReference
		valueList
		valueSetOptionalitySpec
		variableTypeValueFieldSpec
		variableTypeValueSetFieldSpec
		withSyntaxSpec )
]

{ #category : #'as yet unclassified' }
ASN1ASTParserTest class >> methodsToBeImplemented [
	(self methodsNotToBeImplemented intersection: self methodsToBeImplementedLater) ifNotEmpty: [:col|
		Error signal: 'methods defined to be not implemented and later at the same time: ', col asString ]. 
	^ ((ASN1Syntax localSelectors 
		difference: self methodsNotToBeImplemented)
			difference: self methodsToBeImplementedLater) 
				difference: ASN1ASTParser localSelectors
	
]

{ #category : #'as yet unclassified' }
ASN1ASTParserTest class >> methodsToBeImplementedLater [
	^ #(
		atNotation
		characterStringType
		componentRelationConstraint
		contentsConstraint
		cString
		dateTimeType
		dateType
		embeddedPDVType
		embeddedPdvValue
		encodingControlSection
		encodingControlSections
		encodingInstructionsAssignmentList
		encodingPrefixedType
		encodingReference
		encodingReferenceDefault
		extensionAdditionAlternativesGroup
		extensionAdditionGroup
		extensionDefault
		externalObjectClassReference
		externalObjectSetReference 
		externalObjectReference
		externalTypeReference
		externalValueReference
		instanceOfType
		instanceOfValue
		integerUnicodeLabel
		iriType
		iriValue
		lowerEndPoint
		namedConstraint
		nonIntegerUnicodeLabel
		objectFromObject
		objectSetFromObjects
		octetStringValue
		partialSpecification
		patternConstraint
		presenceConstraint
		propertySettings
		quadruple
		realType
		relativeIriType
		relativeIriValue
		relativeOidType
		relativeOidValue
		sequenceValue
		setOfType
		setOfValue
		setType
		setValue
		tableConstraint
		timeOfDayType
		timeType
		timeValue
		tString
		tuple
		upperEndPoint
		userDefinedConstraint
		userDefinedConstraintParameter
		valueSetFromObjects
		versionNumber
		 )
]

{ #category : #testing }
ASN1ASTParserTest >> expectedFailures [ 
	^ #( testNoMethodsToBeImplemented  )
]

{ #category : #accessing }
ASN1ASTParserTest >> parserClass [
	^ ASN1ASTParser
]

{ #category : #tests }
ASN1ASTParserTest >> testAbsoluteOid [
	| parsed |
	parsed := self parse: 'mobileDomainId OBJECT IDENTIFIER ::= 
        {itu-t (0) identified-organization (4) etsi (0) mobileDomain (0)}' rule: #assignmentList.
	self assert: (parsed first right oidString =  '0.4.0.0')
]

{ #category : #tests }
ASN1ASTParserTest >> testAssignmentList [
	| parsed |
	parsed := self parse: 'foo Bar ::= 1
	zonk Puff ::= 2' rule: #assignmentList.
	self assert: (parsed size = 2).
	self assert: (parsed first right value = 1)
]

{ #category : #tests }
ASN1ASTParserTest >> testBitStringAssignment [
	| parsed |
	parsed := self parse: 'alertingLevel-0   AlertingPattern ::= ''00000000''B' rule: #assignmentList.
	self assert: (parsed first right type class = ASN1BitStringTypeNode )
]

{ #category : #tests }
ASN1ASTParserTest >> testBitStringType [
	| parsed |
	parsed := self parse: 'BIT STRING {
        msc-s (0),
        mgw (1),
        sgsn (2),
        ggsn (3)}' rule: #bitStringType.
	self assert: (parsed bits size = 4).
	self assert: (parsed bits first name = 'msc-s')
]

{ #category : #tests }
ASN1ASTParserTest >> testBooleanAssignment [
	| parsed |
	parsed := self parse: 'foo TestType ::= TRUE' rule: #assignmentList.
	self assert: (parsed first right type class = ASN1BooleanTypeNode )
]

{ #category : #tests }
ASN1ASTParserTest >> testBooleanType [
	| parsed |
	parsed := self parse: 'BOOLEAN' rule: #booleanType.
	self assert: (parsed name = 'BOOLEAN').
]

{ #category : #tests }
ASN1ASTParserTest >> testBooleanValue [
	| parsed |
	parsed := self parse: 'TRUE' rule: #builtinValue.
	self assert: (parsed value = 'TRUE').
]

{ #category : #tests }
ASN1ASTParserTest >> testChoiceType [
	| parsed |
	parsed := self parse: 'CHOICE {
  reroutingNumber    [0] IMPLICIT IsdnNumber,
  forwardedToNumber  [1] IMPLICIT IsdnNumber
}' rule: #choiceType.
	self assert: (parsed elements size = 2).
	self assert: (parsed elements first name = 'reroutingNumber').

]

{ #category : #tests }
ASN1ASTParserTest >> testChoiceValue [
	| parsed |
	parsed := self parse: 'noInvokeId InvokeId ::= absent:NULL' rule: #assignmentList.
	self assert: parsed first right class = ASN1ChoiceValueNode.
 
]

{ #category : #tests }
ASN1ASTParserTest >> testChoiceValueAssignment [
	| parsed |
	parsed := self parse: 'noInvokeId InvokeId ::= absent:NULL' rule: #assignmentList.
	self assert: parsed first right class = ASN1ChoiceValueNode.
 
]

{ #category : #tests }
ASN1ASTParserTest >> testChoiceWithImplicitContextTags [
	| nodes |
	nodes := self parse: ' CHOICE {present  [0] IMPLICIT present < InvokeId,
            absent   [1] IMPLICIT NULL
  }' rule: #choiceType.
	self assert: nodes elements second type tag tagNumber = '1'

]

{ #category : #tests }
ASN1ASTParserTest >> testComponentType [
	| parsed |
	parsed := self parse: 'reroutingNumber    [0] IMPLICIT IsdnNumber' rule: #componentType.
	self assert: (parsed isAsn1Node).

]

{ #category : #tests }
ASN1ASTParserTest >> testComponentTypeComponentsOf [
	| parsed |
	parsed := self parse: 'COMPONENTS OF Foodata' rule: #componentType.
	self assert: (parsed isAsn1Node).
	self assert: (parsed class = ASN1ComponentsOfNode )

]

{ #category : #tests }
ASN1ASTParserTest >> testComponentTypeLists [
	| parsed |
	parsed := self parse: 'one Two, three Four' rule: #componentTypeLists.
	self assert: (parsed size = 2).
	self assert: (parsed first type name = 'one')

]

{ #category : #tests }
ASN1ASTParserTest >> testConstraint [
	self flag: #todo
]

{ #category : #tests }
ASN1ASTParserTest >> testDefaultSyntax [
	| parsed |
	parsed := self parse: '{
&ArgumentType Matrix,
&ResultType  Matrix, 
&Errors {determinantIsZero},
&operationCode 7
}' rule: #defaultSyntax.
	self assert: (parsed size = 4)
]

{ #category : #tests }
ASN1ASTParserTest >> testDefinedObjectClass [
	| parsed |
	parsed := self parse: 'FOO-BAR' rule: #definedObjectClass.
	self assert: parsed isAsn1ReferenceNode 
]

{ #category : #tests }
ASN1ASTParserTest >> testDefinedSyntax [
	| parsed | 
	parsed := self parse: 'CLASS {
   &Symmetric OPERATION-PACKAGE OPTIONAL,
   &InitiatorConsumerOf OPERATION-PACKAGE OPTIONAL,
   &ResponderConsumerOf OPERATION-PACKAGE OPTIONAL,
   &code OBJECT IDENTIFIER }
WITH SYNTAX {
   [ OPERATIONS OF &Symmetric ]
   [ INITIATOR CONSUMER OF &InitiatorConsumerOf
     RESPONDER CONSUMER OF &ResponderConsumerOf ]
     ID &code }' ruleSelector: #objectClassDefn.
	self assert: parsed fields size = 4         
]

{ #category : #tests }
ASN1ASTParserTest >> testDefinitiveIdentification [
	| parsed |
	parsed := self parse: '{itu-t recommendation q 775 modules(2) examples(2) version1(1)}' rule: #definitiveIdentification.
	self assert: (parsed components size = 7).
	self assert: (parsed components at: 4) name = '775'
		
]

{ #category : #tests }
ASN1ASTParserTest >> testDefinitiveNameAndNumberForm [
	| parsed |
	parsed := self parse: 'modules(2)' rule: #definitiveNameAndNumberForm.
	self assert: (parsed name = 'modules').
	self assert: (parsed number = 2).
	
]

{ #category : #tests }
ASN1ASTParserTest >> testDefinitiveObjIdComponent [
	| parsed |
	parsed := self parse: 'itu-t' rule: #definitiveObjIdComponent.
	self assert: (parsed name = 'itu-t').
	self assert: (parsed number = 0)
]

{ #category : #tests }
ASN1ASTParserTest >> testDefinitiveOid [
	| parsed |
	parsed := self parse: '{itu-t recommendation q 775 modules(2) examples(2) version1(1)}' rule: #definitiveOid.
	self assert: parsed components size =7.
	self assert: (parsed components at: 6) number = 2
	
]

{ #category : #tests }
ASN1ASTParserTest >> testDurationType [
	| parsed |
	parsed := self parse: 'DURATION' rule: #durationType.
	self assert: parsed name = 'DURATION'.
	
]

{ #category : #tests }
ASN1ASTParserTest >> testExternalType [
	| parsed |
	parsed := self parse: 'EXTERNAL' rule: #externalType.
	self assert: parsed class = ASN1ExternalTypeNode.
	
]

{ #category : #tests }
ASN1ASTParserTest >> testExternalTypeReference [
	| parsed |
	parsed := self parse: 'Foo.Bar' rule: #externalTypeReference.
	self assert: parsed size = 3.
	self assert: (parsed at: 3) label = 'Bar'.
	self assert: (parsed at: 3) isAsn1ReferenceNode 
	
]

{ #category : #tests }
ASN1ASTParserTest >> testExternalValueReference [
	| parsed |
	parsed := self parse: 'Foo.bar' rule: #externalValueReference.
	self assert: parsed size = 3.
	self assert: (parsed at: 3) label = 'bar'.
	self assert: (parsed at: 3) isAsn1ReferenceNode 
	
]

{ #category : #tests }
ASN1ASTParserTest >> testFieldName [
	| parsed |
	parsed := self parse: '&Foo.&Far.&Zork' rule: #fieldName.
	self assert: parsed size = 3.
	self assert: (parsed allSatisfy: [:each| each isAsn1ReferenceNode ])	
]

{ #category : #tests }
ASN1ASTParserTest >> testFieldSetting [
	| parsed |
	parsed := self parse: '&Foo Bar' rule: #fieldSetting.
	self assert: parsed size = 2.
	self assert: (parsed allSatisfy: [:each| each isAsn1ReferenceNode ])	
]

{ #category : #tests }
ASN1ASTParserTest >> testFixedTypeValueFieldSpec [
	| parsed |
	parsed := self parse: '&componentGrouping    BOOLEAN DEFAULT TRUE' rule: #fixedTypeValueFieldSpec.
	self assert: parsed class = ASN1FieldSpecNode.
	self assert: parsed type name = 'BOOLEAN'.
	self assert: parsed hasDefaultValue.
	self assert: parsed defaultValue type class = ASN1BooleanTypeNode .
	self assert: parsed defaultValue value = 'TRUE'.

]

{ #category : #tests }
ASN1ASTParserTest >> testFixedTypeValueSetFieldSpec [
	| parsed |
	parsed := self parse: '&Errors   ERROR OPTIONAL' rule: #fixedTypeValueSetFieldSpec.
	self assert: parsed class = ASN1FieldSpecNode.
	self assert: parsed type label = 'ERROR'.
	self assert: parsed isOptional.
	
]

{ #category : #tests }
ASN1ASTParserTest >> testGlobalDeclarations [
	| parsed |
	parsed := self parse: ASN1DefaultModuleLibrary globalDeclarations rule: #assignmentList.
	self assert: parsed first left label = 'itu-t'.
	self assert: parsed first right components first name = 'itu-t'.
	self assert: parsed first right components first number = 0.
	self assert: parsed second left label = 'iso'.
	self assert: parsed second right components first name = 'iso'.
	self assert: parsed second right components first number = 1.
	self assert: parsed third left label = 'joint-iso-itu-t'.
	self assert: parsed third right components first name = 'joint-iso-itu-t'.
	self assert: parsed third right components first number = 2
]

{ #category : #tests }
ASN1ASTParserTest >> testHString [
	| parsed |
	parsed := self parse: '''DEADBEEF''H' rule: #hString.
	self assert: parsed type class = ASN1BitStringTypeNode .
	self assert: parsed value = 'DEADBEEF'
]

{ #category : #tests }
ASN1ASTParserTest >> testIdentifier [
	| parsed |
	parsed := self parse: 'foo' rule: #identifier.
	self assert: parsed = 'foo'
]

{ #category : #tests }
ASN1ASTParserTest >> testIdentifierList [
	| parsed |
	parsed := self parse: 'foo, bar, zork' rule: #identifierList.
	self assert: parsed size = 3.
	self assert: parsed = #( 'foo' 'bar' 'zork' )
]

{ #category : #tests }
ASN1ASTParserTest >> testIntegerType [
	| parsed |
	parsed := self parse: 'INTEGER { one(1), two(2) }' rule: #integerType.
	self assert: parsed name = 'INTEGER'.
	self assert: parsed namedNumbers size = 2
]

{ #category : #tests }
ASN1ASTParserTest >> testNoMethodsToBeImplemented [
	self assert: self class methodsToBeImplementedLater isEmpty 
]

{ #category : #tests }
ASN1ASTParserTest >> testObjectIdWithReference [
	| parsed |
	parsed := self parse: 'map-ac  OBJECT IDENTIFIER ::= {gsm-NetworkId ac-Id}' rule: #assignmentList.
	self assert: parsed first right alternatives first components size = 2
]

{ #category : #tests }
ASN1ASTParserTest >> testObjectIdWithTwoNodes [
	| parsed |
	parsed := self parse: 'id-at-name OBJECT IDENTIFIER ::= { id-at 41 }' rule: #assignmentList.
	self assert: parsed first right alternatives first components size = 2
]

{ #category : #tests }
ASN1ASTParserTest >> testObjectSetResolution [
	| parsed |
	parsed := self parse: '{ a | b | c, ..., d | e | f }' rule: #objectSet.
	self assert: parsed elementsSpec elements size = 7.

]

{ #category : #tests }
ASN1ASTParserTest >> testRelativeOid [
	| parsed components |
	parsed := self parse: 'gsm-MessagingId OBJECT IDENTIFIER ::= 
        {mobileDomainId gsm-Messaging (4)}' rule: #assignmentList.
	components := parsed first right components.
	self assert: (components first isAsn1ReferenceNode).
	self assert: (components second number = 4)
]

{ #category : #tests }
ASN1ASTParserTest >> testSequenceOnlyList [
	| nodes |
	
	nodes := self parse: 'SEQUENCE {
	molr-Type			[0]	MOLR-Type,
	locationMethod		[1]	LocationMethod			OPTIONAL,
	lcs-QoS				[2]	LCS-QoS					OPTIONAL,
	lcsClientExternalID	[3] LCSClientExternalID		OPTIONAL,
	mlc-Number			[4]	ISDN-AddressString		OPTIONAL,
	gpsAssistanceData	[5]	GPSAssistanceData		OPTIONAL }' rule: #sequenceType.
	self assert: nodes size = 6
]

{ #category : #tests }
ASN1ASTParserTest >> testSequenceWithExtensions [
	| nodes |
	
	nodes := self parse: 'SEQUENCE {
	molr-Type			[0]	MOLR-Type,
	locationMethod		[1]	LocationMethod			OPTIONAL,
	lcs-QoS				[2]	LCS-QoS					OPTIONAL,
	lcsClientExternalID	[3] LCSClientExternalID		OPTIONAL,
	mlc-Number			[4]	ISDN-AddressString		OPTIONAL,
	gpsAssistanceData	[5]	GPSAssistanceData		OPTIONAL,
	...,
	supportedGADShapes	[6]	SupportedGADShapes		OPTIONAL,
	lcsServiceTypeID	[7]	LCSServiceTypeID		OPTIONAL,
	ageOfLocationInfo	[8]	AgeOfLocationInformation	OPTIONAL,
	locationType		[9]	LocationType			OPTIONAL,
	pseudonymIndicator	[10]	NULL					OPTIONAL,
	h-gmlc-address 		[11] GSN-Address			OPTIONAL,
	locationEstimate	[12] Ext-GeographicalInformation		OPTIONAL,
	velocityEstimate	[13] VelocityEstimate		OPTIONAL,
	referenceNumber 	[14] LCS-ReferenceNumber 	OPTIONAL,
	periodicLDRInfo		[15] PeriodicLDRInfo		OPTIONAL,
	locationUpdateRequest	[16]	NULL				OPTIONAL,
	sequenceNumber 		[17] SequenceNumber 		OPTIONAL,
	terminationCause 	[18] TerminationCause 		OPTIONAL,
	mo-lrShortCircuit	[19]	NULL				OPTIONAL,
	ganssAssistanceData	[20] GANSSAssistanceData	OPTIONAL,
	multiplePositioningProtocolPDUs	[21] MultiplePositioningProtocolPDUs	OPTIONAL }' rule: #sequenceType.
	self assert: nodes size = 23
]

{ #category : #tests }
ASN1ASTParserTest >> testSyntaxMethodInheritance [
	self assert: self class methodsToBeImplemented isEmpty 
]

{ #category : #tests }
ASN1ASTParserTest >> testValueAssignment [
	| parsed |
	parsed := self parse: 'noInvokeId InvokeId ::= absent:NULL' rule: #assignmentList.
	self assert: parsed first right isValueNode.

]

{ #category : #tests }
ASN1ASTParserTest >> testValueSetAssignment [
	| parsed |
	parsed := self parse: 'Supported-MAP-Operations OPERATION ::= {updateLocation | cancelLocation | purgeMS | 
sendIdentification | updateGprsLocation | prepareHandover | sendEndSignal | 
processAccessSignalling
}
' rule: #assignmentList.
	self assert: parsed first right class = ASN1ValueSetNode  
]

{ #category : #tests }
ASN1ASTParserTest >> testValueSetResolution [
	| parsed |
	parsed := self parse: '{updateLocation | cancelLocation | purgeMS }' rule: #valueSet.
	self assert: parsed elementsSpec elements size = 3.
	parsed := self parse: '{updateLocation | cancelLocation | purgeMS, ...}' rule: #valueSet.
	self assert: parsed elementsSpec elements size = 4.
	parsed := self parse: '{updateLocation | cancelLocation | purgeMS, ..., prepareHandover | sendEndSignal }' rule: #valueSet.
	self assert: parsed elementsSpec elements size = 6
]
