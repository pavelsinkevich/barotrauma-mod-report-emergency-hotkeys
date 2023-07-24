Hook.Add("keyUpdate", "reportemergencyhotkeys", function (keyargs)
	if Character.Controlled == nil or Character.Controlled.Inventory == nil then return end

    if PlayerInput.KeyHit(Keys.D1) and PlayerInput.IsAltDown() then 
		-- report flooding
		local orderPrefab = OrderPrefab.Prefabs['reportbreach']
		local hull = Character.Controlled.CurrentHull
		local newOrder = Order(orderPrefab, hull, nil, Character.Controlled)
		Game.GameSession.CrewManager.SetCharacterOrder(Character.Controlled, newOrder)
	elseif PlayerInput.KeyHit(Keys.D2) and PlayerInput.IsAltDown() then 
		-- report broken devices
		local orderPrefab = OrderPrefab.Prefabs['reportbrokendevices']
		local hull = Character.Controlled.CurrentHull
		local newOrder = Order(orderPrefab, hull, nil, Character.Controlled)
		Game.GameSession.CrewManager.SetCharacterOrder(Character.Controlled, newOrder)		
	elseif PlayerInput.KeyHit(Keys.D3) and PlayerInput.IsAltDown() then 
		-- report fire 
		local orderPrefab = OrderPrefab.Prefabs['reportfire']
		local hull = Character.Controlled.CurrentHull
		local newOrder = Order(orderPrefab, hull, nil, Character.Controlled)
		Game.GameSession.CrewManager.SetCharacterOrder(Character.Controlled, newOrder)	
	elseif PlayerInput.KeyHit(Keys.D4) and PlayerInput.IsAltDown() then 
		-- report intruders
		local orderPrefab = OrderPrefab.Prefabs['reportintruders']
		local hull = Character.Controlled.CurrentHull
		local newOrder = Order(orderPrefab, hull, nil, Character.Controlled)
		Game.GameSession.CrewManager.SetCharacterOrder(Character.Controlled, newOrder)
	elseif PlayerInput.KeyHit(Keys.D5) and PlayerInput.IsAltDown() then 
		-- report medical emergency 
		local orderPrefab = OrderPrefab.Prefabs['requestfirstaid']
		local hull = Character.Controlled.CurrentHull
		local newOrder = Order(orderPrefab, hull, nil, Character.Controlled)
		Game.GameSession.CrewManager.SetCharacterOrder(Character.Controlled, newOrder)
	end	
end)