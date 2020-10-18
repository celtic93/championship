class GameSerializer < ActiveModel::Serializer
  attributes :id, :title

  def title
    "#{object.home_team.name} : #{object.guest_team.name}"
  end
end