class Bet < ActiveRecord::Base
    belongs_to :user
    belongs_to :user_two, :class_name => 'User'
    belongs_to :game
end
