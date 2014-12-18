tests
testRoundtripInteger
	self roundTrip: #Integer value: 0.
	self roundTrip: #Integer value: 1.
	self roundTrip: #Integer value: -1.
	self roundTrip: #Integer value: 127.
	self roundTrip: #Integer value: -128.
	self roundTrip: #Integer value: 155.
	self roundTrip: #Integer value: 32767.
	self roundTrip: #Integer value: 16r7fff.
	self roundTrip: #Integer value: -16r8000.
	self roundTrip: #Integer value: 16r7fffffff.
	self roundTrip: #Integer value: -16r80000000.
	self roundTrip: #Integer value: 1431655765.
	self roundTrip: #Integer value: 16909060.
	self roundTrip: #Integer value: 2151727136.
	self roundTrip: #Integer value: 127.
	self roundTrip: #Integer value: -16909060.
	

	
