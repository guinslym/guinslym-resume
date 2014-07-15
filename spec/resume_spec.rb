require "spec_helper"
require_relative "../lib/resume"


describe Resume do 

  before :each do
    file = File.read("./resume.json")
    data = JSON.parse(file)
    @resume = Resume.new(data)
  end

  it "#Resume" do
     expect(@resume).to be_an_instance_of(Resume)
  end
  
  it "should respond to its attributes" do
    expect(@resume).to respond_to(:name)
    expect(@resume).to respond_to(:tel)
    expect(@resume).to respond_to(:email)
    expect(@resume).to respond_to(:experience)
    expect(@resume).to respond_to(:education)
  end
  it "attributes should not be nil" do
    expect(@resume.name).not_to be_nil
    expect(@resume.tel.size).not_to be_nil
    expect(@resume.experience.size).not_to be_nil
    expect(@resume.email.size).not_to be_nil
    expect(@resume.education.size).not_to be_nil
  end

end
