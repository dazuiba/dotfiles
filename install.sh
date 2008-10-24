#!/usr/bin/env ruby

# from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')

files = Dir['*'].select{|file| 
  not (file == "install.sh" or
  file == "README" or
  file =~ /.template$/) 
}
files.each do |file|
  target = File.join(home, ".#{file}")
  puts "Installing ~/.#{file}"
  `ln -fsT #{File.expand_path file} #{target}`
end
