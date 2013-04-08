as yet unclassified
offset
	^ ($+ asParser / $- asParser), hour, minute ==> [:nodes| | duration |
		duration := Duration minutes: (60 * (nodes at: 2) asNumber) + (nodes at: 3) asNumber.
		((nodes at: 1) = $-)
			ifTrue: [ duration negated ]
			ifFalse: [ duration ]]