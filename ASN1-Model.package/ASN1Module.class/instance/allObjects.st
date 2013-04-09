accessing
allObjects
	^ self fields select: [:each| each isAsn1Object ]