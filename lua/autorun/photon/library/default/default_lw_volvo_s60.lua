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

local B = "BLUE"
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
		W = 11.2,
		H = 6.7,
		Sprite = "sprites/emv/lw_volvo_s60_frontled"
	},
	hl_left = {
		AngleOffset = -90,
		W = 13.5,
		H = 13.5,
		Sprite = "sprites/emv/lw_volvo_s60_headlight_left"
	},

	lightbar_f = {
		AngleOffset = -90,
		W = 6.3,
		H = 5.2,
		Sprite = "sprites/emv/lw_volvo_s60_topled"
	},
	lightbar_r = {
		AngleOffset = 90,
		W = 6.3,
		H = 5.2,
		Sprite = "sprites/emv/lw_volvo_s60_topled"
	},
	lightbar_s = {
		AngleOffset = -90,
		W = 5.1,
		H = 5.2,
		Sprite = "sprites/emv/lw_volvo_s60_topled"
	},

	rear_main = {
		AngleOffset = 90,
		W = 12.9,
		H = 14.6,
		Sprite = "sprites/emv/lw_volvo_s60_frontled",
		Scale = 1,
	},
	rear_reflector = {
		AngleOffset = 90,
		W = 14,
		H = 1.5,
		Sprite = "sprites/emv/lw_volvo_s60_frontled",
		Scale = 1,
	},
}

EMV.Lamps = {
	["alley"] = {
		Color = Color(215, 225, 255, 255),
		Texture = "effects/flashlight001",
		Near = 110,
		FOV = 90,
		Distance = 500,
	},
	["tkdn"] = {
		Color = Color(215, 225, 255, 255),
		Texture = "effects/flashlight001",
		Near = 120,
		FOV = 135,
		Distance = 800,
	}
}

EMV.PosMap = {
	Grill = {Vector(9.45, 114.8, 44.57), Angle(0, -6.05, 5)},
	Headlight = {Vector(31, 107.1, 44.57), Angle(0, -10, 2)},
	Lightbar = {
		{Vector(3.68, -7.88, 87.29), Angle(0, 0, 0)},
		{Vector(11.3, -8.76, 87.31), Angle(0, 0, 0)},
		{Vector(18.9, -8.76, 87.31), Angle(0, 0, 0)},
		{Vector(26.3, -9.93, 87.31), Angle(0, -19, 0)},
		{Vector(31.3, -14.92, 87.31), Angle(0, -90, 0)},
		{Vector(3.68, -22.08, 87.29), Angle(0, 180, 0)},
		{Vector(11.3, -21.16, 87.31), Angle(0, 180, 0)},
		{Vector(18.9, -21.16, 87.31), Angle(0, 180, 0)},
		{Vector(26.3, -19.93, 87.31), Angle(0, 199, 0)},
	},
	Rear = {
		{Vector(8.3, -84.2, 66.5), Angle(0, 0, -3)},
		{Vector(8.3, -83.9, 68.7), Angle(0, 0, -3)}
	}
}

EMV.Positions = {
	{EMV.PosMap.Grill[1], EMV.PosMap.Grill[2], "grill"},
	{MirrorVector(EMV.PosMap.Grill[1]), MirrorAngle(EMV.PosMap.Grill[2], "opp"), "grill"},

	{EMV.PosMap.Headlight[1], EMV.PosMap.Headlight[2], "hl_left"},
	{MirrorVector(EMV.PosMap.Headlight[1]), MirrorAngle(EMV.PosMap.Headlight[2], "opp"), "hl_left"},

	-- Lightbar Forward Central White Node
	{EMV.PosMap.Lightbar[1][1], EMV.PosMap.Lightbar[1][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[1][1]), MirrorAngle(EMV.PosMap.Lightbar[1][2], "opp"), "lightbar_f"},

	-- Main Bar
	{EMV.PosMap.Lightbar[2][1], EMV.PosMap.Lightbar[2][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[2][1]), MirrorAngle(EMV.PosMap.Lightbar[2][2], "opp"), "lightbar_f"},
	{EMV.PosMap.Lightbar[3][1], EMV.PosMap.Lightbar[3][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[3][1]), MirrorAngle(EMV.PosMap.Lightbar[3][2], "opp"), "lightbar_f"},
	{EMV.PosMap.Lightbar[4][1], EMV.PosMap.Lightbar[4][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[4][1]), MirrorAngle(EMV.PosMap.Lightbar[4][2], "opp"), "lightbar_f"},

	-- Side
	{EMV.PosMap.Lightbar[5][1], EMV.PosMap.Lightbar[5][2], "lightbar_s"},
	{MirrorVector(EMV.PosMap.Lightbar[5][1]), MirrorAngle(EMV.PosMap.Lightbar[5][2], "opp"), "lightbar_s"},

	-- Rear Bar White Node
	{EMV.PosMap.Lightbar[6][1], EMV.PosMap.Lightbar[6][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[6][1]), MirrorAngle(EMV.PosMap.Lightbar[6][2], "opp"), "lightbar_f"},

	-- Rear Bar
	{EMV.PosMap.Lightbar[7][1], EMV.PosMap.Lightbar[7][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[7][1]), MirrorAngle(EMV.PosMap.Lightbar[7][2], "opp"), "lightbar_f"},
	{EMV.PosMap.Lightbar[8][1], EMV.PosMap.Lightbar[8][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[8][1]), MirrorAngle(EMV.PosMap.Lightbar[8][2], "opp"), "lightbar_f"},
	{EMV.PosMap.Lightbar[9][1], EMV.PosMap.Lightbar[9][2], "lightbar_f"},
	{MirrorVector(EMV.PosMap.Lightbar[9][1]), MirrorAngle(EMV.PosMap.Lightbar[9][2], "opp"), "lightbar_f"},

	-- Rear Window LEDs
	{EMV.PosMap.Rear[1][1], EMV.PosMap.Rear[1][2], "rear_main"},
	{MirrorVector(EMV.PosMap.Rear[1][1]), MirrorAngle(EMV.PosMap.Rear[1][2], "opp"), "rear_main"},

	{EMV.PosMap.Rear[2][1], EMV.PosMap.Rear[2][2], "rear_reflector"},
	{MirrorVector(EMV.PosMap.Rear[2][1]), MirrorAngle(EMV.PosMap.Rear[2][2], "opp"), "rear_reflector"}
}

EMV.Sections = {
	grill = {
		{{1, B}, {2, B}},
		{{1, B}},
		{{2, B}}
	},
	headlights = {
		{{3, SW}, {4, SW}},
		{{3, SW, {16, 0.3, 0}}, {4, SW, {16, 0.3, 6}}}
	},
	lightbar_f_tkdn = {
		{{5, CW}, {6, CW}},
		{{5, CW}},
		{{6, CW}}
	},
	lightbar_f = {
		{{7, B}, {8, B}, {9, B}, {10, B}, {11, B}, {12, B}},
		{{7, B}, {9, B}, {11, B}},
		{{8, B}, {10, B}, {12, B}},
	},
	lightbar_s = {
		{{13, CW}, {14, CW}},
		{{13, CW}},
		{{14, CW}}
	},
	lightbar_r = {
		{{15, CW}, {16, CW}, {17, B}, {18, B}, {19, B}, {20, B}, {21, B}, {22, B}},
		{{17, B}, {19, B}, {21, B}},
		{{18, B}, {20, B}, {22, B}},
		{{15, CW}, {17, B}, {20, B}, {22, B}},
		{{16, CW}, {18, B}, {19, B}, {21, B}}
	},
	rear = {
		{{23, B}, {24, B}, {25, B}, {26, B}},
		{{23, B}},
		{{24, B}},
		{{23, B}, {25, B}},
		{{24, B}, {26, B}},
		{{25, B}},
		{{26, B}}
	}
}

EMV.Patterns = {
	grill = {
		off = {0},
		M1 = {1, 0, 1, 0, 0, 0, 0, 0},
		M2 = {2, 2, 2, 0, 0, 3, 3, 3, 0, 0},
		M3 = {2, 0, 2, 0, 3, 0, 3, 0}
	},
	headlights = {
		off = {0},
		wigwag = {2}
	},
	lightbar_f = {
		off = {0},
		M1 = {2, 2, 2, 2, 3, 3, 3, 3},
		M2 = {2, 0, 2, 0, 3, 0, 3, 0},
		M3 = {2, 0, 3, 0}
	},
	lightbar_r = {
		off = {0},
		M1 = {2, 2, 2, 2, 3, 3, 3, 3},
		M2 = {2, 0, 2, 0, 3, 0, 3, 0},
		M3 = {4, 0, 4, 0, 5, 0, 5, 0}
	},
	lightbar_f_tkdn = {
		off = {0},
		M1 = {0},
		M2 = {0},
		M3 = {2, 2, 2, 3, 3, 3},
		on = {1}
	},
	lightbar_s = {
		off = {0},
		M1 = {0},
		M2 = {0},
		M3 = {0},
		left = {1},
		right = {2}
	},
	rear = {
		off = {0},
		M1 = {2, 2, 2, 2, 2, 3, 3, 3, 3, 3},
		M2 = {4, 4, 4, 5, 5, 5},
		M3 = {
			4, 6, {2, 7}, 7,
			{3, 6}, 6, 5, 7
		}
	}
}

EMV.Sequences = {
	Sequences = {
		{
			Name = "Stage 1",
			Stage = "M1",
			Components = {
				headlights = "wigwag",
				rear = "M1"
			},
			BG_Components = {
				grill = {
					["0"] = {
						grill = "M1",
					}
				},
				lightbar = {
					["0"] = {
						lightbar_f = "M1",
						lightbar_f_tkdn = "M1",
						lightbar_r = "M1",
					},
					["1"] = {
						lightbar_f = "M1",
						lightbar_f_tkdn = "M1",
						lightbar_r = "M1",
					},
				},
			}
		}, {
			Name = "Stage 2",
			Stage = "M2",
			Components = {
				headlights = "wigwag",
				rear = "M2"
			},
			BG_Components = {
				grill = {
					["0"] = {
						grill = "M2",
					}
				},
				lightbar = {
					["0"] = {
						lightbar_f = "M2",
						lightbar_f_tkdn = "M2",
						lightbar_r = "M2",
					},
					["1"] = {
						lightbar_f = "M2",
						lightbar_f_tkdn = "M2",
						lightbar_r = "M2",
					},
				},
			}
		}, {
			Name = "Stage 3",
			Stage = "M3",
			Components = {
				headlights = "wigwag",
				rear = "M3"
			},
			BG_Components = {
				grill = {
					["0"] = {
						grill = "M3",
					}
				},
				lightbar = {
					["0"] = {
						lightbar_f = "M3",
						lightbar_f_tkdn = "M3",
						lightbar_r = "M3",
					},
					["1"] = {
						lightbar_f = "M3",
						lightbar_f_tkdn = "M3",
						lightbar_r = "M3",
					},
				},
			}
		}
	},
	Illumination = {
		{
			Name = "TKDN",
			Icon = "takedown",
			Stage = "T",

			Components = {},
			BG_Components = {
				["lightbar"] = {
					["0"] = {
						{5, CW, 2},
						{6, CW, 2}
					},
					["1"] = {
						{5, CW, 2},
						{6, CW, 2}
					},
				},
			},
			Preset_Components = {},

			Lights = {
				{EMV.PosMap.Lightbar[1][1], Angle(0, 90, 0), "tkdn"},
				{MirrorVector(EMV.PosMap.Lightbar[1][1]), Angle(0, 90, 0), "tkdn"}
			},
		},
		{
			Name = "LEFT",
			Icon = "alley-left",
			Stage = "L",

			Components = {},
			BG_Components = {
				["lightbar"] = {
					["0"] = {
						{14, CW, 2}
					},
					["1"] = {
						{14, CW, 2}
					},
				},
			},
			Preset_Components = {},

			Lights = {
				{MirrorVector(EMV.PosMap.Lightbar[5][1]), Angle(0, 180, 0), "alley"},
			},
		},
		{
			Name = "RIGHT",
			Icon = "alley-right",
			Stage = "R",

			Components = {},
			BG_Components = {
				["lightbar"] = {
					["0"] = {
						{13, CW, 2}
					},
					["1"] = {
						{13, CW, 2}
					},
				},
			},
			Preset_Components = {},

			Lights = {
				{EMV.PosMap.Lightbar[5][1], Angle(0, 0, 0), "alley"},
			},
		}
	}
}

EMV.Configuration = true

Photon.EMVLibrary[name] = EMV
if EMVU then EMVU:OverwriteIndex(name, EMV) end
