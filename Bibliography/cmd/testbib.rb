#! /usr/bin/ruby
#
# testbib.rb --- test a bib file for errors
#
# TO DO:
# - add scgbib test for space between pub type and label
# - fix check_bad_quotes (does not work correctly?)
#
# $Id: testbib.rb,v 1.13 2006/08/14 10:02:49 oscar Exp $
# $Author: oscar $
# ----------------------------------------------------------------------
# Hack from Stackoverflow to avoid "invalid byte sequence in US-ASCII" error
if RUBY_VERSION =~ /(2.3)|(2.0)|(1.9)/ # assuming you're running Ruby ~2.0
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
# ----------------------------------------------------------------------
# For testing from TextMate
# NB: bibtex must be in your bash $PATH
# You can set this in your .bash_profile (see TextMate Help)
if ARGV.length == 0
  puts `time ruby testbib.rb ../scg.bib`
  exit
end
# ----------------------------------------------------------------------
# raise "Usage: testbib.rb <bibtex file> ..." if ARGV.length == 0
# ----------------------------------------------------------------------
# bibtex
MAXCITATIONS = 5000
# ----------------------------------------------------------------------
MAXLINELENGTH = 128 # Mainly for abstracts
# ----------------------------------------------------------------------
# We look for required files locally -- don't assume they are
# installed on this machine ...
$: << "#{Dir.getwd}/rubylib"
require "rbibtex"
PARSER = BibTeX::Parser.new
# ======================================================================
# Run all the tests from here
def main
  for file in ARGV
    bibfile = BibFile.new file
    bibfile.check
  end
end
# ----------------------------------------------------------------------
def assert_exists *commands
  for cmd in commands
    unless `which #{cmd}` =~ %r{^/}
      raise "Can't find #{cmd}! -- please add it to your search path!"
    end
  end
end
# ======================================================================
class BibFile
  TEMP = "tmp"
  TEMP_AUX = "#{TEMP}.aux"
  def initialize file
    assert_exists "bibtex"
    @file = file
    @errs = String.new
    @bib = load_bib_file file
  end
  # --------------------------------------------------------------------
  private
  def load_bib_file file
    bib = Array.new
    IO.foreach(file, separator="") do |record|
      begin
        text = record.strip
        unless text.empty? || text =~ /@(comment|string)\W|[#%]/i
          entry = BibEntry.new(record)
          bib << entry
        end
      rescue RuntimeError => e
        @errs << "#{e.message}\nSkipping this record (after #{bib.last.key})\n"
      rescue Racc::ParseError => e
        @errs << "#{e.message}\nFailed to parse >>>\n#{record}<<<\n"
      end
    end
    return bib
  end
  # --------------------------------------------------------------------
  public
  def check
    check_bibtex
    for record in @bib
      record.add_errors @errs
    end
    output_errs
  end
  # --------------------------------------------------------------------
  def check_bibtex
    for slice in bibslice(@bib)
      File.open(TEMP_AUX, "w") do |file|
        file << aux_file(slice)
      end
      warnings = `bibtex -terse #{TEMP}`.split(/\n/)
      warnings.reject! { |item| item =~ /(There (were|was) \d+ warnings?)/ }
      warnings = warnings - OKWARNINGS.split(/\n/)
      if warnings.length > 0
        @errs << "===> bibtex found the following errors:\n"
        @errs << warnings.join("\n")
        @errs << "\n"
      end
      `rm -f tmp.*`
    end
  end
  # --------------------------------------------------------------------
  def output_errs
    if @errs.length > 0
      puts "#{@file} ===> Errors found!"
      puts @errs
      exit false
    else
      puts "===> No errors detected in #{@file}"
      # we could exit true, but we want to continue checking other files in ARGV...
    end
  end
  # --------------------------------------------------------------------
  private
  def aux_file slice
    return <<-eof
\\relax
#{(slice.collect { |r| r.citation }).join("\n")}
\\bibstyle{plain}
\\bibdata{#{@file}}
    eof
  end
  # --------------------------------------------------------------------
  # bibtex can only handle MAXCITATIONS citations, so we need
  # to split up the bibtex file to test it.
  private
  def bibslice bib
    slices = Array.new
    local_bib = bib.dup
    while local_bib.length > 0
      slice = local_bib.slice(0,MAXCITATIONS)
      local_bib.slice!(0,MAXCITATIONS)
      slices << slice
    end
    return slices
  end
end
# ----------------------------------------------------------------------
# These are warnings that are produced when running bibtex
# You should add a line when you are sure that the bibtex entry is
# correct. For instance, OOPSLA articles have a warning because we enter
# both the number and the volume.
OKWARNINGS = <<eof
Warning--can't use both volume and number fields in Bloo87a
Warning--there's a number but no volume in Fent94a
Warning--can't use both volume and number fields in Form94a
Warning--there's a number but no volume in Glas94a
Warning--can't use both volume and number fields in Gree85a
Warning--can't use both volume and number fields in Halb91a
Warning--can't use both volume and number fields in Inga86a
Warning--there's a number but no volume in Jaff94a
Warning--can't use both volume and number fields in Krist94a
Warning--can't use both volume and number fields in Kuma92a
Warning--can't use both volume and number fields in Lort94a
Warning--there's a number but no volume in Pott96a
Warning--can't use both volume and number fields in Repp91a
eof
# ======================================================================
# Holds the text of a bibtex entry and extracts other
# information needed for the tests
class BibEntry
  attr_accessor(:tag, :key, :text)
  def initialize text
    @text = text
    @lines = text.split(/\n/)
    if @text =~ /@(\w+)\s*\{\s*(\w+)\s*,/
      @tag = $1
      @key = $2
    else
      raise "Missing tag or key in >>>\n#{text}<<<"
    end
    @entry = nil # lazy
  end
  # --------------------------------------------------------------------
  def citation
    return "\\citation{#{self.key}}"
  end
  # --------------------------------------------------------------------
  def key
    # return @entry.key
    return @key
  end
  # --------------------------------------------------------------------
  # Add all my errors to the error log
  def add_errors errs
    check_mixed_case errs
    check_trailing_blank errs
    # check sort order?
    check_curly_brace errs
    check_final_comma errs
    check_joined_record errs
    check_bad_month errs
    check_bad_year errs
    check_bad_key errs
    check_8bit_char errs
    check_bad_quotes errs
    # check_long_abstract errs
    check_doi_format errs
    check_scg_pub_complete errs
    check_factScience errs
    # check_rbibtex_parsing errs    # currently too slow to be usable
  end
  # --------------------------------------------------------------------
  # check if all tags are in lowercase.  Otherwise bib2html will 
  # ignore them.  (For bibtex uppercase tags would be fine though). 
  def check_mixed_case errs
    if @tag =~ /[A-Z]/
      errs << "#{@key} ===> found mixed case tag:\n"
      errs << "        @#{@tag} should be @#{@tag.downcase}\n"
    end
  end
  # --------------------------------------------------------------------
  # trailing blanks sometimes confuse htgrep
  def check_trailing_blank errs
    for line in @lines
      # if line =~ / $/
      if line =~ /\s$/
        errs << "#{@key} ===> found trailing blanks:\n"
        errs << "        Please fix line:\n#{line}\n"
      end
    end
  end
  # --------------------------------------------------------------------
  # Strangely, this is much slower!
  def xcheck_trailing_blank errs
    if @text =~ /(.* +)\n/
      errs << "#{@key} ===> found trailing blanks:\n"
      errs << "        Please fix line \"#{$1}\"\n"
    end
  end
  # --------------------------------------------------------------------
  # Complain if quotes rather than curly braces are used to delimit entries
  def check_curly_brace errs
    for line in @lines
      if line =~ /^\s*[^=]*\s*=\s*"/
        errs << "#{@key} ===> found malformed property:\n"
        errs << "        Please use curly braces in line:\n#{line}\n"
      end
    end
  end  
  # --------------------------------------------------------------------
  # Complain if last entry ends with ","
  def check_final_comma errs
    if @text =~ /,[\s\n]*\}\n*$/
      errs << "#{@key} ===> found trailing comma:\n"
      errs << "        Please remove comma after last property\n"
    end
  end
  # --------------------------------------------------------------------
  # Complain if records are joined
  # Perhaps needs to be refined or generalized ...
  def check_joined_record errs
     if @text =~ /\}\s*@/
       errs << "#{@key} ===> found joined entry:\n"
       errs << "        Please add a blank line to separate entries\n"
     end
  end
  # --------------------------------------------------------------------
  # Complain if bad month format used
  def check_bad_month errs
    if text =~ /month\s*=\s*\{?([^,}\n]*)\}?,?/i
      month = $1
      if !(month =~ /^[a-z]{3}$/)
        errs << "#{@key} ===> found bad month:\n"
        errs << "        Please use 3-letter month instead of `#{month}'\n"
      end
    end
  end
  # perl -n -e '/month\s*=\s*{?([^,}\n]*)}?,?/ && ($1 !~ /^[a-z]{3}$/) && print "use 3-letter month: $1\n"' ${bib} >> errs
  # --------------------------------------------------------------------
  # Check that year is in curly braces
  def check_bad_year errs
    if text =~ /year\s*=\s*(\d+)/i
      year = $1
      errs << "#{@key} ===> missing curly braces around year:\n"
      errs << "        Please add curly braces around year #{year}'\n"
    end
  end
  # --------------------------------------------------------------------
  # Complain if unconventional label used (how strict should we be?)
  # Rule: 2-5 alpha + 2 digits + optional char a-z or X-Z
  def check_bad_key errs
    unless @tag =~ /misc/
      if !(@key =~ /^\w{2,5}\d\d[a-zU-Z]?$/)
        errs << "#{@key}===> found non-standard key:\n"
        errs << "        Please use a key with 2-5 letters, 2 digits and an optional trailing letter\n"
      end
    end
  end
  # --------------------------------------------------------------------
  # Check for 8bit chars
  def check_8bit_char errs
    for line in @lines
      if line.tr("\t !-~","") =~ /./
        errs << "#{@key} ===> found 8-bit char:\n"
        errs << "        Please remove 8-bit char `#{line.tr("\t !-~","")}' in line:\n#{line}\n"
      end
    end
  end
  # perl -n -e 'tr/\t !-~//d && /./ && print "remove 8bit char on line $.: $_"' ${bib}
  # --------------------------------------------------------------------
  # Check for wrong quotation marks “‘’”
  def check_bad_quotes errs
    for line in @lines
      # if (line =~ /[#]/)
      if (line =~ /[“‘’”]/)
        errs << "#{@key} ===> found incorrect quotation mark:\n"
        errs << "        Please fix quotation marks in line:\n#{line}\n"
      end
    end      
  end
  # --------------------------------------------------------------------
  # Check for long abstract
  def check_long_abstract errs
    for line in @lines
      if line.length > MAXLINELENGTH
        if line =~ /\s*abstract\s*=/i
          errs << "#{@key} ===> found very long abstract:\n"
          errs << "        Please reformat the abstract\n\n"
        end
      end
    end
  end
  # --------------------------------------------------------------------
  # Check for raw dois -- no http prefix
  def check_doi_format errs
    if text =~ /doi\s*=\s*\{(http:\/\/[^\/]*\/)([^}]+)\}/i
      prefix = $1
      doi = $2
      errs << "#{@key} ===> http prefix found in doi:\n"
      errs << "        Please delete `#{prefix}' and use only raw doi `#{doi}'\n"
    end
  end
  # --------------------------------------------------------------------
  # Check for abstract, url and doi
  def check_scg_pub_complete errs
    if text =~ /scg-pub/i
      if (text =~ /abstract\s*=/i)
        if (text =~ /skip-abstract|missing-abstract/i)
          errs << "===> redundant skip-abstract or missing-abstract keyword in scg-pub #{@key}\n"
        end
      else
        if !(text =~ /skip-abstract|missing-abstract/i)
          errs << "===> missing abstract (or skip-abstract or missing-abstract keyword) in scg-pub #{@key}\n"
        end
      end

      if (text =~ /doi\s*=/i)
        if (text =~ /skip-?doi|missing-doi/i)
          errs << "===> redundant skip-doi or missing-doi keyword in scg-pub #{@key}\n"
        end
      else
        if !(text =~ /skip-?doi|missing-doi/i)
          errs << "===> missing doi (or skip-doi or missing-doi keyword) in scg-pub #{@key}\n"
        end
      end

      if (text =~ /url\s*=/i)
        if (text =~ /skip-url|skip-pdf|missing-pdf/i)
          errs << "===> redundant skip-pdf or missing-pdf keyword in scg-pub #{@key}\n"
        end
      else
        if !(text =~ /skip-pdf|skip-url|missing-pdf/i)
          errs << "===> missing url (or skip-pdf or missing-pdf keyword) in scg-pub #{@key}\n"
        end
      end
    end
  end
  # --------------------------------------------------------------------
  # Check for PeerReview and Medium fields
  def check_factScience errs
    if (text =~ /scg-pub/i) && (text =~ /scg\d\d/)
      if !(text =~ /peerreview\s*=/i)
        errs << "===> missing PeerReview = {yes|no|unknown} in scg-pub #{@key}\n"
      end
      if !(text =~ /medium\s*=/i)
        errs << "===> missing medium = {0[print]|1[electronic]|2[both]|3[CD/DVD]|4[unknown]} in scg-pub #{@key}\n"
      end
    end
  end
  # --------------------------------------------------------------------
  # Check if rbibtex parses the entry by triggering the lazy evaluation
  # This is currently too slow to use -- testing the entire scg.bib
  # takes 25 seconds instead of 3.5 seconds.
  # Perhaps we need a smarter parser!
  def check_rbibtex_parsing errs
    self.entry
  end
  # --------------------------------------------------------------------
  # Lazy variable -- for the moment not used
  def entry
    if @entry.nil?
      @entry = PARSER.parse(@text)[0] # may raise Racc::ParseError
    end
    return @entry
  end
end
# ======================================================================
main
# ======================================================================
