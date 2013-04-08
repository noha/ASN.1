as yet unclassified
day
	^ (#digit asParser, #digit asParser) flatten ==> [:node|
		node asNumber ]