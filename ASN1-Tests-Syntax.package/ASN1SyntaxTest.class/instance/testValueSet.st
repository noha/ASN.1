tests
testValueSet
	self parse: '{updateLocation | cancelLocation | purgeMS | sendIdentification | updateGprsLocation | prepareHandover | sendEndSignal }' rule: #valueSet.
	self parse: '{updateLocation | cancelLocation | purgeMS | sendIdentification, ... }' rule: #valueSet.
	self parse: '{updateLocation | cancelLocation | purgeMS | sendIdentification, ..., updateGprsLocation | prepareHandover | sendEndSignal }' rule: #valueSet.

