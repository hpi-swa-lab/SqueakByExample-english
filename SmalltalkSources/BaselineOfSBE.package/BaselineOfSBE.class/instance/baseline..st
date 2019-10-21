baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'FileSystem' with: [spec
					repository: 'github://j4yk/Squeak-FileSystem:master/src';
					loads: #('default' 'tests')].
		
		spec
			package: #'SBE-Extract' with: [spec requires: #('FileSystem')];
			package: #'SBE-Quinto';
			package: #'SBE-Morphic'.
		spec
			group: #ci with: #(#'SBE-Extract' #'SBE-Quinto' #'SBE-Morphic')].
