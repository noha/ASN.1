versions
version0740: spec
	<version: '0.7.40' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.39 : encode empty octet string bytes to empty sring
0.7.40 : fixed a bug with encoding tags for nested choices in implicit tagging environment. Removed some old and obsolete stuff and made it work the right way via tagged type'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/4/2013 16:20'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.61';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.8';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.60';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.10';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.31';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.6';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.46';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-HolgerHansPeterFreyther.6'. ].
