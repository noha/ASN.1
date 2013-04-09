as yet unclassified
purgeMS
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
