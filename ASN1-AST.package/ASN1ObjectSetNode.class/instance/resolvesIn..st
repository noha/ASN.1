as yet unclassified
resolvesIn: aModule
	| elem |
	elem := aModule resolveName: elementsSpec entity label.
	^ elem basicTypeLabel = #object
