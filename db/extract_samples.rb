#!/usr/bin/env ruby

require 'pp'

csv = File.new("samples.csv", "w")
csv.puts("SAMPLE_SOURCE, SAMPLE_TRANSCRIPT, ARTIST, RECORDING, RELEASE")

data = File.read('sloth_samples.txt')

records = data.split(/^\d+?\.\s/)

index = 0

# A record is an entire entry for a given sample source starting with ^\d+.\s
records.each do |record|
  next if record == ""
  puts "Processing index # '#{index}'"
  # Split the record into an array of 2 elements where the sample source name
  # is the first element, and all other text for the source (sample dialogue and
  # release details) are in the second element.
  #
  # The ".?" suffixes on point/group/song/sample ensure we handle both
  # singular and plural cases on the sample source line.
  source_and_samples = record.split(/ \[\d+?\spoint.?\] \(\d+? group.?, \d+? song.?, \d+?\ssample.?\)\n/)
  source_title = source_and_samples[0]

  # Split the samples blob in the second element into an array of 1-n elements,
  # where each element contains a sample and its related artist/recording/release.
  samples = source_and_samples[1].split(/\n\n/)

  # For each sample/artist string in the collection, split the string into an array
  # where the first element is the sample dialogue, and the second element is the
  # artist/recording info.
  samples.each do |sample|
    sample_and_recording = sample.split(/\n    - /)
    sample_transcript = sample_and_recording[0]
    artist_info = sample_and_recording[1]

    # split the artist info line into artist/recording/release text
    artist_info =~ /(.*);\s(.*);\s(.*)/
    artist = ($1 ? $1 : '')
    recording = ($2 ? $2 : '')
    release = ($3 ? $3 : '')
    puts "\tArtist: '#{artist}'"
    puts "\tRecording: '#{recording}'"
    puts "\tRelease: '#{release}'"

    # Clean up whitespace and quotes and insert the CSV record
    csv.puts('"' + source_title + '","' +
#             sample_transcript.gsub('"', '\"').lstrip().rstrip() + '","' +
             sample_transcript.gsub('"', '').lstrip().rstrip() + '","' +
             artist + '","' +
             recording + '","' +
             release + '"')
  end

  index += 1
end

