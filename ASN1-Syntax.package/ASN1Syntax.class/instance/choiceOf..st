accessing
choiceOf: aCollection
	^ aCollection allButFirst 
		inject: (self perform: aCollection first) 
		into: [: p : rule| p / (self perform: rule ) ]