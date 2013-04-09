accessing
addFields: aDictionary
	aDictionary associations do: [:field |
		self addField: field ]