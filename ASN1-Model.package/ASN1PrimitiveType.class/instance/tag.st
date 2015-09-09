accessing
tag
	^ tag ifNil: [
		tag := self universalTag ]