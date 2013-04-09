X.680 grammar
cString
	"allow any character between double quotes. Double quotes are escaped by using a double double quote"
	^(($" asParser, 
		((($" asParser negate plus) /  ($" asParser, $" asParser)) star) flatten,
		$" asParser))  ==> #second