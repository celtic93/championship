require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should have_many :game_achievements }
  it { should belong_to :team }

  it { should validate_presence_of :name }
end
