# require_relative "user_script.rb"
# Def directory
class NonConvertibleString < StandardError
  def message
    "Please insert an integer in quotations, not a string."
  end
end
class RecievedCoffeeError < StandardError
  def message
    "Hmmm Coffee! But I want a fruit!!!"
  end
end
class BadFriendError < StandardError
  def message
    "Your not my best FRIEND!!!"
  end
end

class BestFriendDescriptiveError < StandardError
  def message
    "Hey you can't remember what I like?"
  end
end

def get_prompt
  prompt = gets.chomp
  # raise error unless integer.

  raise NonConvertibleString unless prompt.to_i.is_a?(Integer)
end


# PHASE 2
def convert_to_int(str)
  puts "Feed me your integers: \n"


begin
  get_prompt
  Integer(str)
rescue NonConvertibleString => e
  puts e.message
  puts "Try again."
  retry
end


end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)

    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    elsif maybe_fruit == "coffee"
      raise RecievedCoffeeError
    else
      raise StandardError
    end

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue RecievedCoffeeError => e
    puts e.message
    puts "Give the little monster a fruit"
    retry
  end
end

# PHASE 4
class BestFriend


  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    begin
      check_if_best_friend
    rescue BadFriendError => e
      puts e.message
    ensure
      puts "Pablo is my bestfriend friend"
      self.yrs_known = 5
    end

    begin
      remember_me?
    rescue BestFriendDescriptiveError => e
      puts e.message

    ensure
      self.name  = "Danny"
      self.fav_pastime = "Programing"
    end
    # private
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
  protected
  # attr_accessor
  attr_accessor :name, :yrs_known, :fav_pastime

  def check_if_best_friend
    raise BadFriendError if self.yrs_known < 5
  end
  def remember_me?
    raise BestFriendDescriptiveError if self.name || self.fav_pastime
  end
end
