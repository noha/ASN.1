versions
version0711: spec
	<version: '0.7.11' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.10 : moved byte value calculation from BER stream to the tag itself
0.7.11 : resurrect common package. My image deleted all methods of the package.
0.7.11 : refactored elements set into own class hierarchie. Now it should be possible to traverse the sets in a proper way
0.7.11 : made ASN1Set a standalone type and not subtype of collection. Checks for inclusion are not type bound anymore. includesType: has been renamed to includes: and the method moved up to ASN1BasicObject
0.7.11 : added utility function to ASN1Dictionary to copy keys and values'.
		spec author: 'NorbertHartl'.
		spec timestamp: '7/24/2013 16:10'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.5';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.59';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.7';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.52';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.8';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.18';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.1';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.37';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.4'. ].