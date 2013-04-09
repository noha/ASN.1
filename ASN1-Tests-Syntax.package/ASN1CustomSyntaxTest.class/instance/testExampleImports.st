tests
testExampleImports
	self parse: '-- EXPORTS everything
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
;' rule: #imports