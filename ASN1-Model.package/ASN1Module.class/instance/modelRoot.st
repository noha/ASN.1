accessing
modelRoot
	^ self propertyAt: #modelRoot ifAbsent: [ NotFound signal: 'cannot find model root for ', self asString ]