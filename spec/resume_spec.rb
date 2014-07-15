require "spec_helper"
require_relative "../lib/resume"

require "json"
class Resume
  attr_accessor :name, :tel, :email, :experience, :education, :company
  

end

describe Resume do 

  before :each do
    @resume = Resume.new 
  end

  it "#Resume" do
     expect(@resume).to be_an_instance_of(Resume)
  end
  it ".load_file" do

  end

end
