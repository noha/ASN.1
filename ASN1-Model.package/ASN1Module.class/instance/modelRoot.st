accessing
modelRoot
	^ modelRoot ifNil: [ NotFound signal: 'cannot find model root for ', self asString ]