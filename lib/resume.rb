require "json"
require 'command_line_reporter'



class Fichier
  attr_accessor :data
  def initialize(file = "resume.json")
  
  @data = JSON.parse(File.read(file))
  #puts data = data['bio']['firstName']
  end

  def get_data
    @data
  end
end

class Resume
  include CommandLineReporter
  attr_accessor :name, :tel, :email, :experience, :education
  
  def initialize(data)
  	self.formatter = 'progress'
    bio = data['bio']
    @name = bio['firstName'] + ' ' + bio['lastName']
    @tel = bio['phone']
    @email = bio['email']
    @experience = data['work']
    @education = data['education']
  end

end

=begin dans le fichier resume.json data contient ces champs
bio
work
education
awards
publications
skills
references
=end

