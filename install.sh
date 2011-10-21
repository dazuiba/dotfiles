#!/usr/bin/env ruby
require 'erb'
# from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')

files = Dir['*'].select{|file| 
  not (file == "install.sh" or
  file == "README.md" or
  file =~ /.template$/) 
}
files.each do |file|
  target = File.join(home, ".#{file}")
  puts "Installing ~/.#{file}"
  
  if file =~ /.erb$/
    basename = file.sub('.erb', '')
    puts "Generating ~/.#{basename}"
    File.open(File.join(ENV['HOME'], ".#{basename}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    `ln -fsh #{File.expand_path file} #{target}"`
  end
  
end
