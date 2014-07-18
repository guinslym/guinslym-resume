require "json"
require 'command_line_reporter'


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
end