versions
version0729: spec
	<version: '0.7.29' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.28 : exchanging impementation for reading long definite form of a BER tagged value again. Didn''t work the last time
0.7.29 : added missing tag assignment for typed sequences'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/8/2013 12:05'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.61';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.7';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.58';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.10';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.28';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.3';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.43';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.5'. ].
