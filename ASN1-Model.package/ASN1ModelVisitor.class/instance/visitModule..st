visiting
visitModule: aModule
	aModule fields do: [:each|
		self visit: each ].
	^ aModule