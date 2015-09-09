as yet unclassified
valueWithTag: aTag 
	^ collection 
		detect: [ :each| each tag = aTag ]
		ifNone: [  nil ]