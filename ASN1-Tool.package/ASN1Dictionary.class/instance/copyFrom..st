copying
copyFrom: aASN1Dictionary 
	aASN1Dictionary keys do: [ :key |
		self at: key put: (aASN1Dictionary at: key) ].