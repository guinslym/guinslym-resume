require "./lib/resume"


#resume.json was build with npm-resume
file = File.read("resume.json")
#file = File.read(File.expand_path("./lib/resume.json", __FILE__))
data = JSON.parse(file)
resume = Resume.new(data)
puts data["work"]

=begin
bio
work
education
awards
publications
skills
references
=end
