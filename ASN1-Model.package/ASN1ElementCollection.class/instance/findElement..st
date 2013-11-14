finding
findElement: aBlock
	elements do: [ :each |
			(each findElement: aBlock) ifNotNil: [ :result| ^ result ]  ].
	 ^ nil
		