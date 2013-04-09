X.680 grammar
tString
	"Spec:
		A 'tstring' shall consist of one or more of the characters:
		0123456789+-:.,/CDHMRPSTWYZ
		preceded and followed by a QUOTATION MARK (34) character."
	^ $" asParser,
		 (#digit asParser / $+ asParser / $- asParser / $: asParser / $. asParser / $, asParser / $/ asParser /
		$C asParser / $D asParser / $H asParser / $M asParser / $R asParser / $P asParser /
		$S asParser / $T asParser / $W asParser / $Y asParser / $Z asParser ) flatten plus,
		$" asParser ==> #second