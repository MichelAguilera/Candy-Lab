-- Generic Dependencies
local sm  = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("ServiceManager"))

-- Specific Dependencies
local default = require(sm.SSS:WaitForChild("StartingDefaults"))


-- Business Class
Business = {}
Business._index = Business

function Business.init(saved_data_address, Player)
    local self = setmetatable({}, Business)

    if not saved_data_address then
        print("No saved data, creating new tables for "..Player.Name)
        self.RealEstate = default["RealEstate"]
        self.Production = default["Production"]
        self.Technology = default["Technology"]
        self.Relations  = default["Relations"]
    else
        print("Saved data found for "..Player.Name)
        self.RealEstate = saved_data_address["RealEstate"]
        self.Production = saved_data_address["Production"]
        self.Technology = saved_data_address["Technology"]
        self.Relations  = saved_data_address["Relations"]
    end

    return self
end

function Business:start_new(saved_data_address, Player)

    -- Delete saved_data_address for player
    return Business.init(saved_data_address, Player)

end

return Business