as yet unclassified
atNumber: aNumber
	^ self namedElements
		detect: [:each| each number = aNumber ]
		ifNone: [ ASN1ElementNotFound signal: 'no entry for number ', aNumber asString, ' found' ]