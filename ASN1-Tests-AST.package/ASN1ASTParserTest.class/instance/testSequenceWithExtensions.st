tests
testSequenceWithExtensions
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
	self assert: nodes size = 22