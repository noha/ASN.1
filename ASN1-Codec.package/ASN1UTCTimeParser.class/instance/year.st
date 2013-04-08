as yet unclassified
year
	^  (#digit asParser, #digit asParser) flatten ==> [:node| | y |
		y := node asNumber.
		(y > 70) 
			ifTrue: [ 1900 + y]
			ifFalse:  [ 2000 + y ]]