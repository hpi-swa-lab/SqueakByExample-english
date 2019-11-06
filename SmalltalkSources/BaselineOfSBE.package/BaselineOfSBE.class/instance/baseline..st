baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'FileSystem' with: [spec
			repository: 'github://j4yk/Squeak-FileSystem:master/src';
			loads: #('default' 'tests')].
		spec
			package: #'SBE-Environment';
			package: #'SBE-Extract' with: [spec requires: #('FileSystem')];
			package: #'SBE-Monticello';
			package: #'SBE-Morphic';
			package: #'SBE-Quinto';
			package: #'SBE-QuickTour';
			package: #'SBE-Streams';
			package: #'SBE-Testing'.
		spec group: #ci with: #(
			#'SBE-Extract'
			#'SBE-Quinto'
			#'SBE-QuickTour'
			#'SBBE-Monticello'
			#'SBE-Morphic'
			#'SBE-Streams')].