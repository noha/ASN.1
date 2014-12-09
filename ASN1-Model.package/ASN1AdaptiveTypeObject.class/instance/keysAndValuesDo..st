accessing
keysAndValuesDo: aBlock
	type keys do: [ :key |
		map at: key ifPresent: [:value| aBlock value: key value: value ] ]