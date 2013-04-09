tests
testComponentTypeLists
	self parse: 'name Name, foo Bar' rule: #componentTypeLists.
	self parse: 'name Name, foo Bar, ...' rule: #componentTypeLists.
	self parse: 'name Name, foo Bar, ..., bname Bname' rule: #componentTypeLists.
	self parse: 'name Name, foo Bar, ..., bname Bname, [[ first Second ]]' rule: #componentTypeLists.
	self parse: 'name Name, foo Bar, ..., bname Bname, [[ first Second ]], ...' rule: #componentTypeLists.
	self parse: '..., bname Bname, [[ first Second ]], ..., name Name, foo Bar' rule: #componentTypeLists.
	self parse: '..., bname Bname, [[ first Second ]], ...' rule: #componentTypeLists.
