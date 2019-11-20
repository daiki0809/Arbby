class HomesController < ApplicationController
  def top
  end

  def about
  end

  def gacha
  	@hobby = Hobby.find(Hobby.pluck(:id).shuffle[0])

  	case @hobby.hobby_point
  	when 1,2
  		@rare = 1
  	when 3,4
  		@rare = 2
  	when 5,6
  		@rare = 3
  	when 7,8
  		@rare = 4
  	else
  		@rare = 5
  	end
  end
end
