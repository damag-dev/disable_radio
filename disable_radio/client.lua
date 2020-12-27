
ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            if IsPedInAnyVehicle(PlayerPedId()) then
                SetUserRadioControlEnabled(false)
                if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
                end
        end
    end
end)