# b_deathscreen

# Installation
Um das Script benutzen zu können, müssen einige Änderung am esx_ambulancejob getätigt werden!

1. Öffne die Datei esx_ambulancejob/client/main.lua

2. Suche folgendes in der Datei: `function RemoveItemsAfterRPDeath()` und füge folgendes hinzu:

```lua
AddEventHandler("b_deathscreen:removeItemsAfterRPDeath", function()
	RemoveItemsAfterRPDeath()
end)

function RemoveItemsAfterRPDeath()
....
....
....

```


3. Suche nach "function OnPlayerDeath()" und kommentiere folgendes aus (mit 2 mal --):

```lua

function OnPlayerDeath()
	isDead = true
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)

	-- StartDeathTimer() DAS HIER AUSKOMMENTIEREN
	-- StartDistressSignal() DAS HIER AUSKOMMENTIEREN

	AnimpostfxPlay('DeathFailOut', 0, false)
end
```
