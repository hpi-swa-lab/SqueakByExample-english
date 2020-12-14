# Squeak by Example [![Build Status](https://travis-ci.com/hpi-swa-lab/SqueakByExample-english.svg?branch=master)](https://travis-ci.com/hpi-swa-lab/SqueakByExample-english)

This is the LaTeX source repository of the _Squeak by Example_ book.

See the issues in the [Github repository](https://github.com/hpi-swa-lab/SqueakByExample-english) for the status of tasks for SBE.

---

# File structure

The main file is SBE.tex.  Chapters are in subdirectories.
You can latex either the entire book, or each individual chapter.
Each chapter file starts and ends with the same incantation
which will optionally include macros or end the document if it is
latexed individually.

Use the \ct{} macro for in-line code.
Use the {method} {classdef} {example} and {script} environments for
multi-line code.

If you add a new chapter: 
-	please be sure to include it from SBE.tex.
-	Remember to include its /figures/ subdirectory in the graphicspath,
	   which is set in the preamble to SBE.tex.  Don't forget the trailing /
-	Please make sure the chapter compiles with latex both from the main book
	and as a separate chapter.  

IMPORTANT: Please check out a fresh copy of the book and compile the book
to verify that you have added all the dependent files (e.g., figures).

## Build process

The PDF of the book is built via Travis CI on each commit, which includes the execution of SBEtests and the generation of screenshots that are described by a figure script. Two PDFs are created, one for the latest Squeak release and one for the current Trunk version.

The usual workflow to codify a screenshot is documented [here](https://github.com/hpi-swa-lab/SqueakByExample-english/issues/21#issue-516598115). If the build process completed, you can watch the results [here](https://drive.google.com/drive/folders/1tNIvN-9Vx8djNZYfSYuqhjheb-EgJuTc).
To build the PDF manually, do the following:
### I. Installation
1. Get a support Squeak image (any release since 5.3 or the latest Trunk image)
2. Open the Git Browser and clone this repository
3. Make sure to set the resource directory to the path of your working copy:
 ```smalltalk
SBEFigureBuilder resourceDirectory: FileDirectory default asFSReference / 'path' / 'to' / 'workingCopy'.
 ```
4. Install any Linux distribution.
### II. Building
1. Do it:
 ```smalltalk
SBEFigureBuilder buildAllTexFigures.
 ```
2. From the shell, run "make" in the working copy.

For more insights into the build process, have a look at the `Makefile` and the `.travis.yml`.

## Printing

The book has been reformatted to 6"x9" (for Lulu). If you want to print any
part of the book, you will find that printing 2 up at 140% works well.

---

# Style Rules

* Captions of all material is terminated with a period.
* No title case in headings
* In unnamed code snippets: If the expression is followed by the result (-->) there is no period, otherwise add a period.


---

# Testing

Tests are automatically generated from the LaTeX sources.

Grab a recent Squeak image and move it to the folder Squeak book folder.  Do *not* use a 1-click image, since the actual image should be located at the same level as the SBE.tex file.

To run the tests, load the package SBE-Testing from this repository.
Then evaluate the following expression in a workspace:

 ```smalltalk
SBEmain new runTests
 ```

This will automatically extract and run the tests in the LaTeX sources of the Squeak by Example book.  It will also load the hands-on exercises, and check that they are working. (Some tests may also be included from the dependent hands-on packages.)

This will parse (using Regex) the SBE.tex to locate the included chapter files, parse each chapter file to search for @TEST annotations, generate test case classes for each chapter with tests in a new category SBE-GeneratedTests, and generate a test method (numbered by the line number in the chapter) for each test found.  (NB: Any old generated tests are removed before new ones are generated.) Finally, by sending "runTests", a TestRunner is opened on the new category, and all those tests are run.

## How to write tests in LaTeX

A sample test in the BasicClasses looks like this:
 ```latex
\begin{code}{@TEST}
a1 := { { 'harry' } } .
a2 := a1 shallowCopy.
(a1 at: 1) at: 1 put: 'sally'.
(a2 at: 1) at: 1 --> 'sally'
\end{code}
 ```

The "print it" invocation (-->) will generate an assertion.

The generated source code looks like this:

 ```smalltalk
test204
	a1 := { { 'harry' } } .
	a2 := a1 shallowCopy.
	(a1 at: 1) at: 1 put: 'sally'.
	self assert: [ (a2 at: 1) at: 1  ] value printString = '''sally'''
 ```

You may also silently declare or initialize variables immediately after @TEST,
and you may now place comments after the test string:

 ```latex
\begin{code}{@TEST |a b|}
a := b := 'hello'.
a == b --> true "two variables but one object"
\end{code}
 ```

The generated TestCase subclass is `SBEBasicClassesTestCase`.

The generated tests can be removed by evaluating `SBEmain removeOldTestCategory`. This is done automatically whenever you do `SBEmain new runTests`.

---

# LaTeX version

Please use at least texlive 2017.
http://www.tug.org/texlive/

## Figures and OmniGraffle files

Please be sure to use Lucida Sans, not Helvetica, or you may have problems
uploading the PDF to Lulu.  See the font embedding FAQ on lulu.com
See more detailed instructions in Cover/README.txt

## Style files

To inform latex about the location of local style files, set the following environment variable (tcsh):

	setenv TEXINPUTS ./local//:../local//:
		or (bash):
	export TEXINPUTS=./local//:../local//:

If you are using a GUI like TeXshop, you must set the environment variable in ~/.MacOSX/environment.plist :

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>TEXINPUTS</key>
		<string>./local//:../local//:</string>
	</dict>
	</plist>
 
NB: You may need to logout and login again after creating or modifying this file.
Note colon at end of TEXINPUTS that means "append current value here"
(eg local has higher priority). Double slash means search recursively.

# Bibliography

The bibliography can be found in the `Bibliography` folder.
When the `make` command is run, the bibliography is automatically built as well.

---

# Smalltalk Sources

The "Squeak by Example" Monticello Repository can be found as a [FileTree](https://github.com/dalehenrich/filetree) repository in the `SmalltalkSources` folder.

The package SBE-Testing includes as dependencies the code for the hands-on chapters.
It will run all the test code in the latex sources and exercise the hands-on code.

The repository was previously hosted on [squeaksource](http://www.squeaksource.com/@QJbXgqmsC7AwLgNB/jkjcsr-2).

# Coding Style Guide

* An empty line before the first line of the code 
* Point at the end of a line, except for a line with a return statement
* Space around all binary selectors
* Keyword message with more than one keyword are broken up on several lines
* Use cascades whenever possible (except for very early introductory examples)
* Avoid unnecessary parentheses

---

# License

This work is licensed under Creative Commons Attribution-ShareAlike 3.0 Unported
	<http://creativecommons.org/licenses/by-sa/3.0/>

You are free:

- to Share -- to copy, distribute and transmit the work
- to Remix -- to adapt the work

Under the following conditions:

Attribution. You must attribute the work in the manner specified by the author or
licensor (but not in any way that suggests that they endorse you or your use of the work).
Share Alike. If you alter, transform, or build upon this work, you may distribute
the resulting work only under the same, similar or a compatible license.
For any reuse or distribution, you must make clear to others the license terms of
this work. The best way to do this is with a link to this web page.
Any of the above conditions can be waived if you get permission from the copyright holder.
Nothing in this license impairs or restricts the author's moral rights.

## Disclaimer
Your fair dealing and other rights are in no way affected by the above.
This is a human-readable summary of the Legal Code (the full license).
