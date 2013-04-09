accessing
keysAndValuesDo: aBlock
	^ (1 to: keys size) do: [:index|
		aBlock value: (keys at: index) value: (values at: index)]