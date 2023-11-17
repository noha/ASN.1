Class {
	#name : #ASN1SyntaxExamplesTest,
	#superclass : #PPCompositeParserTest,
	#category : 'ASN1-Tests-Syntax'
}

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> etsiExample [
	^ 'ExampleProtocol DEFINITIONS  ::=

BEGIN
  ExampleProtocolMessage ::= CHOICE {
                             rlcGeneralBroadcastInformation  RlcGeneralBroadcastInformation,
                             rlcDownlinkPhyModeChange        RlcDownlinkPhyModeChange,
                             rlcDownlinkPhyModeChangeAck     RlcDownlinkPhyModeChangeAck,
                             rlcFrequencyList                RlcFrequencyList,
                             rlcConnectionAdditionSetup      RlcConnectionAdditionSetup,
                             rlcConnectionAdditionAck        RlcConnectionAdditionAck  }
 RlcGeneralBroadcastInformation
                        ::= SEQUENCE {
                             duplexMode                      DuplexMode,
                             frameOffset                     FrameOffset,
                             uplinkPowerMaxRangingStart      UplinkPowerMax,
                             infoText                        InfoText   }
  DuplexMode           ::= ENUMERATED {fdd(0), tdd(1)}
  FrameOffset          ::= INTEGER   (0 | 8..20)
  UplinkPowerMax       ::= INTEGER   (10..20)
  InfoText             ::= IA5String (SIZE (0..128))
  RlcFrequencyList     ::= SEQUENCE  (SIZE(32)) OF PairOfCarrierFrequencies
  PairOfCarrierFrequencies
                        ::= SEQUENCE {
                             uplinkCarrierFrequency          CarrierFrequency,
                             downlinkCarrierFrequency        CarrierFrequency }
  CarrierFrequency     ::= INTEGER (0..130000)
END'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> personnelNotation [
	^ 'PersonnelRecord ::= [APPLICATION 0] SET
{
      name                  Name,
      title                    VisibleString,
	number               EmployeeNumber,
	dateOfHire         Date,
	nameOfSpouse   Name,
	children              SEQUENCE OF ChildInformation DEFAULT {}
}

ChildInformation ::= SET { 
	name	               Name,
	dateOfBirthDate  Date
}

Name ::= [APPLICATION 1] SEQUENCE
{	
	givenName  VisibleString,
	initial           VisibleString,
	familyName VisibleString
}

EmployeeNumber ::= [APPLICATION 2] INTEGER

Date ::= [APPLICATION 3] VisibleString -- YYYY MMDD '
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> personnelNotationNoComment [
	^ 'PersonnelRecord ::= [APPLICATION 0] SET
{
      name                  Name,
      title                    VisibleString,
	number               EmployeeNumber,
	dateOfHire         Date,
	nameOfSpouse   Name,
	children              SEQUENCE OF ChildInformation DEFAULT {}
}

ChildInformation ::= SET { 
	name	               Name,
	dateOfBirthDate  Date
}

Name ::= [APPLICATION 1] SEQUENCE
{	
	givenName  VisibleString,
	initial           VisibleString,
	familyName VisibleString
}

EmployeeNumber ::= [APPLICATION 2] INTEGER

Date ::= [APPLICATION 3] VisibleString
'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> pkcs12 [
	^ 'PKCS-12 {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1)
                 pkcs-12(12) modules(0)  pkcs-12(1)}

-- $Revision$

DEFINITIONS IMPLICIT TAGS ::=

BEGIN

-- EXPORTS ALL
-- All types and values defined in this module is exported for use in
-- other ASN.1 modules. 

IMPORTS

informationFramework
        FROM UsefulDefinitions {joint-iso-itu-t(2) ds(5) module(1)
        usefulDefinitions(0) 3}

ATTRIBUTE
	FROM InformationFramework informationFramework

ContentInfo, DigestInfo
	FROM PKCS-7 {iso(1) member-body(2) us(840) rsadsi(113549)
	pkcs(1) pkcs-7(7) modules(0) pkcs-7(1)}

PrivateKeyInfo, EncryptedPrivateKeyInfo
	FROM PKCS-8 {iso(1) member-body(2) us(840) rsadsi(113549)
	pkcs(1) pkcs-8(8) modules(1) pkcs-8(1)}

pkcs-9, friendlyName, localKeyId, certTypes, crlTypes
	FROM PKCS-9 {iso(1) member-body(2) us(840) rsadsi(113549)
	pkcs(1) pkcs-9(9) modules(0) pkcs-9(1)};

-- Object identifiers

rsadsi	OBJECT IDENTIFIER ::= {iso(1) member-body(2) us(840) rsadsi(113549)}
pkcs    OBJECT IDENTIFIER ::= {rsadsi pkcs(1)}
pkcs-12	OBJECT IDENTIFIER ::= {pkcs 12}
pkcs-12PbeIds                  	OBJECT IDENTIFIER ::= {pkcs-12 1}
pbeWithSHAAnd128BitRC4          OBJECT IDENTIFIER ::= {pkcs-12PbeIds 1}
pbeWithSHAAnd40BitRC4           OBJECT IDENTIFIER ::= {pkcs-12PbeIds 2}
pbeWithSHAAnd3-KeyTripleDES-CBC	OBJECT IDENTIFIER ::= {pkcs-12PbeIds 3}
pbeWithSHAAnd2-KeyTripleDES-CBC	OBJECT IDENTIFIER ::= {pkcs-12PbeIds 4}
pbeWithSHAAnd128BitRC2-CBC      OBJECT IDENTIFIER ::= {pkcs-12PbeIds 5}
pbewithSHAAnd40BitRC2-CBC       OBJECT IDENTIFIER ::= {pkcs-12PbeIds 6}

bagtypes			OBJECT IDENTIFIER ::= {pkcs-12 10 1}

-- The PFX PDU

PFX ::= SEQUENCE {
    	version		INTEGER {v3(3)}(v3,...),
    	authSafe	ContentInfo,
    	macData    	MacData OPTIONAL
}

MacData ::= SEQUENCE {
    	mac 		DigestInfo,
	macSalt	        OCTET STRING,
	iterations	INTEGER DEFAULT 1
-- Note: The default is for historical reasons and its use is
-- deprecated. A higher value, like 1024 is recommended.
}

AuthenticatedSafe ::= SEQUENCE OF ContentInfo
	-- Data if unencrypted
	-- EncryptedData if password-encrypted
	-- EnvelopedData if public key-encrypted

SafeContents ::= SEQUENCE OF SafeBag

SafeBag ::= SEQUENCE {
  	bagId	      	BAG-TYPE.&id ({PKCS12BagSet}),
  	bagValue      	[0] EXPLICIT BAG-TYPE.&Type({PKCS12BagSet}{@bagId}),
  	bagAttributes 	SET OF PKCS12Attribute OPTIONAL
}

-- Bag types

keyBag 	  BAG-TYPE ::= 
	{KeyBag IDENTIFIED BY {bagtypes 1}}
pkcs8ShroudedKeyBag BAG-TYPE ::=
	{PKCS8ShroudedKeyBag IDENTIFIED BY {bagtypes 2}}
certBag BAG-TYPE ::= 
	{CertBag IDENTIFIED BY {bagtypes 3}}
crlBag BAG-TYPE ::=
	{CRLBag IDENTIFIED BY {bagtypes 4}}
secretBag BAG-TYPE ::=    
	{SecretBag IDENTIFIED BY {bagtypes 5}}
safeContentsBag BAG-TYPE ::=
	{SafeContents IDENTIFIED BY {bagtypes 6}}

PKCS12BagSet BAG-TYPE ::= {
	keyBag | 
	pkcs8ShroudedKeyBag |
	certBag |
	crlBag | 
	secretBag | 
	safeContentsBag,
	... -- For future extensions
}

BAG-TYPE ::= TYPE-IDENTIFIER

-- KeyBag

KeyBag ::= PrivateKeyInfo

-- Shrouded KeyBag

PKCS8ShroudedKeyBag ::= EncryptedPrivateKeyInfo

-- CertBag

CertBag ::= SEQUENCE {
	certId    BAG-TYPE.&id   ({CertTypes}),
	certValue [0] EXPLICIT BAG-TYPE.&Type ({CertTypes}{@certId})
}

x509Certificate BAG-TYPE ::=
	{OCTET STRING IDENTIFIED BY {certTypes 1}}
	-- DER-encoded X.509 certificate stored in OCTET STRING
sdsiCertificate BAG-TYPE ::=
	{IA5String IDENTIFIED BY {certTypes 2}}
	-- Base64-encoded SDSI certificate stored in IA5String

CertTypes BAG-TYPE ::= {
	x509Certificate |
	sdsiCertificate,
	... -- For future extensions
}

-- CRLBag

CRLBag ::= SEQUENCE {
	crlId     	BAG-TYPE.&id ({CRLTypes}),
	crlValue 	[0] EXPLICIT BAG-TYPE.&Type ({CRLTypes}{@crlId})
}

x509CRL BAG-TYPE ::=
	{OCTET STRING IDENTIFIED BY {crlTypes 1}}
	-- DER-encoded X.509 CRL stored in OCTET STRING

CRLTypes BAG-TYPE ::= {
	x509CRL,
	... -- For future extensions
}

-- Secret Bag

SecretBag ::= SEQUENCE {
	secretTypeId BAG-TYPE.&id ({SecretTypes}),
	secretValue  [0] EXPLICIT BAG-TYPE.&Type ({SecretTypes}{@secretTypeId})
}

SecretTypes BAG-TYPE ::= {
	... -- For future extensions
}

-- Attributes

PKCS12Attribute ::= SEQUENCE {
	attrId	   	ATTRIBUTE.&id ({PKCS12AttrSet}),
	attrValues 	SET OF ATTRIBUTE.&Type ({PKCS12AttrSet}{@attrId})
} -- This type is compatible with the X.500 type Attribute

PKCS12AttrSet ATTRIBUTE ::= {
	friendlyName |
	localKeyId,
	... -- Other attributes are allowed
}

END
'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> remoteOperationsExample [

	^ 'Remote-Operations-Information-Objects {joint-iso-itu-t remote-operations(4)
  informationObjects(5) version1(0)} DEFINITIONS ::=
BEGIN

IMPORTS
  emptyBind, emptyUnbind
    FROM Remote-Operations-Useful-Definitions {joint-iso-itu-t
      remote-operations(4) useful-definitions(7) version1(0)};

OPERATION ::= CLASS {
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

OPERATION-PACKAGE ::= CLASS {
  &Both      OPERATION OPTIONAL,
  &Consumer  OPERATION OPTIONAL,
  &Supplier  OPERATION OPTIONAL,
  &id        OBJECT IDENTIFIER UNIQUE OPTIONAL
}
WITH SYNTAX {
  [OPERATIONS &Both]
  [CONSUMER INVOKES &Supplier]
  [SUPPLIER INVOKES &Consumer]
  [ID &id]
}

CONNECTION-PACKAGE ::= CLASS {
  &bind                OPERATION DEFAULT emptyBind,
  &unbind              OPERATION DEFAULT emptyUnbind,
  &responderCanUnbind  BOOLEAN DEFAULT FALSE,
  &unbindCanFail       BOOLEAN DEFAULT FALSE,
  &id                  OBJECT IDENTIFIER UNIQUE OPTIONAL
}
WITH SYNTAX {
  [BIND &bind]
  [UNBIND &unbind]
  [RESPONDER UNBIND &responderCanUnbind]
  [FAILURE TO UNBIND &unbindCanFail]
  [ID &id]
}

CONTRACT ::= CLASS {
  &connection           CONNECTION-PACKAGE OPTIONAL,
  &OperationsOf         OPERATION-PACKAGE OPTIONAL,
  &InitiatorConsumerOf  OPERATION-PACKAGE OPTIONAL,
  &InitiatorSupplierOf  OPERATION-PACKAGE OPTIONAL,
  &id                   OBJECT IDENTIFIER UNIQUE OPTIONAL
}
WITH SYNTAX {
  [CONNECTION &connection]
  [OPERATIONS OF &OperationsOf]
  [INITIATOR CONSUMER OF &InitiatorConsumerOf]
  [RESPONDER CONSUMER OF &InitiatorSupplierOf]
  [ID &id]
}

ROS-OBJECT-CLASS ::= CLASS {
  &Is                    ROS-OBJECT-CLASS OPTIONAL,
  &Initiates             CONTRACT OPTIONAL,
  &Responds              CONTRACT OPTIONAL,
  &InitiatesAndResponds  CONTRACT OPTIONAL,
  &id                    OBJECT IDENTIFIER UNIQUE
}
WITH SYNTAX {
  [IS &Is]
  [BOTH &InitiatesAndResponds]
  [INITIATES &Initiates]
  [RESPONDS &Responds]
  ID &id
}

Code ::= CHOICE {local   INTEGER,
                 global  OBJECT IDENTIFIER
}

Priority ::= INTEGER(0..MAX)

END'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> remoteOperationsUsefulExample [

	^ 'Remote-Operations-Useful-Definitions {joint-iso-itu-t remote-operations(4)
  useful-definitions(7) version1(0)}

DEFINITIONS IMPLICIT TAGS

::=

BEGIN

IMPORTS
  OPERATION, ERROR, OPERATION-PACKAGE, Code
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)}
  InvokeId, ROS{}
    FROM Remote-Operations-Generic-ROS-PDUs {joint-iso-itu-t
      remote-operations(4) generic-ROS-PDUs(6) version1(0)};

emptyBind OPERATION ::= {ERRORS       {refuse}
                         SYNCHRONOUS  TRUE
}

emptyUnbind OPERATION ::= {SYNCHRONOUS  TRUE
}

refuse ERROR ::= {CODE  local:-1
}

no-op OPERATION ::= {ALWAYS RESPONDS  FALSE
                     CODE             local:-1
}

Forward{OPERATION:OperationSet} OPERATION ::=
  {OperationSet | OperationSet.&Linked.&Linked |
   OperationSet.&Linked.&Linked.&Linked.&Linked}

Reverse{OPERATION:OperationSet} OPERATION ::= {Forward{{OperationSet.&Linked}}}

ConsumerPerforms{OPERATION-PACKAGE:package} OPERATION ::=
  {Forward{{package.&Consumer}} | Forward{{package.&Both}} |
   Reverse{{package.&Supplier}} | Reverse{{package.&Both}}}

SupplierPerforms{OPERATION-PACKAGE:package} OPERATION ::=
  {Forward{{package.&Supplier}} | Forward{{package.&Both}} |
   Reverse{{package.&Consumer}} | Reverse{{package.&Both}}}

AllOperations{OPERATION-PACKAGE:package} OPERATION ::=
  {ConsumerPerforms{package} | SupplierPerforms{package}}

recode{OPERATION:operation, Code:code} OPERATION ::= {
  ARGUMENT         operation.&ArgumentType
  OPTIONAL         operation.&argumentTypeOptional
  RESULT           operation.&ResultType
  OPTIONAL         operation.&resultTypeOptional
  RETURN RESULT    operation.&returnResult
  ERRORS           {operation.&Errors}
  LINKED           {operation.&Linked}
  SYNCHRONOUS      operation.&synchronous
  ALWAYS RESPONDS  operation.&alwaysReturns
  INVOKE PRIORITY  {operation.&InvokePriority}
  RESULT-PRIORITY  {operation.&ResultPriority}
  CODE             code
}

switch{OPERATION-PACKAGE:package, OBJECT IDENTIFIER:id} OPERATION-PACKAGE ::= 
{
  OPERATIONS        {package.&Both}
  CONSUMER INVOKES  {package.&Consumer}
  SUPPLIER INVOKES  {package.&Supplier}
  ID                id
}

combine{OPERATION-PACKAGE:ConsumerConsumes, OPERATION-PACKAGE:ConsumerSupplies,
        OPERATION-PACKAGE:base} OPERATION-PACKAGE ::= {
  OPERATIONS        {ConsumerConsumes.&Both | ConsumerSupplies.&Both}
  CONSUMER INVOKES  {ConsumerConsumes.&Consumer | ConsumerSupplies.&Supplier}
  SUPPLIER INVOKES  {ConsumerConsumes.&Supplier | ConsumerSupplies.&Consumer}
  ID                base.&id
}

ROS-SingleAS{InvokeId:InvokeIdSet, OPERATION-PACKAGE:package} ::=
  ROS{{InvokeIdSet}, {AllOperations  {package}}, {AllOperations  {package}}}

ROS-ConsumerAS{InvokeId:InvokeIdSet, OPERATION-PACKAGE:package} ::=
  ROS
    {{InvokeIdSet}, {ConsumerPerforms  {package}},
    {SupplierPerforms  {package}}}

ROS-SupplierAS{InvokeId:InvokeIdSet, OPERATION-PACKAGE:package} ::=
  ROS
    {{InvokeIdSet}, {SupplierPerforms  {package}},
    {ConsumerPerforms  {package}}}

END'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> simpleExample [
	^ 'TelephonyString ::=
  IA5String
    (FROM ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "*" |
           "#"))(SIZE (1..15))'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> tcapExample [
	^ '-- Generated by Asnp, the pretty-printer of France Telecom R&D (http://asn1.elibel.tm.fr/asnp/)
TCAP-Examples {itu-t recommendation q 775 modules(2) examples(2) version1(1)}
DEFINITIONS ::=
BEGIN

IMPORTS
  OPERATION, ERROR
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)};

provideRoutingInformation OPERATION ::= {
  ARGUMENT  RequestArgument
  RESULT    RoutingInformation
  ERRORS
    {invalidCalledNumber | subscriberNotReachable | calledBarred |
      processingFailure}
  LINKED    {getCallingPartyAddress}
}

--  timer T-pi = 10 s
getCallingPartyAddress OPERATION ::= {
  RESULT  CallingPartyAddress
  ERRORS  {callingPartyAddressNotAvailable | processingFailure}
}

--  timer T-gp = 5 s
invalidCalledNumber ERROR ::= {CODE  local:1
}

subscriberNotReachable ERROR ::= {CODE  local:2
}

calledBarred ERROR ::= {CODE  local:3
}

callingPartyAddressNotAvailable ERROR ::= {CODE  local:4
}

processingFailure ERROR ::= {CODE  local:5
}

-- data types
RequestArgument ::= SEQUENCE {
  calledNumber  IsdnNumber,
  basicService  BasicServiceIndicator OPTIONAL
}

RoutingInformation ::= CHOICE {
  reroutingNumber    [0] IMPLICIT IsdnNumber,
  forwardedToNumber  [1] IMPLICIT IsdnNumber
}

BasicServiceIndicator ::= ENUMERATED {speech(0), unrestrictedDigital(1)}

CallingPartyAddress ::= IsdnNumber

IsdnNumber ::= SEQUENCE {
  typeOfAddress  TypeOfAddress,
  digits         TelephonyString
}

TypeOfAddress ::= ENUMERATED {national(0), international(1), private(2)}

TelephonyString ::=
  IA5String
    (FROM ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "*" |
           "#"))(SIZE (1..15))

END

-- Generated by Asnp, the ASN.1 pretty-printer of France Telecom R&D

'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> tcapExampleNoComment [
	^ 'TCAP-Examples {itu-t recommendation q 775 modules(2) examples(2) version1(1)}
DEFINITIONS ::=
BEGIN

IMPORTS
  OPERATION, ERROR
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)};

provideRoutingInformation OPERATION ::= {
  ARGUMENT  RequestArgument
  RESULT    RoutingInformation
  ERRORS
    {invalidCalledNumber | subscriberNotReachable | calledBarred |
      processingFailure}
  LINKED    {getCallingPartyAddress}
}

getCallingPartyAddress OPERATION ::= {
  RESULT  CallingPartyAddress
  ERRORS  {callingPartyAddressNotAvailable | processingFailure}
}

invalidCalledNumber ERROR ::= {CODE  local:1
}

subscriberNotReachable ERROR ::= {CODE  local:2
}

calledBarred ERROR ::= {CODE  local:3
}

callingPartyAddressNotAvailable ERROR ::= {CODE  local:4
}

processingFailure ERROR ::= {CODE  local:5
}

RequestArgument ::= SEQUENCE {
  calledNumber  IsdnNumber,
  basicService  BasicServiceIndicator OPTIONAL
}

RoutingInformation ::= CHOICE {
  reroutingNumber    [0] IMPLICIT IsdnNumber,
  forwardedToNumber  [1] IMPLICIT IsdnNumber
}

BasicServiceIndicator ::= ENUMERATED {speech(0), unrestrictedDigital(1)}

CallingPartyAddress ::= IsdnNumber

IsdnNumber ::= SEQUENCE {
  typeOfAddress  TypeOfAddress,
  digits         TelephonyString
}

TypeOfAddress ::= ENUMERATED {national(0), international(1), private(2)}

TelephonyString ::=
  IA5String
    (FROM ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "*" |
           "#"))(SIZE (1..15))

END'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> tcapMessages [
	^ '
-- Generated by Asnp, the pretty-printer of France Telecom R&D (http://asn1.elibel.tm.fr/asnp/)
-- Module TCAPMessages (Q.773:06/1997)
-- asn1ct:compile("TCAPMessages",[ber_bin]).
TCAPMessages {itu-t recommendation q 773 modules(2) messages(1) version3(3)}

DEFINITIONS IMPLICIT TAGS

::=

BEGIN

-- EXPORTS everything
-- Transaction Portion fields.
IMPORTS
  ROS{}, InvokeId
    FROM Remote-Operations-Generic-ROS-PDUs {joint-iso-itu-t
      remote-operations(4) generic-ROS-PDUs(6) version1(0)}
  OPERATION
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)}
  Supported-MAP-Operations
    FROM MAP-Protocol {itu-t identified-organization (4) etsi (0) mobileDomain (0)
         gsm-Network (1) modules (3) map-Protocol (4) version12 (12)}
-- Start - Added by Eranga
  dialogue-as-id
    FROM DialoguePDUs {itu-t recommendation q 773 modules(2) dialoguePDUs(2)
      version1(1)}
  sendRoutingInfoForSM,
  mo-ForwardSM,
  mt-ForwardSM,
  reportSM-DeliveryStatus,
  alertServiceCentre,
  informServiceCentre,
  readyForSM
        FROM MAP-ShortMessageServiceOperations {
           itu-t identified-organization (4) etsi (0) mobileDomain (0)
           gsm-Network (1) modules (3) map-ShortMessageServiceOperations (12)
           version12 (12)}
  gsm-MessagingId
        FROM MobileDomainDefinitions {
           itu-t identified-organization (4) etsi (0) mobileDomain (0)
           mobileDomainDefinitions (0) version1 (1)}
  Supported-MAP-Operations
        FROM MAP-Protocol {
           itu-t identified-organization (4) etsi (0) mobileDomain (0)
           gsm-Network (1) modules (3) map-Protocol (4) version12 (12)}
-- End - Added by Eranga
;

-- Start - Added by Eranga

mapSpecificAS ABSTRACT-SYNTAX ::= {
  MapSpecificPDUs
  IDENTIFIED BY  gsm-MessagingId
}

MapSpecificPDUs ::=
  TCMessage{{Supported-MAP-Operations}, {Supported-MAP-Operations}}


MAPOperations-Invokable OPERATION ::= 
        {sendRoutingInfoForSM | mo-ForwardSM | mt-ForwardSM} 
MAPOperations-Returnable OPERATION ::= 
        {reportSM-DeliveryStatus | alertServiceCentre | informServiceCentre | readyForSM} 

-- End - Added by Eranga


TCMessage{OPERATION:Invokable, OPERATION:Returnable} ::= CHOICE {
  unidirectional  [APPLICATION 1]  Unidirectional{{Invokable}, {Returnable}},
  begin           [APPLICATION 2]  Begin{{Invokable}, {Returnable}},
  end             [APPLICATION 4]  End{{Invokable}, {Returnable}},
  continue        [APPLICATION 5]  Continue{{Invokable}, {Returnable}},
  abort           [APPLICATION 7]  Abort
}

Unidirectional{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}}
}

Begin{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  otid             OrigTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}

End{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  dtid             DestTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}

Continue{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  otid             OrigTransactionID,
  dtid             DestTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}

Abort ::= SEQUENCE {
  dtid    DestTransactionID,
  reason  CHOICE {p-abortCause  P-AbortCause,
                  u-abortCause  DialoguePortion} OPTIONAL
}

-- NOTE - When the Abort Message is generated by the Transaction sublayer, a p-Abort Cause may be 
-- present. The u-abortCause may be generated by the component sublayer in which case it is an ABRT 
-- APDU, or by the TC-User in which case it could be either an ABRT APDU or data in some user-defined
-- abstract syntax.
DialoguePortion ::= [APPLICATION 11] EXPLICIT EXTERNAL

-- The dialogue portion carries the dialogue control PDUs as value of the external data type. The direct 
-- reference should be set to {itu-t recommendation q 773 as(1) dialogue-as(1) version1(1)} if structured 
-- dialogue is used and to {itu-t recommendation q 773 as(1) unidialogue-as(2) version1(1)} if unstructured 
-- dialogue is used.
OrigTransactionID ::= [APPLICATION 8]  OCTET STRING(SIZE (1..4))

DestTransactionID ::= [APPLICATION 9]  OCTET STRING(SIZE (1..4))

P-AbortCause ::= [APPLICATION 10]  INTEGER {
  unrecognizedMessageType(0), unrecognizedTransactionID(1),
  badlyFormattedTransactionPortion(2), incorrectTransactionPortion(3),
  resourceLimitation(4)}(0..127)

-- COMPONENT PORTION. The last field in the transaction portion of the TCAP message is the 
-- component portion. The component portion may be absent.
ComponentPortion{OPERATION:Invokable, OPERATION:Returnable} ::=
  [APPLICATION 12] 
    SEQUENCE SIZE (1..MAX) OF Component{{Invokable}, {Returnable}}

-- Component Portion fields
-- Recommendation X.880 defines four Application Protocol Data Units (APDUs) for invoking
-- operations, returning results or error, and for the rejection of invalid PDUs.
-- TCAP adds returnResultNotLast to allow for the segmentation of a result.
Component{OPERATION:Invokable, OPERATION:Returnable} ::= CHOICE {
  basicROS             ROS{{TCInvokeIdSet}, {Invokable}, {Returnable}},
  returnResultNotLast
    [7]  returnResult < ROS{{TCInvokeIdSet}, {Invokable}, {Returnable}}
}

TCInvokeIdSet ::= InvokeId(WITH COMPONENTS {
                             present  (-128..127)
                           })

END -- TCAPMessages

-- Generated by Asnp, the ASN.1 pretty-printer of France Telecom R&D
'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> tcapMessagesNoComments [
	^ 'TCAPMessages {itu-t recommendation q 773 modules(2) messages(1) version3(3)}

DEFINITIONS IMPLICIT TAGS

::=

BEGIN

IMPORTS
  ROS{}, InvokeId
    FROM Remote-Operations-Generic-ROS-PDUs {joint-iso-itu-t
      remote-operations(4) generic-ROS-PDUs(6) version1(0)}
  OPERATION
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)}
  Supported-MAP-Operations
    FROM MAP-Protocol {itu-t identified-organization (4) etsi (0) mobileDomain (0)
         gsm-Network (1) modules (3) map-Protocol (4) version12 (12)}

  dialogue-as-id
    FROM DialoguePDUs {itu-t recommendation q 773 modules(2) dialoguePDUs(2)
      version1(1)}
  sendRoutingInfoForSM,
  mo-ForwardSM,
  mt-ForwardSM,
  reportSM-DeliveryStatus,
  alertServiceCentre,
  informServiceCentre,
  readyForSM
        FROM MAP-ShortMessageServiceOperations {
           itu-t identified-organization (4) etsi (0) mobileDomain (0)
           gsm-Network (1) modules (3) map-ShortMessageServiceOperations (12)
           version12 (12)}
  gsm-MessagingId
        FROM MobileDomainDefinitions {
           itu-t identified-organization (4) etsi (0) mobileDomain (0)
           mobileDomainDefinitions (0) version1 (1)}
  Supported-MAP-Operations
        FROM MAP-Protocol {
           itu-t identified-organization (4) etsi (0) mobileDomain (0)
           gsm-Network (1) modules (3) map-Protocol (4) version12 (12)}

;


mapSpecificAS ABSTRACT-SYNTAX ::= {
  MapSpecificPDUs
  IDENTIFIED BY  gsm-MessagingId
}

MapSpecificPDUs ::=
  TCMessage{{Supported-MAP-Operations}, {Supported-MAP-Operations}}


MAPOperations-Invokable OPERATION ::= 
        {sendRoutingInfoForSM | mo-ForwardSM | mt-ForwardSM} 
MAPOperations-Returnable OPERATION ::= 
        {reportSM-DeliveryStatus | alertServiceCentre | informServiceCentre | readyForSM} 



TCMessage{OPERATION:Invokable, OPERATION:Returnable} ::= CHOICE {
  unidirectional  [APPLICATION 1]  Unidirectional{{Invokable}, {Returnable}},
  begin           [APPLICATION 2]  Begin{{Invokable}, {Returnable}},
  end             [APPLICATION 4]  End{{Invokable}, {Returnable}},
  continue        [APPLICATION 5]  Continue{{Invokable}, {Returnable}},
  abort           [APPLICATION 7]  Abort
}

Unidirectional{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}}
}

Begin{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  otid             OrigTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}

End{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  dtid             DestTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}

Continue{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  otid             OrigTransactionID,
  dtid             DestTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}

Abort ::= SEQUENCE {
  dtid    DestTransactionID,
  reason  CHOICE {p-abortCause  P-AbortCause,
                  u-abortCause  DialoguePortion} OPTIONAL
}

DialoguePortion ::= [APPLICATION 11] EXPLICIT EXTERNAL

OrigTransactionID ::= [APPLICATION 8]  OCTET STRING(SIZE (1..4))

DestTransactionID ::= [APPLICATION 9]  OCTET STRING(SIZE (1..4))

P-AbortCause ::= [APPLICATION 10]  INTEGER {
  unrecognizedMessageType(0), unrecognizedTransactionID(1),
  badlyFormattedTransactionPortion(2), incorrectTransactionPortion(3),
  resourceLimitation(4)}(0..127)

ComponentPortion{OPERATION:Invokable, OPERATION:Returnable} ::=
  [APPLICATION 12] 
    SEQUENCE SIZE (1..MAX) OF Component{{Invokable}, {Returnable}}

Component{OPERATION:Invokable, OPERATION:Returnable} ::= CHOICE {
  basicROS             ROS{{TCInvokeIdSet}, {Invokable}, {Returnable}},
  returnResultNotLast
    [7]  returnResult < ROS{{TCInvokeIdSet}, {Invokable}, {Returnable}}
}

TCInvokeIdSet ::= InvokeId(WITH COMPONENTS {
                             present  (-128..127)
                           })

END'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> tcapTools [
	^ '-- Generated by Asnp, the pretty-printer of France Telecom R&D (http://asn1.elibel.tm.fr/asnp/)
TCAP-Tools {itu-t recommendation q 775 modules(2) tools(1) version1(1)}
DEFINITIONS ::=
BEGIN

EXPORTS 
        cancel, 
        cancelFailed, 
        cancelled
;

IMPORTS
  OPERATION, ERROR
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)}

  TCInvokeIdSet
    FROM TCAPMessages {itu-t recommendation q 773 modules(2) messages(1)
      version3(3)}
;

cancel OPERATION ::= {
  ARGUMENT  present < TCInvokeIdSet
  -- a TC-user may redefine this type to include
  -- an empty result so that it becomes a Class 1 operation
  ERRORS    {cancelFailed}
}

-- timer = 15 s
cancelFailed ERROR ::= {
  PARAMETER
    SET {problem   [0]  CancelProblem,
         invokeId  [1]  present < TCInvokeIdSet}
}

CancelProblem ::= ENUMERATED {
  unknownInvocation(0), tooLate(1), notCancellable(2)}

-- a TC-user may redefine this type to include application-specific problems
cancelled ERROR ::=
  {}

-- an error of this type should be included in the error list of cancellable operations
END

-- Generated by Asnp, the ASN.1 pretty-printer of France Telecom R&D
'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> tcapToolsNoComment [
	^ 'TCAP-Tools {itu-t recommendation q 775 modules(2) tools(1) version1(1)}
DEFINITIONS ::=
BEGIN

EXPORTS 
        cancel, 
        cancelFailed, 
        cancelled
;

IMPORTS
  OPERATION, ERROR
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)}

  TCInvokeIdSet
    FROM TCAPMessages {itu-t recommendation q 773 modules(2) messages(1)
      version3(3)}
;

cancel OPERATION ::= {
  ARGUMENT  present < TCInvokeIdSet
  ERRORS    {cancelFailed}
}

cancelFailed ERROR ::= {
  PARAMETER
    SET {problem   [0]  CancelProblem,
         invokeId  [1]  present < TCInvokeIdSet}
}

CancelProblem ::= ENUMERATED {
  unknownInvocation(0), tooLate(1), notCancellable(2)}

cancelled ERROR ::=
  {}

END
'
]

{ #category : #'as yet unclassified' }
ASN1SyntaxExamplesTest class >> x509 [
	^ 'PKIX1Explicit88 { iso(1) identified-organization(3) dod(6) internet(1)
  security(5) mechanisms(5) pkix(7) id-mod(0) id-pkix1-explicit(18) }

DEFINITIONS EXPLICIT TAGS ::=

BEGIN

-- EXPORTS ALL --

-- IMPORTS NONE --

-- UNIVERSAL Types defined in 1993 and 1998 ASN.1
-- and required by this specification

-- disabling predefined types
--UniversalString ::= [UNIVERSAL 28] IMPLICIT OCTET STRING
        -- UniversalString is defined in ASN.1:1993

--BMPString ::= [UNIVERSAL 30] IMPLICIT OCTET STRING
      -- BMPString is the subtype of UniversalString and models
      -- the Basic Multilingual Plane of ISO/IEC 10646

--UTF8String ::= [UNIVERSAL 12] IMPLICIT OCTET STRING
      -- The content of this type conforms to RFC 3629.
-- end of disabled block

-- PKIX specific OIDs

id-pkix  OBJECT IDENTIFIER  ::=
         { iso(1) identified-organization(3) dod(6) internet(1)
                    security(5) mechanisms(5) pkix(7) }

-- PKIX arcs

id-pe OBJECT IDENTIFIER ::= { id-pkix 1 }
        -- arc for private certificate extensions
id-qt OBJECT IDENTIFIER ::= { id-pkix 2 }
        -- arc for policy qualifier types
id-kp OBJECT IDENTIFIER ::= { id-pkix 3 }
        -- arc for extended key purpose OIDS
id-ad OBJECT IDENTIFIER ::= { id-pkix 48 }
        -- arc for access descriptors

-- policyQualifierIds for Internet policy qualifiers

id-qt-cps      OBJECT IDENTIFIER ::=  { id-qt 1 }
      -- OID for CPS qualifier
id-qt-unotice  OBJECT IDENTIFIER ::=  { id-qt 2 }
      -- OID for user notice qualifier

-- access descriptor definitions

id-ad-ocsp         OBJECT IDENTIFIER ::= { id-ad 1 }
id-ad-caIssuers    OBJECT IDENTIFIER ::= { id-ad 2 }
id-ad-timeStamping OBJECT IDENTIFIER ::= { id-ad 3 }
id-ad-caRepository OBJECT IDENTIFIER ::= { id-ad 5 }

-- attribute data types

Attribute               ::= SEQUENCE {
      type             AttributeType,
      values    SET OF AttributeValue }
            -- at least one value is required

AttributeType           ::= OBJECT IDENTIFIER

AttributeValue          ::= ANY -- DEFINED BY AttributeType

AttributeTypeAndValue   ::= SEQUENCE {
        type    AttributeType,
        value   AttributeValue }

-- suggested naming attributes: Definition of the following
--   information object set may be augmented to meet local
--   requirements.  Note that deleting members of the set may
--   prevent interoperability with conforming implementations.
-- presented in pairs: the AttributeType followed by the
--   type definition for the corresponding AttributeValue

-- Arc for standard naming attributes

id-at OBJECT IDENTIFIER ::= { joint-iso-ccitt(2) ds(5) 4 }

-- Naming attributes of type X520name

id-at-name                AttributeType ::= { id-at 41 }
id-at-surname             AttributeType ::= { id-at  4 }
id-at-givenName           AttributeType ::= { id-at 42 }
id-at-initials            AttributeType ::= { id-at 43 }
id-at-generationQualifier AttributeType ::= { id-at 44 }

-- Naming attributes of type X520Name:
--   X520name ::= DirectoryString (SIZE (1..ub-name))
--
-- Expanded to avoid parameterized type:
X520name ::= CHOICE {
      teletexString     TeletexString   (SIZE (1..ub-name)),
      printableString   PrintableString (SIZE (1..ub-name)),
      universalString   UniversalString (SIZE (1..ub-name)),
      utf8String        UTF8String      (SIZE (1..ub-name)),
      bmpString         BMPString       (SIZE (1..ub-name)) }

-- Naming attributes of type X520CommonName

id-at-commonName        AttributeType ::= { id-at 3 }

-- Naming attributes of type X520CommonName:
--   X520CommonName ::= DirectoryName (SIZE (1..ub-common-name))
--
-- Expanded to avoid parameterized type:
X520CommonName ::= CHOICE {
      teletexString     TeletexString   (SIZE (1..ub-common-name)),
      printableString   PrintableString (SIZE (1..ub-common-name)),
      universalString   UniversalString (SIZE (1..ub-common-name)),
      utf8String        UTF8String      (SIZE (1..ub-common-name)),
      bmpString         BMPString       (SIZE (1..ub-common-name)) }
-- Naming attributes of type X520LocalityName

id-at-localityName      AttributeType ::= { id-at 7 }

-- Naming attributes of type X520LocalityName:
--   X520LocalityName ::= DirectoryName (SIZE (1..ub-locality-name))
--
-- Expanded to avoid parameterized type:
X520LocalityName ::= CHOICE {
      teletexString     TeletexString   (SIZE (1..ub-locality-name)),
      printableString   PrintableString (SIZE (1..ub-locality-name)),
      universalString   UniversalString (SIZE (1..ub-locality-name)),
      utf8String        UTF8String      (SIZE (1..ub-locality-name)),
      bmpString         BMPString       (SIZE (1..ub-locality-name)) }

-- Naming attributes of type X520StateOrProvinceName

id-at-stateOrProvinceName AttributeType ::= { id-at 8 }

-- Naming attributes of type X520StateOrProvinceName:
--   X520StateOrProvinceName ::= DirectoryName (SIZE (1..ub-state-name))
--
-- Expanded to avoid parameterized type:
X520StateOrProvinceName ::= CHOICE {
      teletexString     TeletexString   (SIZE (1..ub-state-name)),
      printableString   PrintableString (SIZE (1..ub-state-name)),
      universalString   UniversalString (SIZE (1..ub-state-name)),
      utf8String        UTF8String      (SIZE (1..ub-state-name)),
      bmpString         BMPString       (SIZE (1..ub-state-name)) }

-- Naming attributes of type X520OrganizationName

id-at-organizationName  AttributeType ::= { id-at 10 }

-- Naming attributes of type X520OrganizationName:
--   X520OrganizationName ::=
--          DirectoryName (SIZE (1..ub-organization-name))
--
-- Expanded to avoid parameterized type:
X520OrganizationName ::= CHOICE {
      teletexString     TeletexString
                          (SIZE (1..ub-organization-name)),
      printableString   PrintableString
                          (SIZE (1..ub-organization-name)),
      universalString   UniversalString
                          (SIZE (1..ub-organization-name)),
      utf8String        UTF8String
                          (SIZE (1..ub-organization-name)),
      bmpString         BMPString
                          (SIZE (1..ub-organization-name))  }

-- Naming attributes of type X520OrganizationalUnitName

id-at-organizationalUnitName AttributeType ::= { id-at 11 }

-- Naming attributes of type X520OrganizationalUnitName:
--   X520OrganizationalUnitName ::=
--          DirectoryName (SIZE (1..ub-organizational-unit-name))
--
-- Expanded to avoid parameterized type:
X520OrganizationalUnitName ::= CHOICE {
      teletexString     TeletexString
                          (SIZE (1..ub-organizational-unit-name)),
      printableString   PrintableString
                          (SIZE (1..ub-organizational-unit-name)),
      universalString   UniversalString
                          (SIZE (1..ub-organizational-unit-name)),
      utf8String        UTF8String
                          (SIZE (1..ub-organizational-unit-name)),
      bmpString         BMPString
                          (SIZE (1..ub-organizational-unit-name)) }


-- Naming attributes of type X520Title

id-at-title             AttributeType ::= { id-at 12 }

-- Naming attributes of type X520Title:
--   X520Title ::= DirectoryName (SIZE (1..ub-title))
--
-- Expanded to avoid parameterized type:
X520Title ::= CHOICE {
      teletexString     TeletexString   (SIZE (1..ub-title)),
      printableString   PrintableString (SIZE (1..ub-title)),
      universalString   UniversalString (SIZE (1..ub-title)),
      utf8String        UTF8String      (SIZE (1..ub-title)),
      bmpString         BMPString       (SIZE (1..ub-title)) }

-- Naming attributes of type X520dnQualifier

id-at-dnQualifier       AttributeType ::= { id-at 46 }

X520dnQualifier ::=     PrintableString

-- Naming attributes of type X520countryName (digraph from IS 3166)

id-at-countryName       AttributeType ::= { id-at 6 }

X520countryName ::=     PrintableString (SIZE (2))

-- Naming attributes of type X520SerialNumber

id-at-serialNumber      AttributeType ::= { id-at 5 }

X520SerialNumber ::=    PrintableString (SIZE (1..ub-serial-number))

-- Naming attributes of type X520Pseudonym

id-at-pseudonym         AttributeType ::= { id-at 65 }

-- Naming attributes of type X520Pseudonym:
--   X520Pseudonym ::= DirectoryName (SIZE (1..ub-pseudonym))
--
-- Expanded to avoid parameterized type:
X520Pseudonym ::= CHOICE {
   teletexString     TeletexString   (SIZE (1..ub-pseudonym)),
   printableString   PrintableString (SIZE (1..ub-pseudonym)),
   universalString   UniversalString (SIZE (1..ub-pseudonym)),
   utf8String        UTF8String      (SIZE (1..ub-pseudonym)),
   bmpString         BMPString       (SIZE (1..ub-pseudonym)) }

-- Naming attributes of type DomainComponent (from RFC 4519)

id-domainComponent   AttributeType ::= { 0 9 2342 19200300 100 1 25 }

DomainComponent ::=  IA5String

-- Legacy attributes

pkcs-9 OBJECT IDENTIFIER ::=
       { iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) 9 }

id-emailAddress      AttributeType ::= { pkcs-9 1 }

EmailAddress ::=     IA5String (SIZE (1..ub-emailaddress-length))

-- naming data types --

Name ::= CHOICE { -- only one possibility for now --
      rdnSequence  RDNSequence }

RDNSequence ::= SEQUENCE OF RelativeDistinguishedName

DistinguishedName ::=   RDNSequence

RelativeDistinguishedName ::= SET SIZE (1..MAX) OF AttributeTypeAndValue

-- Directory string type --

DirectoryString ::= CHOICE {
      teletexString       TeletexString   (SIZE (1..MAX)),
      printableString     PrintableString (SIZE (1..MAX)),
      universalString     UniversalString (SIZE (1..MAX)),
      utf8String          UTF8String      (SIZE (1..MAX)),
      bmpString           BMPString       (SIZE (1..MAX)) }

-- certificate and CRL specific structures begin here

Certificate  ::=  SEQUENCE  {
     tbsCertificate       TBSCertificate,
     signatureAlgorithm   AlgorithmIdentifier,
     signature            BIT STRING  }

TBSCertificate  ::=  SEQUENCE  {
     version         [0]  Version DEFAULT v1,
     serialNumber         CertificateSerialNumber,
     signature            AlgorithmIdentifier,
     issuer               Name,
     validity             Validity,
     subject              Name,
     subjectPublicKeyInfo SubjectPublicKeyInfo,
     issuerUniqueID  [1]  IMPLICIT UniqueIdentifier OPTIONAL,
                          -- If present, version MUST be v2 or v3
     subjectUniqueID [2]  IMPLICIT UniqueIdentifier OPTIONAL,
                          -- If present, version MUST be v2 or v3
     extensions      [3]  Extensions OPTIONAL
                          -- If present, version MUST be v3 --  }

Version  ::=  INTEGER  {  v1(0), v2(1), v3(2)  }

CertificateSerialNumber  ::=  INTEGER

Validity ::= SEQUENCE {
     notBefore      Time,
     notAfter       Time  }

Time ::= CHOICE {
     utcTime        UTCTime,
     generalTime    GeneralizedTime }

UniqueIdentifier  ::=  BIT STRING

SubjectPublicKeyInfo  ::=  SEQUENCE  {
     algorithm            AlgorithmIdentifier,
     subjectPublicKey     BIT STRING  }

Extensions  ::=  SEQUENCE SIZE (1..MAX) OF Extension

Extension  ::=  SEQUENCE  {
     extnID      OBJECT IDENTIFIER,
     critical    BOOLEAN DEFAULT FALSE,
     extnValue   OCTET STRING
                 -- contains the DER encoding of an ASN.1 value
                 -- corresponding to the extension type identified
                 -- by extnID
     }

-- CRL structures

CertificateList  ::=  SEQUENCE  {
     tbsCertList          TBSCertList,
     signatureAlgorithm   AlgorithmIdentifier,
     signature            BIT STRING  }

TBSCertList  ::=  SEQUENCE  {
     version                 Version OPTIONAL,
                                   -- if present, MUST be v2
     signature               AlgorithmIdentifier,
     issuer                  Name,
     thisUpdate              Time,
     nextUpdate              Time OPTIONAL,
     revokedCertificates     SEQUENCE OF SEQUENCE  {
          userCertificate         CertificateSerialNumber,
          revocationDate          Time,
          crlEntryExtensions      Extensions OPTIONAL
                                   -- if present, version MUST be v2
                               }  OPTIONAL,
     crlExtensions           [0] Extensions OPTIONAL }
                                   -- if present, version MUST be v2

-- Version, Time, CertificateSerialNumber, and Extensions were
-- defined earlier for use in the certificate structure

AlgorithmIdentifier  ::=  SEQUENCE  {
     algorithm               OBJECT IDENTIFIER,
     parameters              ANY DEFINED BY algorithm OPTIONAL  }
                                -- contains a value of the type
                                -- registered for use with the
                                -- algorithm object identifier value

-- X.400 address syntax starts here

ORAddress ::= SEQUENCE {
   built-in-standard-attributes BuiltInStandardAttributes,
   built-in-domain-defined-attributes
                   BuiltInDomainDefinedAttributes OPTIONAL,
   -- see also teletex-domain-defined-attributes
   extension-attributes ExtensionAttributes OPTIONAL }

-- Built-in Standard Attributes

BuiltInStandardAttributes ::= SEQUENCE {
   country-name                  CountryName OPTIONAL,
   administration-domain-name    AdministrationDomainName OPTIONAL,
   network-address           [0] IMPLICIT NetworkAddress OPTIONAL,
     -- see also extended-network-address
   terminal-identifier       [1] IMPLICIT TerminalIdentifier OPTIONAL,
   private-domain-name       [2] PrivateDomainName OPTIONAL,
   organization-name         [3] IMPLICIT OrganizationName OPTIONAL,
     -- see also teletex-organization-name
   numeric-user-identifier   [4] IMPLICIT NumericUserIdentifier
                                 OPTIONAL,
   personal-name             [5] IMPLICIT PersonalName OPTIONAL,
     -- see also teletex-personal-name
   organizational-unit-names [6] IMPLICIT OrganizationalUnitNames
                                 OPTIONAL }
     -- see also teletex-organizational-unit-names

CountryName ::= [APPLICATION 1] CHOICE {
   x121-dcc-code         NumericString
                           (SIZE (ub-country-name-numeric-length)),
   iso-3166-alpha2-code  PrintableString
                           (SIZE (ub-country-name-alpha-length)) }

AdministrationDomainName ::= [APPLICATION 2] CHOICE {
   numeric   NumericString   (SIZE (0..ub-domain-name-length)),
   printable PrintableString (SIZE (0..ub-domain-name-length)) }

NetworkAddress ::= X121Address  -- see also extended-network-address

X121Address ::= NumericString (SIZE (1..ub-x121-address-length))

TerminalIdentifier ::= PrintableString (SIZE (1..ub-terminal-id-length))

PrivateDomainName ::= CHOICE {
   numeric   NumericString   (SIZE (1..ub-domain-name-length)),
   printable PrintableString (SIZE (1..ub-domain-name-length)) }

OrganizationName ::= PrintableString
                            (SIZE (1..ub-organization-name-length))
  -- see also teletex-organization-name

NumericUserIdentifier ::= NumericString
                            (SIZE (1..ub-numeric-user-id-length))


PersonalName ::= SET {
   surname     [0] IMPLICIT PrintableString
                    (SIZE (1..ub-surname-length)),
   given-name  [1] IMPLICIT PrintableString
                    (SIZE (1..ub-given-name-length)) OPTIONAL,
   initials    [2] IMPLICIT PrintableString
                    (SIZE (1..ub-initials-length)) OPTIONAL,
   generation-qualifier [3] IMPLICIT PrintableString
                    (SIZE (1..ub-generation-qualifier-length))
                    OPTIONAL }
  -- see also teletex-personal-name

OrganizationalUnitNames ::= SEQUENCE SIZE (1..ub-organizational-units)
                             OF OrganizationalUnitName
  -- see also teletex-organizational-unit-names

OrganizationalUnitName ::= PrintableString (SIZE
                    (1..ub-organizational-unit-name-length))

-- Built-in Domain-defined Attributes

BuiltInDomainDefinedAttributes ::= SEQUENCE SIZE
                    (1..ub-domain-defined-attributes) OF
                    BuiltInDomainDefinedAttribute

BuiltInDomainDefinedAttribute ::= SEQUENCE {
   type PrintableString (SIZE
                   (1..ub-domain-defined-attribute-type-length)),
   value PrintableString (SIZE
                   (1..ub-domain-defined-attribute-value-length)) }

-- Extension Attributes

ExtensionAttributes ::= SET SIZE (1..ub-extension-attributes) OF
               ExtensionAttribute

ExtensionAttribute ::=  SEQUENCE {
   extension-attribute-type [0] IMPLICIT INTEGER
                   (0..ub-extension-attributes),
   extension-attribute-value [1]
                   ANY DEFINED BY extension-attribute-type }

-- Extension types and attribute values

common-name INTEGER ::= 1

CommonName ::= PrintableString (SIZE (1..ub-common-name-length))

teletex-common-name INTEGER ::= 2

TeletexCommonName ::= TeletexString (SIZE (1..ub-common-name-length))

teletex-organization-name INTEGER ::= 3

TeletexOrganizationName ::=
                TeletexString (SIZE (1..ub-organization-name-length))

teletex-personal-name INTEGER ::= 4

TeletexPersonalName ::= SET {
   surname     [0] IMPLICIT TeletexString
                    (SIZE (1..ub-surname-length)),
   given-name  [1] IMPLICIT TeletexString
                    (SIZE (1..ub-given-name-length)) OPTIONAL,
   initials    [2] IMPLICIT TeletexString
                    (SIZE (1..ub-initials-length)) OPTIONAL,
   generation-qualifier [3] IMPLICIT TeletexString
                    (SIZE (1..ub-generation-qualifier-length))
                    OPTIONAL }

teletex-organizational-unit-names INTEGER ::= 5

TeletexOrganizationalUnitNames ::= SEQUENCE SIZE
      (1..ub-organizational-units) OF TeletexOrganizationalUnitName

TeletexOrganizationalUnitName ::= TeletexString
                  (SIZE (1..ub-organizational-unit-name-length))

pds-name INTEGER ::= 7

PDSName ::= PrintableString (SIZE (1..ub-pds-name-length))

physical-delivery-country-name INTEGER ::= 8

PhysicalDeliveryCountryName ::= CHOICE {
   x121-dcc-code NumericString (SIZE (ub-country-name-numeric-length)),
   iso-3166-alpha2-code PrintableString
                               (SIZE (ub-country-name-alpha-length)) }

postal-code INTEGER ::= 9

PostalCode ::= CHOICE {
   numeric-code   NumericString (SIZE (1..ub-postal-code-length)),
   printable-code PrintableString (SIZE (1..ub-postal-code-length)) }

physical-delivery-office-name INTEGER ::= 10

PhysicalDeliveryOfficeName ::= PDSParameter

physical-delivery-office-number INTEGER ::= 11

PhysicalDeliveryOfficeNumber ::= PDSParameter

extension-OR-address-components INTEGER ::= 12

ExtensionORAddressComponents ::= PDSParameter

physical-delivery-personal-name INTEGER ::= 13

PhysicalDeliveryPersonalName ::= PDSParameter

physical-delivery-organization-name INTEGER ::= 14

PhysicalDeliveryOrganizationName ::= PDSParameter

extension-physical-delivery-address-components INTEGER ::= 15

ExtensionPhysicalDeliveryAddressComponents ::= PDSParameter

unformatted-postal-address INTEGER ::= 16

UnformattedPostalAddress ::= SET {
   printable-address SEQUENCE SIZE (1..ub-pds-physical-address-lines)
        OF PrintableString (SIZE (1..ub-pds-parameter-length)) OPTIONAL,
   teletex-string TeletexString
        (SIZE (1..ub-unformatted-address-length)) OPTIONAL }

street-address INTEGER ::= 17

StreetAddress ::= PDSParameter

post-office-box-address INTEGER ::= 18

PostOfficeBoxAddress ::= PDSParameter

poste-restante-address INTEGER ::= 19

PosteRestanteAddress ::= PDSParameter

unique-postal-name INTEGER ::= 20

UniquePostalName ::= PDSParameter

local-postal-attributes INTEGER ::= 21

LocalPostalAttributes ::= PDSParameter

PDSParameter ::= SET {
   printable-string PrintableString
                (SIZE(1..ub-pds-parameter-length)) OPTIONAL,
   teletex-string TeletexString
                (SIZE(1..ub-pds-parameter-length)) OPTIONAL }

extended-network-address INTEGER ::= 22

ExtendedNetworkAddress ::= CHOICE {
   e163-4-address SEQUENCE {
      number      [0] IMPLICIT NumericString
                       (SIZE (1..ub-e163-4-number-length)),
      sub-address [1] IMPLICIT NumericString
                       (SIZE (1..ub-e163-4-sub-address-length))
                       OPTIONAL },
   psap-address   [0] IMPLICIT PresentationAddress }

PresentationAddress ::= SEQUENCE {
    pSelector     [0] EXPLICIT OCTET STRING OPTIONAL,
    sSelector     [1] EXPLICIT OCTET STRING OPTIONAL,
    tSelector     [2] EXPLICIT OCTET STRING OPTIONAL,
    nAddresses    [3] EXPLICIT SET SIZE (1..MAX) OF OCTET STRING }

terminal-type  INTEGER ::= 23

TerminalType ::= INTEGER {
   telex        (3),
   teletex      (4),
   g3-facsimile (5),
   g4-facsimile (6),
   ia5-terminal (7),
   videotex     (8) } (0..ub-integer-options)

-- Extension Domain-defined Attributes

teletex-domain-defined-attributes INTEGER ::= 6

TeletexDomainDefinedAttributes ::= SEQUENCE SIZE
   (1..ub-domain-defined-attributes) OF TeletexDomainDefinedAttribute

TeletexDomainDefinedAttribute ::= SEQUENCE {
        type TeletexString
               (SIZE (1..ub-domain-defined-attribute-type-length)),
        value TeletexString
               (SIZE (1..ub-domain-defined-attribute-value-length)) }


--  specifications of Upper Bounds MUST be regarded as mandatory
--  from Annex B of ITU-T X.411 Reference Definition of MTS Parameter
--  Upper Bounds

-- Upper Bounds
ub-name INTEGER ::= 32768
ub-common-name INTEGER ::= 64
ub-locality-name INTEGER ::= 128
ub-state-name INTEGER ::= 128
ub-organization-name INTEGER ::= 64
ub-organizational-unit-name INTEGER ::= 64
ub-title INTEGER ::= 64
ub-serial-number INTEGER ::= 64
ub-match INTEGER ::= 128
ub-emailaddress-length INTEGER ::= 255
ub-common-name-length INTEGER ::= 64
ub-country-name-alpha-length INTEGER ::= 2
ub-country-name-numeric-length INTEGER ::= 3
ub-domain-defined-attributes INTEGER ::= 4
ub-domain-defined-attribute-type-length INTEGER ::= 8
ub-domain-defined-attribute-value-length INTEGER ::= 128
ub-domain-name-length INTEGER ::= 16
ub-extension-attributes INTEGER ::= 256
ub-e163-4-number-length INTEGER ::= 15
ub-e163-4-sub-address-length INTEGER ::= 40
ub-generation-qualifier-length INTEGER ::= 3
ub-given-name-length INTEGER ::= 16
ub-initials-length INTEGER ::= 5
ub-integer-options INTEGER ::= 256
ub-numeric-user-id-length INTEGER ::= 32
ub-organization-name-length INTEGER ::= 64
ub-organizational-unit-name-length INTEGER ::= 32
ub-organizational-units INTEGER ::= 4
ub-pds-name-length INTEGER ::= 16
ub-pds-parameter-length INTEGER ::= 30
ub-pds-physical-address-lines INTEGER ::= 6
ub-postal-code-length INTEGER ::= 16
ub-pseudonym INTEGER ::= 128
ub-surname-length INTEGER ::= 40
ub-terminal-id-length INTEGER ::= 24
ub-unformatted-address-length INTEGER ::= 180
ub-x121-address-length INTEGER ::= 16

-- Note - upper bounds on string types, such as TeletexString, are
-- measured in characters.  Excepting PrintableString or IA5String, a
-- significantly greater number of octets will be required to hold
-- such a value.  As a minimum, 16 octets, or twice the specified
-- upper bound, whichever is the larger, should be allowed for
-- TeletexString.  For UTF8String or UniversalString at least four
-- times the upper bound should be allowed.

END

'
]

{ #category : #accessing }
ASN1SyntaxExamplesTest >> parserClass [
	^ ASN1Syntax 
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testEtsiExample [
	self parse: self class etsiExample rule: #moduleDefinition
	
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testEtsiTypeAssignmentInteger [
	self parse: 'FrameOffset          ::= INTEGER   (0 | 8..20)' rule: #typeAssignment
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testPersonell [
	self assert: (self parse: self class personnelNotation rule: #assignmentList) isPetitFailure not
	
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testPersonellNoComment [
	self parse: self class personnelNotationNoComment rule: #assignmentList
	
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testPkcs12 [
	self parse: self class pkcs12 rule: #moduleDefinition
	
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testRemoteOperationsNoComment [
	self parse: self class remoteOperationsExample rule: #moduleDefinition
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testRemoteOperationsUsefulNoComment [
	self parse: self class remoteOperationsUsefulExample rule: #moduleDefinition
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testTcapExample [
	self parse: self class tcapExample rule: #moduleDefinition
	
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testTcapExampleNoComment [
	self parse: self class tcapExampleNoComment rule: #moduleDefinition
	
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testTcapMessagesNoComment [
	self parse: self class tcapMessagesNoComments rule: #moduleDefinition
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testTcapToolsNoComment [
	self parse: self class tcapToolsNoComment rule: #moduleDefinition
]

{ #category : #tests }
ASN1SyntaxExamplesTest >> testX509 [
	self parse: self class x509 rule: #moduleDefinition
	
]
