as yet unclassified
selectorNameFromFilename: aFilename
	"strip off 4 bytes of the .asn suffix"
	^ self selectorNameFrom: (aFilename copyFrom: 1 to: aFilename size - 4)