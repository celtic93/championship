require 'rails_helper'

RSpec.describe GameAchievement, type: :model do
  it { should belong_to :achievement }
  it { should belong_to :game }
  it { should belong_to :player }
end
