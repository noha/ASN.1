as yet unclassified
utctime
	^ year, month, day, hour, minute,  second optional, ( $Z asParser / offset ) ==> [:nodes|
		DateAndTime 
			year: (nodes at: 1)
			month: (nodes at: 2)
			day: (nodes at: 3)
			hour: (nodes at: 4)
			minute: (nodes at: 5)
			second: ((nodes at: 6) ifNil: [ 0 ])
			nanoSecond: 0
			offset: (((nodes at: 7) = $Z) ifTrue: [ Duration minutes: 0 ] ifFalse: [ (nodes at: 7 )])
 ]