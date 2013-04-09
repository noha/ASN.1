as yet unclassified
objectFromDefinedSyntax
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
