visiting
visitComponentTypeListNode: aComponentTypeList 
	aComponentTypeList components: (self visitAll: aComponentTypeList components).
	^ aComponentTypeList 