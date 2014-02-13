tests
testRoundtripInteger
	self rountTrip: #Integer value: 0.
	self rountTrip: #Integer value: 1.
	self rountTrip: #Integer value: -1.
	self rountTrip: #Integer value: 127.
	self rountTrip: #Integer value: -128.
	self rountTrip: #Integer value: 16r7fff.
	self rountTrip: #Integer value: -16r8000.
	self rountTrip: #Integer value: 16r7fffffff.
	self rountTrip: #Integer value: -16r80000000.



	
