as yet unclassified
useTagEnvironment: aTagEnvironment for: aBinding during: aBlock
	| oldTagEnvironment |
	[
		oldTagEnvironment := aBinding module tagEnvironment.
		aBinding module tagEnvironment: aTagEnvironment .
		aBlock value ]
			ensure: [ aBinding tagEnvironment: oldTagEnvironment ]