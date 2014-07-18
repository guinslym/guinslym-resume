require "json"
require 'command_line_reporter'
require 'ostruct'
require 'optparse'
require 'date'



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



  def run(options = {}, file)

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
	 name = file['bio']['firstName'] + " " + file['bio']['lastName']
	 entete("#{name}- My Resume",0, true)

#output #file['education'].each { |school| jj school }

#############################################################################
#############################################################################
=begin
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

      file['education'].each  do |school|
        row :color => 'green', :bold => true do
          column school['institution']
          column school['area']
          column (school['endDate']).split("-").first
        end
      end#end of do

    end#of the table
=end
#############################################################################
#############################################################################
=begin
jj file['work']
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
        column 'Ruby doc: In Ruby read json file to hash can be achieved '
      end
  	end#end 3.times
    end#of the table for Experience

=end
#############################################################################
#############################################################################
=begin
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
        column 'Ruby doc: In Ruby read json file to hash can be achieved '
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
=end

  end



end#end Resume


class Fichier
  attr_accessor :data

  def initialize(file = "resume.json")
  begin
    @data = JSON.parse(File.read(file))
  rescue Exception => e  
    raise e, "file not, found"
  end#begin

  end

  def get_data
    @data
  end

  def prepare_resume
    #from optparse lib; have been test
    options = OpenStruct.new({:quiet => false})

    OptionParser.new do |opts|
      opts.banner = "Usage: ruby -I lib example/quiet.rb [-q|--quiet]"

      opts.on('-q', '--quiet', 'do not print any output') do
        options.quiet = true
      end
    end.parse!

    Resume.new.run(options, @data)
  end
end


file = Fichier.new("resume.json")
file.prepare_resume






#horizontal_rule :color => 'red', :bold => true, :char => "<"
