require "json"

class Resume
  attr_accessor :name, :tel, :email, :experience, :education
  
  def initialize(data)
    bio = data['bio']
    @name = bio['firstName'] + ' ' + bio['lastName']
    @tel = bio['phone']
    @email = bio['email']
    @experience = data['work']
    @education = data['education']
  end

end

