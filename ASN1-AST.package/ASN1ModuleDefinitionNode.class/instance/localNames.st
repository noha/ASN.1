accessing
localNames
	^ (self assignments 
		collect: [:each| 
			each left label -> each right]) asDictionary 
