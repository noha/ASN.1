tests
testObjectSetSpec
	self parse: 'a | b | c' rule: #objectSetSpec.
	self parse: 'a | b | c, ...' rule: #objectSetSpec.
	self parse: '...' rule: #objectSetSpec.
	self parse: '..., a | b | c' rule: #objectSetSpec.
	self parse: 'a | b | c, ..., d | e | f' rule: #objectSetSpec.
