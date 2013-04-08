as yet unclassified
useTagEnvironment: aTagEnvironment for: aBinding during: aBlock
	| oldTagEnvironment |
	[
		oldTagEnvironment := aBinding definingModule tagEnvironment.
		aBinding definingModule tagEnvironment: aTagEnvironment .
		aBlock value ]
			ensure: [ aBinding tagEnvironment: oldTagEnvironment ]