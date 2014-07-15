require "json"
require 'command_line_reporter'

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

