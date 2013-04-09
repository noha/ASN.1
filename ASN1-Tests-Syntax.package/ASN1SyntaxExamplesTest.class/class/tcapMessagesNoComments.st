as yet unclassified
tcapMessagesNoComments
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