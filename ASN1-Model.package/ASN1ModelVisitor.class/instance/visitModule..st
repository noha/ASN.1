visiting
visitModule: aModule
self halt.
	aModule fields do: [:each|
		self visit: each ].
	^ aModule