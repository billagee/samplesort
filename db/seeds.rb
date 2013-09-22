# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# WARNING! This wipes all data:
Artist.delete_all
Release.delete_all
Recording.delete_all
Sample.delete_all
SampleSource.delete_all

################ ARTISTS ################
#
# Insert artist records from sloth_artists.txt
#
#File.open("sloth_artists.txt", "r:windows-1251").each do |line|
File.open(File.dirname(__FILE__) + "/sloth_artists.txt").each do |line|
  # Add a display_name field value to the artist record when we see a trailing
  # ", The" or ", An" or ", A" on the name value:
  the_name = line.chomp
  # FIXME - use a case statement here:
  if (the_name =~ /(.*), The$/)
    the_display_name = "The " + $1
  elsif (the_name =~ /(.*), A$/)
    the_display_name = "A " + $1
  elsif (the_name =~ /(.*), An$/)
    the_display_name = "An " + $1
  end
  if the_display_name
    Artist.create(name: line.chomp, display_name: the_display_name)
  else
    Artist.create(name: line.chomp)
  end
end

=begin
# Creating artists directly without CSV:

artists = Artist.create([
  { name: 'Orbital' },
  { name: 'Underworld' },
  { name: 'Skinny Puppy' },
  { name: 'Leaether Strip' },
  { name: 'Future Sound of London' },
  { name: 'Juno Reactor' },
  { name: 'My Life with the Thrill Kill Kult' },
  { name: 'Front 242' },
  { name: 'Stars' },
  { name: 'VNV Nation' },
])
=end

# FIXME: Add aliases to artists - if we care about that. Maybe pull this from discogs or musicbrainz?
#
# "Art of Noise"
#     "Art of Noise, The"
# "Bloodhound Gang"
#     "Bloodhound Gang, The"
# "Charlatans, The"
#     "Charlatans UK, The"
# "Dust of Basement, The"
#     "Dust of Basement"
#
#     ...and so on.

################ RELEASES ################

releases = Release.create([
  { name: "The Orb's Adventures Beyond the Ultraworld" },
  { name: "The Middle of Nowhere" },
  { name: "Orbital 2" },
  { name: "Remission" },
  { name: "Accelerator" },
  { name: "Beyond the Infinite" },
  { name: "13 Above the Night" },
  { name: "Mut@ge.Mix@ge" },
  { name: "Heart" },
  { name: "Nightsongs" },
])

################ RECORDINGS ################

artists = Artist.all
recordings = Recording.create([
  {
    name: "Little Fluffy Clouds",
    artist: artists.select {|a| a.name == 'Orb, The'}.first,
    release: releases.select {|r| r.name == "The Orb's Adventures Beyond the Ultraworld"}.first,
  },
  {
    name: "I Don't Know You People",
    artist: artists.select {|a| a.name == 'Orbital'}.first,
    release: releases.select {|r| r.name == 'The Middle of Nowhere'}.first,
  },
  {
    name: "Planet of the Shapes",
    artist: artists.select {|a| a.name == 'Orbital'}.first,
    release: releases.select {|r| r.name == 'Orbital 2'}.first,
  },
  {
    name: "Film",
    artist: artists.select {|a| a.name == 'Skinny Puppy'}.first,
    release: releases.select {|r| r.name == 'Remission'}.first,
  },
  {
    name: "1 in 8",
    artist: artists.select {|a| a.name == 'Future Sound of London'}.first,
    release: releases.select {|r| r.name == 'Accelerator'}.first,
  },
  {
    name: "Rotorblade",
    artist: artists.select {|a| a.name == 'Juno Reactor'}.first,
    release: releases.select {|r| r.name == 'Beyond the Infinite'}.first,
  },
  {
    name: "Happiness (Dub mix by Underworld)",
    artist: artists.select {|a| a.name == 'Front 242'}.first,
    release: releases.select {|r| r.name == 'Mut@ge.Mix@ge'}.first,
  },
  {
    name: "International Rock Star",
    artist: artists.select {|a| a.name == 'Stars'}.first,
    release: releases.select {|r| r.name == 'Nightsongs'}.first,
  },
  {
    name: "The Woods",
    artist: artists.select {|a| a.name == 'Stars'}.first,
    release: releases.select {|r| r.name == 'Heart'}.first,
  },
])

################ SAMPLE SOURCES ################
#
# Insert all records from sloth_sample_sources.txt
File.open(File.dirname(__FILE__) + "/sloth_sample_sources.txt").each do |line|
  SampleSource.create(title: line.chomp)
end

# Create sample_sources records not in sloth file
SampleSource.create([
# Already in sloth.org file:
#  { title: "Withnail and I" },
#  { title: "Legend of Hell House, The" },
#  { title: "Dune" },
#  { title: "Mad Max Beyond Thunderdome" },
#  { title: "Jacob's Ladder" },
  { title: "Grey Gardens" },
  { title: "Gentlemen Prefer Blondes" },
  { title: "The Collector" },
  { title: "A Conversation With Rickie Lee Jones" },
])

################ SAMPLES ################

sample_sources = SampleSource.all
samples = Sample.create([
  {
    transcript: "Interviewer: \"What were the skies like when you were young?\" Rickie Lee Jones: \"They went on forever - They - When I w- We lived in Arizona, and the skies always had little fluffy clouds in 'em, and, uh... they were long... and clear and... there were lots of stars at night. And, uh, when it would rain, it would all turn - it- They were beautiful, the most beautiful skies as a matter of fact. Um, the sunsets were purple and red and yellow and on fire, and the clouds would catch the colours everywhere. That's uh, neat 'cause I used to look at them all the time, when I was little. You don't see that. You might still see them in the desert.\"",
    sample_source: sample_sources.select {|s| s.title == 'A Conversation With Rickie Lee Jones'}.first,
    recording: recordings.select {|r| r.name == "Little Fluffy Clouds"}.first,
  },
  {
    transcript: "Even a stopped clock tells the right time twice a day.",
    sample_source: sample_sources.select {|s| s.title == 'Withnail and I'}.first,
    recording: recordings.select {|r| r.name == "Planet of the Shapes"}.first,
  },
  {
    transcript: "In my dreams...so beautiful",
    sample_source: sample_sources.select {|s| s.title == 'Dune'}.first,
    recording: recordings.select {|r| r.name == "1 in 8"}.first,
  },
  {
    transcript: "I don't know you people. Why are you here? It does no good. Nothing changes.",
    sample_source: sample_sources.select {|s| s.title == 'Legend of Hell House, The'}.first,
    recording: recordings.select {|r| r.name == "I Don't Know You People"}.first,
  },
  {
    transcript: "Survival after death.",
    sample_source: sample_sources.select {|s| s.title == 'Legend of Hell House, The'}.first,
    recording: recordings.select {|r| r.name == "Film"}.first,
  },
  {
    transcript: "Some thoughts have a certain sound.",
    sample_source: sample_sources.select {|s| s.title == 'Dune'}.first,
    recording: recordings.select {|r| r.name == "Rotorblade"}.first,
  },
  {
    transcript: "I want you to find happiness.",
    sample_source: sample_sources.select {|s| s.title == 'Gentlemen Prefer Blondes'}.first,
    recording: recordings.select {|r| r.name == "Happiness (Dub mix by Underworld)"}.first,
  },
  {
    transcript: "(Girl) The whole of England must be looking for me. Well, sooner or later they're going to find me. (Terence Stamp) Never. Because, you see, they're looking for you, all right -- but nobody's looking for me.",
    sample_source: sample_sources.select {|s| s.title == 'The Collector'}.first,
    recording: recordings.select {|r| r.name == "International Rock Star"}.first,
  },
  {
    transcript: "It's a sea of leaves. Complete sea of leaves. If you lose something, you can't find it again; it drops to the bottom. (Little Edie Beale)",
    sample_source: sample_sources.select {|s| s.title == 'Grey Gardens'}.first,
    recording: recordings.select {|r| r.name == "The Woods"}.first,
  },
#  {
#    transcript: "[girl (FIXME - character name?) calls loudly to her friends]",
#    sample_source: sample_sources.select {|s| s.title == 'Mad Max Beyond Thunderdome'}.first,
#    recording: recordings.select {|r| r.name == "FIXME - what FSOL song samples this? Or is it an Amorphous Androgynous track from Tales of Ephidrina?"}.first,
#  },
#  {
#    transcript: "FIXME - Danny Aiello bit in Jacob's Ladder discussing angels and demons",
#    sample_source: sample_sources.select {|s| s.title == "Jacob's Ladder"}.first,
#    recording: recordings.select {|r| r.name == "FIXME - what VNV song samples this?"}.first,
#  },
])

