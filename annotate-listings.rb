#! /usr/bin/ruby -s
#
# listings --- extract and annotate code files 
#
# ============================================================
def main
	`find ListingSources -type f -name "*.st"`.lines do |fileName|
		strippedFileName = fileName.strip
		parts = strippedFileName.scan(/package\/(.*)\.class\//)
		unless parts.empty? or parts.last.empty? or parts.last.first.nil? then
			className = parts.last.first
			source = File.read(strippedFileName)
			source.encode(source.encoding, universal_newline: true)
			lines = source.lines
			lines.shift()
			lines[0] = className + ">>>" + lines.first
			source = lines.join()
			File.write(strippedFileName, source)
		end
	end
end
main
