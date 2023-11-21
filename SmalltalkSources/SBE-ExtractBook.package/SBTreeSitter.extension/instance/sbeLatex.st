*SBE-ExtractBook-ffi languages
sbeLatex

	<apicall: SBTSLanguageStruct* tree_sitter_latex () module: 'tree-sitter-latex'>
	^ SBTSLanguage tryPatchLibrary: 'latex-lsp/tree-sitter-latex' name: 'latex' context: thisContext branch: 'master' subpath: ''