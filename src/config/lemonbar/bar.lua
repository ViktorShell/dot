local function runp(command)
	local handle = io.popen(command)

	if handle == nil then
		return "-"
	end

	local result = handle:read("*a")
	handle:close()
	return result
end

function sleep(n)
	os.execute("sleep " .. tonumber(n))
end

local function strips(stringmatch)
	return string.gsub(stringmatch, "\n", "")
end

-- Left Module
local function workspace()
	-- Query dei workspace
	local focused = runp("bspc query -D -d focused --names")
	local occupied = runp("bspc query -D -d .occupied --names")

	local ws = {}
	for i = 1, 5 do
		ws[i] = "free"
	end

	for oc in string.gmatch(occupied, "%d+") do
		ws[tonumber(oc)] = "ocp"
	end

	local foc_p = focused
	ws[tonumber(foc_p)] = "foc"

	-- Formattazione dei workspace
	local ws_out = ""
	for key, value in ipairs(ws) do
		if value == "foc" then
			ws_out = ws_out .. "%{B#F07178}"
			ws_out = ws_out .. " " .. key .. " " .. "%{B-}"
		elseif value == "ocp" then
			ws_out = ws_out .. "%{B#202020}"
			ws_out = ws_out .. " " .. key .. " " .. "%{B-}"
		else
			ws_out = ws_out .. " " .. key .. " "
		end
	end

	return "%{l}" .. ws_out
end

-- Center Module
local function date_time()
	local time = strips(runp('date "+%H:%M"'))
	local date = strips(runp('date "+%d.%m"'))
	local dt_out = "%{c}" .. time .. " " .. date
	return dt_out
end

-- Right Module
local function bat()
	local bat_state = strips(runp("acpi -b | awk '{print $3}' | sed 's/,//'"))
	local bat_value = strips(runp("acpi -b | awk '{print $4}' | sed 's/%,//'"))

	local symb = "%{B#F07178}"
	if bat_state == "Discharging" then
		symb = symb .. "  "
	else
		symb = symb .. "  "
	end
	return symb .. "%{B-}" .. " " .. bat_value .. "% "
end

local function net()
	local net_stat = strips(runp("nmcli dev | grep '^wlo1' | awk '{print $3}'"))
	local symb = "  "
	local net_name = "..."
	if net_stat == "connected" then
		symb = "  "
		net_name = strips(runp("nmcli dev | grep '^wlo1' | awk '{print $4}'"))
	end

	return "%{B#F07178}" .. symb .. "%{B-}" .. " " .. net_name .. " "
end

local function audio()
	local audio_mute = strips(runp("pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'"), "\n")
	local mic_mute = strips(runp("pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}'"), "\n")
	local audio_sym = "  "
	local mic_sym = "  "
	local audio_stat = "-"

	if mic_mute == "yes" then
		mic_sym = "  "
	end

	if audio_mute == "yes" then
		audio_sym = "  "
	else
		audio_stat = strips(runp("pactl get-sink-volume @DEFAULT_SINK@  | awk '{print $5}'"), "\n")
	end

	return "%{B#F07178}" .. mic_sym .. "|" .. audio_sym .. "%{B-}" .. " " .. audio_stat .. " "
end

local function light()
	local light_val = strips(runp("light -G | cut -d '.' -f 1"), "\n")
	local light_sym = "  "
	return "%{B#F07178}" .. light_sym .. "%{B-} " .. light_val .. "%" .. " "
end

local module = workspace()
module = module .. date_time()
module = module .. "%{r}"
module = module .. light()
module = module .. audio()
module = module .. net()
module = module .. bat()

print(module)
