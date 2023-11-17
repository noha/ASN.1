Class {
	#name : #ASN1ExampleGrammarTestResource,
	#superclass : #TestResource,
	#instVars : [
		'modules',
		'ast',
		'model'
	],
	#category : 'ASN1-Tests-AST'
}

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> applicationContextClass [
	<definition: #example>
	^ 'APPLICATION-CONTEXT ::= CLASS {
   &Symmetric OPERATION-PACKAGE OPTIONAL,
   &InitiatorConsumerOf OPERATION-PACKAGE OPTIONAL,
   &ResponderConsumerOf OPERATION-PACKAGE OPTIONAL,
   &code OBJECT IDENTIFIER }
WITH SYNTAX {
   [ OPERATIONS OF &Symmetric ]
   [ INITIATOR CONSUMER OF &InitiatorConsumerOf ]
   [ RESPONDER CONSUMER OF &ResponderConsumerOf ]
     ID &code }
'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> ast [
	^ ast ifNil: [ 
		ast := ASN1ASTRoot new.
		self prepareAst.
		ast ]
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> choiceWithImplicitTaggedTypes [
	<definition: #example>
	^ 'ChoiceWithImplicitTaggedTypes ::= CHOICE {present  [0] IMPLICIT INTEGER,
            absent   [1] IMPLICIT NULL }'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> complexChoice [
	<definition: #example>
	^ 'ComplexChoice ::= CHOICE { 
		one [APPLICATION 1] SimpleSequence, 
		two [APPLICATION 2] INTEGER, 
		three [APPLICATION 3] INTEGER, 
		four [APPLICATION 4] INTEGER }'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> complexSequence [
	<definition: #example>
	^ 'ComplexSequence ::= SEQUENCE { 
		foo INTEGER, 
		bar OCTET STRING, 
		sub SubSequence}
	SubSequence ::= SEQUENCE { 
		sub1 INTEGER, 
		sub2 OCTET STRING, 
		sub3 SimpleSequence}
	TypedComplexSequence ::= SEQUENCE SIZE (1..MAX) OF ComplexSequence '
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> constructedComplexChoice [
	<definition: #example>
	^'UnconstructedChoice1 ::= OCTET STRING (SIZE (1..5))
UnconstructedChoice2 ::= OCTET STRING (SIZE (1..5))

      InnerChoice ::= CHOICE {
        ext-BearerService       [2] UnconstructedChoice1,
        ext-Teleservice [3] UnconstructedChoice2}

	SequenceWithConstruction ::= [4] SEQUENCE {
          basicService    [5]    InnerChoice     OPTIONAL,
          bla [6] OCTET STRING OPTIONAL
      }'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> definitionsFor: aSymbol [
	^ ((Pragma allNamed: #definition: in: self class)
		select: [:each| each arguments first = aSymbol ]) 
			collect: [:each| self perform: each method selector ]
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> emptySequence [
	<definition: #example>
	^ 'EmptySequence ::= SEQUENCE {}'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> exampleDefinitions [
	^ self definitionsFor: #example
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> exampleGrammarHead [
	<head: #example>
	^ '
Test-Examples {test(10) example(11) for(12) asn1(13) referenced(19) module(8)}
DEFINITIONS ::=
BEGIN

IMPORTS;
'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> exampleGrammarTail [
	<tail: #example>
	^ 'END'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> grammar: aSymbol [
	^ String streamContents: [:stream|
		stream nextPutAll: (self headFor: aSymbol).
		(self definitionsFor: aSymbol)
			do: [:each| stream nextPutAll: each ]
			separatedBy: [ stream nextPutAll: String lf ].
		stream nextPutAll: (self tailFor: aSymbol) ]
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> gsmMessagingId [
	<definition: #example>
	^ 'gsm-MessagingId OBJECT IDENTIFIER ::= 
	{mobileDomainId gsm-Messaging (4)}'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> headFor: aSymbol [
	^ self perform: (self methodWithPragma: #head asMutator andArgument: aSymbol).
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> implicitTaggedSequence [
	<definition: #example>
	^ 'ImplicitTaggedSequence ::= [APPLICATION:0] IMPLICIT SEQUENCE { number [0] INTEGER, othernumber [1] INTEGER }'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> mapSpecificAS [
	<definition: #example>
	^ 'mapSpecificAS ABSTRACT-SYNTAX ::= {
  SimpleChoice
  IDENTIFIED BY  gsm-MessagingId }'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> methodWithPragma: aSymbol andArgument: anotherSymbol [
	^ ((Pragma allNamed: aSymbol in: self class)
		detect: [:pragma| 
			pragma arguments first = anotherSymbol ]) method selector
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> mobileDomainId [
	<definition: #example>
	^ 'mobileDomainId OBJECT IDENTIFIER ::= 
	{itu-t (0) identified-organization (4) etsi (0) mobileDomain (0)}'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> objectFromDefinedSyntax [
	<definition: #example>
	^ '
infoRetrievalContext-v3 APPLICATION-CONTEXT ::= {
    -- Responder is HLR if Initiator is VLR 
    -- Responder is HLR if Initiator is SGSN 
    INITIATOR CONSUMER OF {
    infoRetrievalPackage-v3}
 ID {itu-t(0) infoRetrieval(14) version3(3)} }

infoRetrievalPackage-v3  OPERATION-PACKAGE ::= {
   -- Supplier is HLR if Consumer is VLR
   -- Supplier is HLR if Consumer is SGSN
   CONSUMER INVOKES {
      sendAuthenticationInfo} }

sendAuthenticationInfo  OPERATION ::= {            --Timer m
   ARGUMENT
      SendAuthenticationInfoArg
      -- optional
      -- within a dialogue sendAuthenticationInfoArg shall not be present in
      -- subsequent invoke components. If received in a subsequent invoke component
      -- it shall be discarded.

   RESULT
      SendAuthenticationInfoRes
      -- optional
   ERRORS {
      dataMissing }
   CODE  local:56 }

SendAuthenticationInfoArg ::= SEQUENCE {
   imsi        [0] IMSI,
   segmentationProhibited  NULL        OPTIONAL,
   immediateResponsePreferred [1] NULL       OPTIONAL,
   ...,
   additionalVectorsAreForEPS [6] NULL    OPTIONAL }

SendAuthenticationInfoRes ::= [3] SEQUENCE {
   authenticationSetList   NULL   OPTIONAL }

'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> objectIdentifierOnlyNumbers [
	<definition: #example>
	^ '
AttributeType           ::= OBJECT IDENTIFIER
id-domainComponent   AttributeType ::= { 0 9 2342 19200300 100 1 25 }
'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> operationClass [
	<definition: #example>
	^ 'OPERATION ::= CLASS {
  &ArgumentType          OPTIONAL,
  &argumentTypeOptional  BOOLEAN OPTIONAL,
  &returnResult          BOOLEAN DEFAULT TRUE,
  &ResultType            OPTIONAL,
  &resultTypeOptional    BOOLEAN OPTIONAL,
  &Errors                ERROR OPTIONAL,
  &Linked                OPERATION OPTIONAL,
  &synchronous           BOOLEAN DEFAULT FALSE,
  &alwaysReturns         BOOLEAN DEFAULT TRUE,
  &InvokePriority        Priority OPTIONAL,
  &ResultPriority        Priority OPTIONAL,
  &operationCode         Code UNIQUE OPTIONAL
}
WITH SYNTAX {
  [ARGUMENT &ArgumentType
   [OPTIONAL &argumentTypeOptional]]
  [RESULT &ResultType
   [OPTIONAL &resultTypeOptional]]
  [RETURN RESULT &returnResult]
  [ERRORS &Errors]
  [LINKED &Linked]
  [SYNCHRONOUS &synchronous]
  [ALWAYS RESPONDS &alwaysReturns]
  [INVOKE PRIORITY &InvokePriority]
  [RESULT-PRIORITY &ResultPriority]
  [CODE &operationCode]
}

ERROR ::= CLASS {
  &ParameterType          OPTIONAL,
  &parameterTypeOptional  BOOLEAN OPTIONAL,
  &ErrorPriority          Priority OPTIONAL,
  &errorCode              Code UNIQUE OPTIONAL
}
WITH SYNTAX {
  [PARAMETER &ParameterType
   [OPTIONAL &parameterTypeOptional]]
  [PRIORITY &ErrorPriority]
  [CODE &errorCode]
}

Code ::= CHOICE {local   INTEGER,
                 global  OBJECT IDENTIFIER
}

Priority ::= INTEGER(0..MAX)
'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> operationPackageClass [
	<definition: #example>
	^ 'OPERATION-PACKAGE ::= CLASS {
  &Both      OPERATION OPTIONAL,
  &Consumer  OPERATION OPTIONAL,
  &Supplier  OPERATION OPTIONAL,
  &id        OBJECT IDENTIFIER UNIQUE OPTIONAL
}
-- continued on the next page
WITH SYNTAX {
  [OPERATIONS &Both]
  [CONSUMER INVOKES &Supplier]
  [SUPPLIER INVOKES &Consumer]
  [ID &id]
}

'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> parameterizedErrors [
	<definition: #example>
	^ 'Errors{OPERATION:Operations} ERROR ::= {Operations.&Errors}'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> parseGrammar: aSymbol [
	^ self parseGrammar: (self grammar: aSymbol) rule: #start 
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> parseGrammar: aString rule: aSymbol [
	^ self parserClass parse: aString startingAt: aSymbol	
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> parseModelFrom: aString [
	^ ASN1 new ast 
		addModule: (self parseGrammar: aString);
		yourself
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> parseModelFrom: aString rule: aSymbol [
	^ self createModelFromAst: (
		self parseGrammar: aString rule: aSymbol)
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> parserClass [ 
	^ ASN1ASTParser
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> prepareAst [
	self  ast modules ifEmpty: [
		self ast addModule: (ASN1DefaultModuleLibrary new moduleNamed: 'default').
		self  ast 
			addModule: (self parseGrammar: #example);
			addModule: (self parseGrammar: #referenced).
		self ast annotateAsts].
	^ self  ast
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> purgeMS [
	<definition: #example>
	^ '
purgeMS  OPERATION ::= {                                --Timer m
        ARGUMENT
                PurgeMS-Arg
        RESULT
                PurgeMS-Res
                        -- optional
        ERRORS{
                dataMissing |
                unexpectedDataValue|
                unknownSubscriber}
        CODE    local:67 }

PurgeMS-Arg ::= [3] SEQUENCE {
        imsi                    IMSI,
        vlr-Number      [0] ISDN-AddressString  OPTIONAL,
        sgsn-Number     [1]     ISDN-AddressString      OPTIONAL,
        extensionContainer      ExtensionContainer      OPTIONAL,
        ...}

PurgeMS-Res ::= SEQUENCE {
   freezeTMSI  [0]   NULL     OPTIONAL,
   freezeP-TMSI   [1]   NULL     OPTIONAL,
   extensionContainer   ExtensionContainer   OPTIONAL,
   ...,
   freezeM-TMSI   [2]   NULL     OPTIONAL }

dataMissing  ERROR ::= {
        PARAMETER
                DataMissingParam
                -- optional
                -- DataMissingParam must not be used in version <3
        CODE    local:35 }

DataMissingParam ::= SEQUENCE {
   extensionContainer   ExtensionContainer   OPTIONAL,
   ...}

UnexpectedDataParam ::= SEQUENCE {
   extensionContainer   ExtensionContainer   OPTIONAL,
   ...}


unexpectedDataValue  ERROR ::= {
        PARAMETER
                UnexpectedDataParam
                -- optional
                -- UnexpectedDataParam must not be used in version <3
        CODE    local:36 }

unknownSubscriber  ERROR ::= {
        PARAMETER
                UnknownSubscriberParam
                -- optional
                -- UnknownSubscriberParam must not be used in version <3
        CODE    local:1 }

UnknownSubscriberParam ::= SEQUENCE {
   extensionContainer   ExtensionContainer   OPTIONAL,
   ...,
   unknownSubscriberDiagnostic   UnknownSubscriberDiagnostic   OPTIONAL}

UnknownSubscriberDiagnostic ::= ENUMERATED {
   imsiUnknown  (0),
   gprs-eps-SubscriptionUnknown  (1),
   ...,
   npdbMismatch  (2)}

IMSI ::= TBCD-STRING (SIZE (3..8))

ISDN-AddressString ::= 
                        AddressString (SIZE (1..maxISDN-AddressLength))

ExtensionContainer ::= SEQUENCE {
        privateExtensionList    [0]PrivateExtensionList OPTIONAL, 
        pcs-Extensions  [1]PCS-Extensions       OPTIONAL,
        ...}

TBCD-STRING ::= OCTET STRING

AddressString ::= OCTET STRING (SIZE (1..maxAddressLength))

PrivateExtensionList ::= SEQUENCE SIZE (1..maxNumOfPrivateExtensions) OF
                                PrivateExtension

PrivateExtension ::= SEQUENCE {
        extId           MAP-EXTENSION.&extensionId
                                ({ExtensionSet}),
        extType         MAP-EXTENSION.&ExtensionType
                                ({ExtensionSet}{@extId})        OPTIONAL}

maxNumOfPrivateExtensions  INTEGER ::= 10

PCS-Extensions ::= SEQUENCE {
        ...}

MAP-EXTENSION  ::= CLASS {
        &ExtensionType                          OPTIONAL,
        &extensionId    OBJECT IDENTIFIER }

'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> referencedGrammarHead [
	<head: #referenced>
	^ '
Referenced-Example {test(10) examples(11) for(12) asn1(13) not(19) registered(2) module(1)}
DEFINITIONS ::=
BEGIN

IMPORTS;
'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> referencedGrammarTail [
	<tail: #referenced>
	^ 'END'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> relativeOid [
	<definition: #example>
	^ 'gsm-NetworkId OBJECT IDENTIFIER ::= 
        {mobileDomainId gsm-Network (1)}
	
	map-DialogueAS  OBJECT IDENTIFIER ::=
        {gsm-NetworkId as-Id map-DialoguePDU (1) version1 (1)}
	
	CommonComponentId ::= INTEGER (0..9)
	as-Id CommonComponentId ::= 1'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> reset [
	model := nil
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> resolveableDefinedSyntax [
	<definition: #example>
	^ '
CriticalityType ::= ENUMERATED {ignore(0), abort(1)}
	
EXTENSION ::= CLASS {
   &ExtensionType,
   &criticality      CriticalityType DEFAULT ignore,
   &id   Code}

WITH SYNTAX {
   EXTENSION-SYNTAX  &ExtensionType
   CRITICALITY       &criticality
   IDENTIFIED BY     &id
   }

firstExtension EXTENSION ::= {
   EXTENSION-SYNTAX  NULL
   CRITICALITY       ignore
   IDENTIFIED BY     global : {itu-t(0) identified-organization(4) organisation(0) gsm(1)
                  capextension(2)}
   }
'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> sequenceWithExtension [
	<definition: #example>
	^'SequenceWithExtension ::= SEQUENCE {
  first      [0]  INTEGER,
  second [1]  INTEGER DEFAULT 2,
  third     [2]  INTEGER OPTIONAL,
  ...,                    
  fifth      [5]  INTEGER DEFAULT 5,
  sixth     [6] INTEGER
}
'

]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> simpleChoice [
	<definition: #example>
	^ 'SimpleChoice ::= CHOICE { number [0] INTEGER, nothing [1] NULL }'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> simpleSequence [
	<definition: #example>
	^ 'SimpleSequence ::= SEQUENCE { 
		first INTEGER, 
		second OCTET STRING }'
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> tailFor: aSymbol [
	^ self perform: (self methodWithPragma: #tail asMutator andArgument: aSymbol).
]

{ #category : #'as yet unclassified' }
ASN1ExampleGrammarTestResource >> typedSetFromCamel [
	<definition: #example>
	^ '
	PARAMETERS-BOUND ::= CLASS {                                                            
        &minGenericNumberLength                                         INTEGER,
        &maxGenericNumberLength                                         INTEGER,
        &numOfGenericNumbers                                            INTEGER 
}       
GenericNumber {PARAMETERS-BOUND : bound} ::= OCTET STRING (SIZE(
        bound.&minGenericNumberLength .. bound.&maxGenericNumberLength))
GenericNumbers {PARAMETERS-BOUND : bound} ::= SET SIZE(1..bound.&numOfGenericNumbers) OF GenericNumber {bound}
ConnectArgV1 ::= SEQUENCE {
        genericNumbers                          [14] GenericNumbers                             OPTIONAL
}
'

]
