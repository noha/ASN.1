accessing
modules
	^ modules ifNil: [
		modules := OrderedCollection new ] 