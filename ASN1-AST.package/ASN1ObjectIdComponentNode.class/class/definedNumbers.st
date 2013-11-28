accessing
definedNumbers
	self flag: #needsredesign.
	^ Dictionary new
		at: 'itu-t' put: 0;
		at: 'joint-iso-itu-t' put: 2;
		at: 'recommendation' put: 0;
		at: 'q' put: 17;
		at: '773' put: 773;
		at: '775' put: 775;
		at: '1228' put: 1228;
		yourself