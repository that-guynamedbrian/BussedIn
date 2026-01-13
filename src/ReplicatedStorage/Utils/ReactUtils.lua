local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactUtils = {}

function ReactUtils.useToggleState(default:boolean): {
	on: boolean,
	enable: () -> (),
	disable: () -> (),
	toggle: () -> (),
}
	local toggled, setToggled = React.useState(default)

	local enable = React.useCallback(function()
		setToggled(true)
	end, {})

	local disable = React.useCallback(function()
		setToggled(false)
	end, {})

	local toggle = React.useCallback(function()
		setToggled(function(currentToggled)
			return not currentToggled
		end)
	end, {})

	return {
		on = toggled,
		enable = enable,
		disable = disable,
		toggle = toggle,
	}
end

function ReactUtils.useEventConnection(
	event: RBXScriptSignal,
	callback: (...any) -> (),
	dependencies: { any }
)
	local cachedCallback = React.useMemo(function()
		return callback
	end, dependencies)

	React.useEffect(function()
		local connection = event:Connect(cachedCallback)

		return function()
			connection:Disconnect()
		end
	end, { event, cachedCallback } :: {any})
end

return ReactUtils