I'm the abstract superclass for all builders that can run a Smalltalk script. By definition, I am a test case, but actually my task is building rather than testing. My classSide is responsible for generating builder classes and running them.

I provide the following "main entry point":
SBEScriptBuilder generateBuildersIn: aFileReference.

If you have loaded some builders, you can simply run them using the TestRunner oder System Browser.