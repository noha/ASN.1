visiting
push: taggedValue during: aBlock
	| formerTaggedValue result |
	taggedValue ifNil: [  Error signal: 'cannot use nil as taggedValue' ].
	formerTaggedValue := currentTaggedValue.
	currentTaggedValue := taggedValue.
	result := aBlock ifCurtailed: [ currentTaggedValue := formerTaggedValue ].
	currentTaggedValue := formerTaggedValue.
	^ result