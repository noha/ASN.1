tests
testRoundtripBitString
	self roundTrip: #BitString value: '0000000100000010'.
	self roundTrip: #BitString value: '1000000'.
	self roundTrip: #BitString value: '1'