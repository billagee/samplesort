#!/usr/bin/env ruby
#
# Puts the artist lines from grouplist_v37.txt's Index section into a new file.

out = File.new("sloth_artists.txt", "w")
numlines = 0
marker = nil

#File.open("grouplist_v37.txt").each do |line|
#File.open("grouplist_v37.txt", "r:UTF-8").each do |line|
File.open("grouplist_v37.txt", "r:windows-1251").each do |line|
  numlines = numlines += 1
  if (line =~ /^Index/)
    puts line
    marker = numlines
  end
  if (marker && (numlines > marker+1))
    # put line into new file
    out.puts line
  end
end

#puts numlines

out.close

