require "spec_helper"
require_relative "../lib/resume"


describe Resume do 

  before :each do
    #file = File.read(File.expand_path("resume.json", __FILE__))
    file = File.read("./resume.json")
    data = JSON.parse(file)
    @resume = Resume.new(data)
  end

  it "#Resume" do
     #expect(@resume).to be_an_instance_of(Resume)
  end
  
  it "response to attribute" do
    #expect(@resume).to respond_to(:name)
    #expect(@resume).to respond_to(:tel)
    #expect(@resume).to respond_to(:email)
    #expect(@resume).to respond_to(:experience)
    #expect(@resume).to respond_to(:education)
    #expect(@resume).to respond_to(:company)
  end
  it "name should be my name" do
    #expect(@resume.name).to eq("Guinsly Mondésir")
  end

end
