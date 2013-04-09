visiting
useModule: aModule during: aBlock
	| previousModule |
	previousModule := module.
	module := aModule.
	[ ^ aBlock value ]
		ensure: [ module := previousModule ]
	