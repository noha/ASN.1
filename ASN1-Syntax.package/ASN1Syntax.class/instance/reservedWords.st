X.680 grammar
reservedWords
	^ (PPChoiceParser new setParsers: (self class reservedWords collect: [:each| each asParser])) trim