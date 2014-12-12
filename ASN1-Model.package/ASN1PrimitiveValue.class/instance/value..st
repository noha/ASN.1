accessing
value: anObject
	((type class = ASN1NullType) not and: [ anObject isNil ]) ifTrue:  [ 
		Error signal: 'cannot use nil as value' ].
	value := anObject value