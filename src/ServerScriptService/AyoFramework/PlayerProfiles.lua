local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");

local ProfileStore = require(ReplicatedStorage.Packages.ProfileStore);

local PLAYER_DATA_TEMPLATE = {
	Stats = {
		Coins = 100;
		Playtime = 0;
		JoinTime = nil;
	};
	UnlockedItems = {};
	CharactersMade = {};
};

local PlayerStore = ProfileStore.New("PlayerStore", PLAYER_DATA_TEMPLATE);
local Profiles: {[Player]: typeof(PlayerStore:StartSessionAsync())} = {};

local function PlayerAdded(player:Player)

	local profile = PlayerStore:StartSessionAsync(`{player.UserId}`, {
		Cancel = function()
			return not player:IsDescendantOf(Players);
		end;
	});
	if profile == nil then 
		player:Kick(`Failed to load profile - Please rejoin`);
	end
	profile:AddUserId(player.UserId); 
	profile:Reconcile();
	profile.OnSessionEnd:Connect(function()
		Profiles[player] = nil;
		player:Kick(`Profile session ended - Please rejoin`);
	end);

	if player.Parent == Players then
		Profiles[player] = profile;
		print(`Profile loaded for {player.DisplayName}!`);
		profile.Data.Stats.JoinTime = os.time();
	else
		profile:EndSession();
	end
end

local function PlayerRemoving(player:Player)
    local profile = Profiles[player];
	if profile == nil then return; end
	profile.Data.Stats.Playtime = os.time() - profile.Data.Stats.JoinTime;
	profile:EndSession();
end

Players.PlayerAdded:Connect(PlayerAdded);
Players.PlayerRemoving:Connect(PlayerRemoving);

for _, player in Players:GetPlayers() do
	task.spawn(PlayerAdded, player);
end

game:BindToClose(function()
    for _, player in Players:getPlayers() do
        task.spawn(PlayerRemoving,player);
    end
end);

return Profiles;