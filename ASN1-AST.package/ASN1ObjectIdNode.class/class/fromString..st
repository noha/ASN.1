as yet unclassified
fromString: aString
	^ self new
		components: (($. split: aString) 
			collect: [ :each| ASN1ObjectIdComponentNode number: each  ])