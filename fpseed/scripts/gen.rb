#!/usr/bin/env ruby

##
# Script to generate an Assets.as file from the files in your assets/ folder.
#
#


files = Dir.glob("assets/**/*")

def process file
  filetype = suffix(file).to_sym
  Processor.send(filetype, file) if Processor.respond_to? filetype
end

def suffix file
  file.split(".").last
end

# define how different filetypes should be formatted here.
class Processor
  class << self

    def png file
      "[Embed(source = '#{path file}')] public static const #{name file}:Class;"
    end
    # mp3's get embedded the same way as pngs
    alias :mp3 :png

    def xml file
      "[Embed(source = '#{path file}', mimeType='application/octet-stream')] public static const #{name file}:Class;"
    end



    def name file
      file.gsub("/","_").gsub(/^assets_/i,"").gsub(/\..*/,"").upcase
    end

    def path file
      "../#{file}"
    end
  end
end

embeds = files.map {|file| process file }.join("\n    ")

result = <<eof
//THIS IS AN AUTOMATICALLY GENERATED FILE
package
{
  import net.flashpunk.Entity;
  public class Assets
  {
#{embeds} 
  }
}
eof

puts result
