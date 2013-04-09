tests
testElementSetSpecs
	| setSpec |
	setSpec := 'updateLocation | cancelLocation | purgeMS'.
	self parse: setSpec rule: #elementSetSpecs.
	self parse: setSpec, ', ...' rule: #elementSetSpecs.
	self parse: setSpec, ', ..., ',setSpec rule: #elementSetSpecs.

