AddCSLuaFile()

local name = "Volvo S60 R Police"

local function MirrorVector(vec)
	local newVector = Vector()
	newVector:Set(vec)
	newVector.x = vec.x * -1
	return newVector
end

local function MirrorAngle(ang, method)
	local newAng = Angle()
	if method == nil then
		newAng:Set( ang )
		newAng.p = ang.p * -1
		newAng.r = ang.r * -1
		local yAngDif = -90 - ang.y
		newAng.y = ang.y + ( yAngDif * 2 )
	elseif method == "opp" then
		newAng:Set( ang )
		newAng.p = ang.p * -1
		newAng.y = ang.y * -1
	end
	return newAng
end

local A = "AMBER"
local R = "RED"
local DR = "D_RED"
local B = "BLUE"
local W = "WHITE"
local CW = "C_WHITE"
local SW = "S_WHITE"

local EMV = {}

EMV.Siren = 5
EMV.Skin = 1
EMV.Color = nil

EMV.BodyGroups = {
	{1, 0},
	{2, 0},
	{3, 1},
	{4, 0},
	{5, 0}
}

EMV.Meta = {
	grill = {
		AngleOffset = -90,
		W = 6,
		H = 6,
		Sprite = "sprites/emv/lw_volvo_s60_frontled"
	}
}

EMV.Positions = {
	{Vector(10, 120, 30), Angle(0, 0, 0), "grill"},
	{Vector(-10, 120, 30), Angle(0, 0, 0), "grill"}
}

EMV.Sections = {
	grill = {
		{{1, B}, {2, B}},
		{{1, B}},
		{{2, B}}
	}
}

EMV.Patterns = {
	grill = {
		s1 = {1, 0, 1, 0, 0, 0},
		s2 = {2, 2, 2, 0, 0, 3, 3, 3, 0, 0},
		s3 = {2, 0, 2, 0, 3, 0, 3, 0}
	}
}

EMV.Sequences = {
	Sequences = {
		{
			Name = "Stage 1",
			Stage = "M1",
			Components = {
				grill = "s1"
			}
		}
	}
}

EMV.Configuration = true

Photon.EMVLibrary[name] = EMV
if EMVU then EMVU:OverwriteIndex(name, EMV) end
