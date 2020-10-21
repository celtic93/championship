# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

milan = Team.create(name: 'Milan')
inter = Team.create(name: 'Inter')

zlatan = Player.create(name: 'Zlatan Ibrahimović', team: milan)
rebic = Player.create(name: 'Ante Rebić', team: milan)
theo = Player.create(name: 'Theo Hernandez', team: milan)

lukaku = Player.create(name: 'Romelu Lukaku', team: inter)
alexis = Player.create(name: 'Alexis Sánchez', team: inter)
eriksen = Player.create(name: 'Christian Eriksen', team: inter)

achievement1 = Achievement.create(title: 'пробежал 10+ км')
achievement2 = Achievement.create(title: 'сделал 70+ % точных передач')

game1 = Game.create(home_team: milan, guest_team: inter)
game2 = Game.create(home_team: inter, guest_team: milan)
game3 = Game.create(home_team: milan, guest_team: inter)

game_achievement1 = GameAchievement.create(achievement: achievement1,
                                           player: zlatan,
                                           game: game1)
game_achievement2 = GameAchievement.create(achievement: achievement2,
                                           player: zlatan,
                                           game: game2)
game_achievement3 = GameAchievement.create(achievement: achievement1,
                                           player: rebic,
                                           game: game3)
game_achievement4 = GameAchievement.create(achievement: achievement2,
                                           player: theo,
                                           game: game1)
game_achievement5 = GameAchievement.create(achievement: achievement1,
                                           player: lukaku,
                                           game: game2)
game_achievement6 = GameAchievement.create(achievement: achievement2,
                                           player: alexis,
                                           game: game1)
game_achievement7 = GameAchievement.create(achievement: achievement1,
                                           player: eriksen,
                                           game: game2)
