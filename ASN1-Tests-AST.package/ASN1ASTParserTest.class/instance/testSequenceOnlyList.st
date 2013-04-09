tests
testSequenceOnlyList
	| nodes |
	
	nodes := self parse: 'SEQUENCE {
	molr-Type			[0]	MOLR-Type,
	locationMethod		[1]	LocationMethod			OPTIONAL,
	lcs-QoS				[2]	LCS-QoS					OPTIONAL,
	lcsClientExternalID	[3] LCSClientExternalID		OPTIONAL,
	mlc-Number			[4]	ISDN-AddressString		OPTIONAL,
	gpsAssistanceData	[5]	GPSAssistanceData		OPTIONAL }' rule: #sequenceType.
	self assert: nodes size = 6