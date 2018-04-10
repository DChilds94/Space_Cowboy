require("pry-byebug")
require_relative("../models/space_cowboys.rb")

cowboy1 = SpaceCowboy.new({
    "name" => "Spike Spiegel",
    "favourite_weapoon" => "Jericho 941 R.",
    "last_known_location" => "Titan",
    "bounty_value" => 5000
  })

  cowboy2 = SpaceCowboy.new({
    "name" => "Jet Black",
    "favourite_weapon" => "Walter P99",
    "last_known_location" => "Casino in Space",
    "bounty_value" => 2000,
    })

  cowboy3 = SpaceCowboy.new({
    "name" => "Faye Valentine",
    "favourite_weapon" => "Glock 30",
    "last_known_location" => "Cyrogenic lab facility",
    "bounty_value" => 1000000000
    })

binding.pry
nil
