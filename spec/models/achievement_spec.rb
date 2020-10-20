require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should have_many :game_achievements }

  it { should validate_presence_of :title }
end
