tests
testValueWithSpaceAppended
	|  pattern |
	pattern := self parse: 'dialogue-as-id OBJECT IDENTIFIER ::=
  {itu-t recommendation q 773 as(1) dialogue-as(1) version1(1)}
' rule: #assignmentList.
	self assert: (pattern first first) = 'dialogue-as-id'