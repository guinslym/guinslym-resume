require "json"

class Resume
  attr_accessor :name, :tel, :email, :experience, :education, :company
  
  def initialize(data)
    data = data.first.last
    @name = data['firstName'] + ' ' + data['lastName']
  end

end


