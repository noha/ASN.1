visiting
visitComponentTypeListNode: aComponentTypeList 
	self visitAll: aComponentTypeList components.
	self visitNode: aComponentTypeList.
	^ aComponentTypeList 