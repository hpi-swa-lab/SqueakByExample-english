Class to demo various uses of regexes.

A WebDir has a reference to a FileDirectory containing a web site.
A WebDir contains WebPages and other WebDirs.  The path to the root
of the web site is always stored in an instance variable 'homePath'.
A WebDir will generate a site map in the file toc.html if it is sent the message #mkToc.

Instantiate and generate toc.html as follows:
	(WebDir onPath: '/home/oscar/onweb') mkToc
or:
	WebDir selectHome mkToc

Regexes are used:
1. to identify .html files (WebDir>>htmlFiles)
2. to strip a path down to a file name (WebPage>>fileName)
3. to generate a relative path to an html file (WebPage>>relativePath)
4. to extract the title from a web page (WebPage>>title)