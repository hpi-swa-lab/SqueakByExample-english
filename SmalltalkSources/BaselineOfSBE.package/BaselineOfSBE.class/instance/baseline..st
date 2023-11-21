baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'FileSystem' with: [spec
			repository: 'github://squeak-smalltalk/squeak-filesystem:master/src';
			loads: #('default' 'tests')].
		spec baseline: 'SBTreeSitter' with: [spec
			repository: 'github://hpi-swa-lab/sb-tree-sitter:master/packages';
			loads: 'Sandblocks-TreeSitter'].
		spec
			package: #'SBE-Book';
			package: #'SBE-Environment';
			package: #'SBE-Extract' with: [spec requires: #('FileSystem')];
			package: #'SBE-ExtractBook' with: [
				spec requires: #(#'SBE-Book' 'FileSystem' 'SBTreeSitter')];
			package: #'SBE-Monticello';
			package: #'SBE-Morphic';
			package: #'SBE-Quinto';
			package: #'SBE-QuickTour';
			package: #'SBE-Streams';
			package: #'SBE-Testing';
			package: #'SBE-Tests'.
		spec group: #ci with: #(
			#'SBE-Environment'
			#'SBE-Extract'
			#'SBE-Monticello'
			#'SBE-Morphic'
			#'SBE-Quinto'
			#'SBE-QuickTour'
			#'SBE-Streams'
			#'SBE-Testing'
			#'SBE-Tests')].