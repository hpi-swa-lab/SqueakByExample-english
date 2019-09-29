
IMPORTANT
---------

Please use `make` (or make.command) to check in new versions. This will run the tests.  Do NOT commit changes without running the tests!  Details below.

**PLEASE** follow the guidelines below for entering scg publications in the scg bib and in the web archive.  In particular, only put PDFs in the archive if they have a footnote with the *full* citation information.

Contents
--------
- How to update
- How to enter SCG publications
- How to write the booktitle field for @inproceedings entries
- How to prepare FactScience entries
- Keywords to use
- How to categorize entries in SCG bib
- How to label Entries
- How to find DOIs

---

The scg bibliography database is now under control of git.  A git FAQ has been started at:

	<http://scg.unibe.ch/wiki/faq/git>

How to update
-------------

Assuming you have write access to the scgbib git repo, check out a copy as follows:

	git clone git@scg.unibe.ch:scgbib

Alternatively, you can check out a read-only version as follows:

	git clone git://scg.unibe.ch/scgbib

Make your changes, then:

	make

This will test if the changes are ok.  Fix any problems that appear.
If there are no problems, make will continue to git pull and push.

The web version of the scg.bib will be updated automatically by a cron job after a few minutes.  To update it immediately (if you have ssh access to scg@yogi), just run:

	make yogi

If there are conflicts, resolve by running `git mergetool`.

Remember to do a `git pull` every time before you start to modify your local copy.

How to enter SCG publications
-----------------------------

All SCG publications must be tagged with an scg-XXX keyword (e.g., scg-pub, scg-phd etc. -- see "Keywords to use" further below) to be found by the various tools that automatically generate publication lists.

All SCG accepted and published should be entered into scg.bib:

- add the keyword "scg-pub" to the bib entry

- put a PDF of the final paper (**with its reference as a footnote**)
  into scg.unibe.ch/archive/papers (ftp or scp to scg.unibe.ch)

- put the URL of the PDF in the bib entry

  url = {...}

  If the url is missing, you can add a "missing-url" keyword.

- add the DOI, if one exists (see "How to find DOIs" below)

  doi = {...}

  If the doi is missing, add a "missing-doi" keyword.
  If there will never be a doi, add a "skip-doi" keyword.

- Please add the abstract to the bib entry
  You can add "missing-abstract" if the final abstract is not known, or
  "skip-abstract" if it is not available [should never happen!].

- Also add the PeerReview and Medium fields (see below under FactScience)

Please do *not* use curly braces to force all the words of the title to start with upper-case letters.  Only do this for words that are proper-names (e.g., {Magritte}).  In this case, please put the *entire* word in braces, not just the first character, or you will defeat searching!  By forcing upper case letters you are defeating the bibliography style for a given journal or proceedings, and you make everyone's life more difficult.

Please take care that the PDF is readable, and that all images are high resolution.  Ask if you are not sure how to do this.

SCG submitted papers should use the keyword "scg-sub".  Use a temporary key (like Nier03X).  When the paper is published, convert it to a permanent key (Nier03a ...) and change the keyword to scg-pub.  (An accepted paper can also use scg-pub, but leave the temporary key until it has appeared in print.)

You *may* but do not have to enter a URL for the PDF.  Please do *not* put the PDF of an unpublished paper in the papers directory, but in the drafts directory.  If the paper is accepted and published, please fix the entry to conform the the above specs.

SCG working papers (not yet in the submission process) can use the keyword scg-wp.

How to write the booktitle field for @inproceedings entries
-----------------------------------------------------------

booktitle field of new inproceedings entries should respect the following format:

CONF'YY: Proceedings of the NN{st|nd|rd|th} [International] Conference on Full Name Of The Conference.

For example:

OOPSLA'07: Proceedings of the 22nd Conference on Object-Oriented
                 Programming, Systems, Languages, and Applications

How to prepare FactScience entries
----------------------------------

Starting in 2008, all publications of the previous year (i.e., 2007) must be entered in BORIS, the University's FactScience database. For details see the separate file Anleitung_Bibtex_2010.pdf.

The key points are:

- Entries to be included should use the keyword scgNN for 20NN (e.g. scg07)
- Entries *not* to be included should have the keyword scg-wp (working paper), scg-sub (submitted), or scg-none
- Tech reports and theses are not be included (scg-msc, scg-bp, scg-ip)
- There is a Makefile entry scg07 to select candidates
- Peer-reviewed entries should include the key:

 	PeerReview = {yes},

  [possible values are: yes|no|unknown]

- All entries should include the field:

	Medium = {2},

  [0=print, 1=electronic, 2=print and electronic, 3=CD-ROM/DVD, 4=unknown]

- Always include the ISBN, ISSN, and publisher fields

Keywords to use
---------------

- scg-pub scg-sub scg-wp -- published, submitting, working papers
- scg-phd scg-msc scg-bp -- SCG PhD, Masters or Bachelors project
- scg-ip -- Informatikprojekt
- scg-misc -- anything else (web site etc)
- scglib -- books in the scg library
- scg0-7 ... -- publications for the FactScience database (see Erfassen der Publikationen)
- snf99, snf00 ... -- publications for the SNF report of 1999, etc
- snf-asa1 -- publications for first ASA project (2013-2015)
- snf-asa2 -- publications for ASA continuation project (2016-2018)
- jb99, jb00 ... -- publications for the IAM Jahresbericht 1999, etc
- famoos, pecos ... -- publications for the FAMOOS, project etc.

How to categorize entries in SCG bib
------------------------------------

You can query the SCG bib online, and generate publication lists with fixed queries.

To get entries to appear in the right categories (Journal papers etc), you should use the right type (@article etc) and possibly some additional keywords:

- Books: @book
- Journal articles: @article
- Invited papers: "invited"
- Conference papers: @inproceedings
- Workshop papers: @inproceedings "internationalworkshop"
- Tool demos: @inproceedings "tooldemo"
- Book chapter: @incollection
- Thesis: @phdthesis or @mastersthesis
- Tech report: @techreport
- Drafts: "scg-wp" or "scg-sub"
- Other papers: everything else

See also: <http://scg.unibe.ch/wiki/howtos/howToLinkToScgBib>

The rendering by category is performed by CPQueryResult>>renderByCategoryBy:On: in Citezen-Pier.

How to label Entries
--------------------

Use the following format for the key of an entry:

- the first letter should be UPPER CASE
- the first 4 letters of the last name of the first author (eg., Lanz)
- 2 digits that signify the year of publication or printing (eg., 99)
- one letter (a..z) (eg. a)
  [later there may be other entries with the same prefix!]
- use an upper case letter near the end of the alphabet (U-Z) for
  working and submitted papers convert to a permanent entry (lower
  case a-z) when published.

Example: Lanz99a, Lanz01a, Lanz01b, Duca05X etc.

How to find DOIs
----------------
DOIs (Digital Object Identifiers -- see www.doi.org) are important because

1. they establish a permanent identifier for a publication, and
2. they make it easier  to find related publications in the same venue.

DOIs exist for most ACM, IEEE, LNCS and Elsevier publications.
Here are some good places to look:

- http://www.acm.org/dl/
- http://computer.org/publications/dlib/
- http://www.springerlink.com/content/105633
- http://www.sciencedirect.com/

See the doi field in the scg-bib for examples.

Annote
------
The annote field can be used to indicate the type of publication,
and is used by certain scripts to generate publication lists by category.
The most important value is "internationalconference" for @inproceedings
entries.  (Without this value, they are assumed to be workshop papers.)

---

Oscar Nierstrasz, 2010-08-26
Updated: 2016-01-25
