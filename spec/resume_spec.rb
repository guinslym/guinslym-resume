require "spec_helper"
require_relative "../lib/resume"

require "json"
class Resume
  attr_accessor :name, :tel, :email, :experience, :education, :company
  
  def initialize
  #  file = File.read("resume.json")
  end

end

describe Resume do 

  before :each do
    @resume = Resume.new 
  end

  it "#Resume" do
     expect(@resume).to be_an_instance_of(Resume)
  end
  
  it "response to attribute" do
    expect(@resume).to respond_to(:name)
    expect(@resume).to respond_to(:tel)
    expect(@resume).to respond_to(:email)
    expect(@resume).to respond_to(:experience)
    expect(@resume).to respond_to(:education)
    expect(@resume).to respond_to(:company)
  end
  it ".load_file" do

  end

end
