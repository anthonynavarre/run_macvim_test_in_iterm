#!/usr/bin/env ruby

if ARGV.size == 0
  puts "You must supply a file path"
  exit!
end

file_path = ARGV[0]
if file_path =~ /^~/
  file_path = File.expand_path(file_path)
end

file = File.open(file_path, 'r')

found_lines = []
line_count = 1

while (line = file.gets)
  found_lines << "#{line.gsub(/('|"|do)/,'').strip}:#{line_count}" if line =~ /(describe|context|scenario)/i
  line_count += 1
end

print found_lines.join("\n")

