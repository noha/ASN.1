resolving
defaultModule
	^ self modules 
		detect: [ :each | each moduleName = 'default' ]
		ifNone: [  ^ nil ]