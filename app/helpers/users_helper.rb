module UsersHelper
  def take_ride
    if current_user.tickets < @attraction.tickets && current_user.height < @attraction.min_height
      flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif current_user.tickets < @attraction.tickets
      flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif current_user.height < @attraction.min_height
      flash[:message] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      user = current_user
      user.tickets = user.tickets - @attraction.tickets
      user.nausea = user.nausea + @attraction.nausea_rating
      user.happiness = user.happiness + @attraction.happiness_rating
      user.save
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
    end
  end

end
