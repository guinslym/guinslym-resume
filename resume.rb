require "./lib/resume"


#resume.json was build with npm-resume
file = File.read("./lib/resume.json")
#file = File.read(File.expand_path("./lib/resume.json", __FILE__))
data = JSON.parse(file)
resume = Resume.new(data)
puts resume.name
