class Member < ActiveRecord::Base
  validates_presence_of :name

  def self.pick_a_winner
    order(Rails.env.eql?("development")? "RANDOM()" : "RAND()").first
  end
end
