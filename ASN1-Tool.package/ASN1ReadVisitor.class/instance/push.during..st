visiting
push: taggedValue during: aBlock
	|  formerTaggedValue |
	taggedValue ifNil: [  Error signal: 'cannot push nil onto stack' ].
	formerTaggedValue := currentTaggedValue.
	currentTaggedValue := taggedValue.
	^ aBlock ensure: [ currentTaggedValue := formerTaggedValue ]