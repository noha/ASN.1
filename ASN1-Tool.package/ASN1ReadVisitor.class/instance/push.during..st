visiting
push: taggedValue during: aBlock
	| result formerTaggedValue |
	taggedValue ifNil: [  Error signal: 'cannot push nil onto stack' ].
	formerTaggedValue := currentTaggedValue.
	currentTaggedValue := taggedValue.
	[ result := aBlock value ]
		ensure: [ currentTaggedValue := formerTaggedValue ]. 
	^ result