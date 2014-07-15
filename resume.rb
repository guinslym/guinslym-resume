require "json"
require 'command_line_reporter'
require 'ostruct'
require 'optparse'


class Resume
  include CommandLineReporter

  	attr_accessor :hello
  def initialize
    self.formatter = 'progress'
    formatter.color = 'blue'
    formatter.bold = true
  end

  	#data = JSON.parse(File.read("resume.json"))

  	#puts data = data['bio']['firstName']

  def entete(titre, vertical_line=0, timestamp = false, couleur='white', align="center")
  	#outputs a vertical line
  	if vertical_line >0 
	 vertical_spacing vertical_line
  	end

	header :title => titre,
       :rule => true,
       :color => couleur,
       :align => align,
       :bold => true,
       :timestamp => timestamp
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


    #header for Guinsly Mondésir --Resume
	 horizontal_rule :color => 'blue', :bold => true
	 entete("Guinsly Mondesir - My Resume",0, true)


#############################################################################
#############################################################################
	 #header for Education
	 entete("Education", 2)
	#table for Education
    table :border => true do
      row :header => true, :color => 'red'  do
        column 'School', :width => 40, :align => 'center', :color => 'blue'
        column 'Diploma', :width => 40, :padding => 5
        column 'Year', :width => 15
      end
      #I need to do a loop of my shool and diplomas here 
      row :color => 'green', :bold => true do
        column 'Universite de Montreal'
        column 'Certificate in Web Computing'
        column '2014'
      end
    end#of the table

#############################################################################
#############################################################################
	#header for Experience
	entete("Work Experience", 2)


	#table for experience
    table :border => true do
      row :header => true, :color => 'red'  do
        column 'Company', :width => 40, :align => 'center', :color => 'blue'
        column 'Work', :width => 40, :padding => 5, :underline => true
        column 'Year', :width => 15
      end
      #I need to do a loop of work experience
      row :color => 'green', :bold => true do
        column 'Cegep Saint-Laurent'
        column "Computer helper at the library"
        column '2014'
      end
    end#of the table for Experience

	#table for list of experience
    table :border => true do
      row :header => true, :color => 'red'  do
        column 'Job Tasks', :width => 101, :align => 'center', :color => 'blue'
      end
      #I need to do a loop of work experience
      3.times do
      row :color => 'green', :bold => true do
        column 'In Ruby read json file to hash can be achieved '
      end
  	end#end 3.times
    end#of the table for Experience



#############################################################################
#############################################################################
	#header for Skills
	entete("Skills", 2)


	#table for list of experience
    table :border => true do
      row :header => true, :color => 'red'  do
        column 'Skills', :width => 101, :align => 'center', :color => 'blue'
      end
      #I need to do a loop of work experience
      3.times do
      row :color => 'green', :bold => true do
        column 'In Ruby read json file to hash can be achieved '
      end
  	end#end 3.times
    end#of the table for Experience

    

    report do
      10.times do
        x += 1
        #sleep 0.1
        progress
      end
    end


  end



end#end Resume


options = OpenStruct.new({:quiet => false})

OptionParser.new do |opts|
  opts.banner = "Usage: ruby -I lib example/quiet.rb [-q|--quiet]"

  opts.on('-q', '--quiet', 'do not print any output') do
    options.quiet = true
  end
end.parse!

Resume.new.run(options)


#horizontal_rule :color => 'red', :bold => true, :char => "<"
#horizontal_rule :color => 'red', :bold => true, :char => ">"