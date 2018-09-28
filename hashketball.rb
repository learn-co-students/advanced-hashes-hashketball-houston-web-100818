require 'pry'

def game_hash
    game_hash = {
        home: {
            team_name:"Brooklyn Nets",
            colors:["Black", "White"],
            players: {
                "Alan Anderson" => {
                    number: 0,
                    shoe: 16,
                    points: 22,
                    rebounds: 12,
                    assists: 12,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 1
                },
                "Reggie Evans" => {
                    number: 30,
                    shoe: 14,
                    points: 12,
                    rebounds: 12,
                    assists: 12,
                    steals: 12,
                    blocks: 12,
                    slam_dunks: 7
                },
                "Brook Lopez" => {
                    number: 11,
                    shoe: 17,
                    points: 17,
                    rebounds: 19,
                    assists: 10,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 15
                },
                "Mason Plumlee" => {
                    number: 1,
                    shoe: 19,
                    points: 26,
                    rebounds: 12,
                    assists: 6,
                    steals: 3,
                    blocks: 8,
                    slam_dunks: 5
                },
                "Jason Terry" => {
                    number: 31,
                    shoe: 15,
                    points: 19,
                    rebounds: 2,
                    assists: 2,
                    steals: 4,
                    blocks: 11,
                    slam_dunks: 1,
                }
            }
        },
        away: {
            team_name:"Charlotte Hornets",
            colors:["Turquoise", "Purple"],
            players: {
                "Jeff Adrien" => {
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2,
                },
                "Bismak Biyombo" => {
                    number: 0,
                    shoe: 16,
                    points: 12,
                    rebounds: 4,
                    assists: 7,
                    steals: 7,
                    blocks: 15,
                    slam_dunks: 10
                },
                "DeSagna Diop" => {
                    number: 2,
                    shoe: 14,
                    points: 24,
                    rebounds: 12,
                    assists: 12,
                    steals: 4,
                    blocks: 5,
                    slam_dunks: 5
                },
                "Ben Gordon" => {
                    number: 8,
                    shoe: 15,
                    points: 33,
                    rebounds: 3,
                    assists: 2,
                    steals: 1,
                    blocks: 1,
                    slam_dunks: 0
                },
                "Brendan Haywood" => {
                    number: 33,
                    shoe: 15,
                    points: 6,
                    rebounds: 12,
                    assists: 12,
                    steals: 22,
                    blocks: 5,
                    slam_dunks: 12
                }                 
            }
        }
    }
end

def num_points_scored(name)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player_name,stat|
                    if player_name == name
                        return data[player_name][:points]
                    end
                end
            end
        end
    end
end

def shoe_size(name)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player_name,stat|
                    if player_name == name
                        return data[player_name][:shoe]
                    end
                end
            end
        end
    end
end

def team_colors(name)
    game_hash.each do |location, team_data|
        if game_hash[location][:team_name] == name
            return game_hash[location][:colors]
        end        
    end            
end

def team_names
    names_of_teams = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute,data|
            if attribute == :team_name
                names_of_teams << data
            end
        end
        end
    names_of_teams
end

def player_numbers(team)
    numbers_array = []
    game_hash.each do |location, team_data|
        if game_hash[location][:team_name] == team
            team_data.each do |attribute, data|
                if attribute == :players
                    data.each do |name, stat|
                        stat.each do |key, value|
                            if key == :number
                                numbers_array << value
                            end
                        end
                    end
                end
            end
        end
    end
    numbers_array
end

def player_stats(name)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player_name, stat|
                    if player_name == name
                        return stat
                    end
                end
            end
        end
    end
end

def big_shoe_rebounds
    
    big_shoes = 0
    big_shoe_owner = ""

    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player_name, stat|
                    stat.each do |key, value|
                        if key == :shoe
                            if value > big_shoes
                                big_shoe_owner = player_name    
                            end                            
                        end    
                        if key == :rebounds
                            return value 
                        end
                    end
                end
            end
        end
    end
end

#big_shoe_rebounds