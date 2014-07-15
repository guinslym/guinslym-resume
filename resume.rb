require "./lib/resume"


file = File.read("./lib/resume.json")
data = JSON.parse(file)
resume = Resume.new(data)
puts resume.name
