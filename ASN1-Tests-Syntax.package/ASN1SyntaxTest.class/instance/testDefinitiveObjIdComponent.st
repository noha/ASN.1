tests
testDefinitiveObjIdComponent
	self parse: 'itu-t' rule: #definitiveObjIdComponent.
	self parse: '34' rule: #definitiveObjIdComponent.
	self parse: 'itu-t(34)' rule: #definitiveObjIdComponent.
