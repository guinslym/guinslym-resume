require "spec_helper"
require "json"
require 'command_line_reporter'
require 'ostruct'
require 'optparse'
#require_relative "../lib/resume"



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

describe Fichier do 

  context "file not found" do
    let(:file) { Fichier.new("resume.json")}
    let(:bad_name) {Fichier.new("bad_name.json")}
    it "should not raise error with the right file name" do
      expect { file }.to_not raise_error
    end
    it "should raise an error if the file couldn't be found" do
      expect { bad_name }.to raise_error ("file not, found")
    end#it raise error
  end#context
  context "File Content" do
    let(:file) { Fichier.new("resume.json").get_data }
    it "should not be nil " do
      expect(file).not_to be_nil
    end
  end
end#describe Fichier
