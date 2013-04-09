tests
testComponentTypeList
	self parse: 'name Name, foo Bar' rule: #componentTypeList.
	self parse: 'name Name ,foo Bar' rule: #componentTypeList.
	self parse: 'name Name   ,    foo Bar' rule: #componentTypeList.
	self parse: 'name Name,foo Bar,peng Zonk' rule: #componentTypeList.
	self fail: 'name Name, foo bar' rule: #componentTypeList.
