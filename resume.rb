=begin
require "./lib/resume"


#resume.json was build with npm-resume
file = File.read("resume.json")
data = JSON.parse(file)
resume = Resume.new(data)
puts data["work"]


bio
work
education
awards
publications
skills
references
=end

require 'command_line_reporter'
require 'ostruct'
require 'optparse'

#this is the example file from command_line_reporter that I will modify the Example.class to fits my needs

class Resume
  include CommandLineReporter

  def initialize
    self.formatter = 'progress'
    formatter.color = 'blue'
    formatter.bold = true
  end



  def run(options = {})

	x = 0

    suppress_output if options.quiet
    report do
      10.times do
        x += 1
        #sleep 0.1
        progress
      end
    end
    restore_output if options.quiet



    header :title => 'An example of a table with a header row.  The color and border properties are not inherited'

    table :border => true do
      row :header => true, :color => 'red'  do
        column 'MY NAME IS REALLY LONG AND WILL WRAP AND HOPE', :width => 20, :align => 'center', :color => 'blue'
        column 'ADDRESS', :width => 30, :padding => 5
        column 'CITY', :width => 15
      end
      row :color => 'green', :bold => true do
        column 'Ceaser'
        column '1 Appian Way'
        column 'Rome'
      end
      row do
        column 'Richard Feynman'
        column '1 Golden Gate'
        column 'Quantum Field'
      end
    end
    footer :title => "Lorem ipsum dolor sit amet, netur. Sit nisi nostrum minima dolor eius tempora?",
    		:rule => true,
    		:color => "blue",
    		:spacing => 3,
    		:align => 'center',
    		:bold => true,
    		:timestamp => true

    vertical_spacing 2
   	horizontal_rule :color => 'red', :bold => true, :char => "<"
   	horizontal_rule :color => 'red', :bold => true, :char => ">"
    header :title => 'The same table with the properties inherited from the first row'

    table :border => true do
      row :color => 'red' do
        column 'MY NAME IS REALLY LONG AND WILL WRAP AND HOPE', :width => 20, :align => 'center', :color => 'blue'
        column 'ADDRESS', :width => 30, :padding => 5
        column 'CITY', :width => 15
      end
      row :color => 'green', :bold => true do
        column 'Ceaser'
        column '1 Appian Way'
        column 'Rome'
      end
      row do
        column 'Richard Feynman'
        column '1 Golden Gate'
        column 'Quantum Field'
      end
    end

    report do
      10.times do
        x += 1
        #sleep 0.1
        progress
      end
    end
  end



end


options = OpenStruct.new({:quiet => false})

OptionParser.new do |opts|
  opts.banner = "Usage: ruby -I lib example/quiet.rb [-q|--quiet]"

  opts.on('-q', '--quiet', 'do not print any output') do
    options.quiet = true
  end
end.parse!

Resume.new.run(options)