--Library for Machine Series by Ralphlol

class 'MachineLib'
function MachineLib:__init()
	self.version = 0.16
	
	self.lolPatch = GetGameVersion and GetGameVersion():sub(1,3) == "6.3" and 1 or 2
	self.notPresentPatch = GetGameVersion and GetGameVersion():sub(1,3) ~= "6.2" and GetGameVersion():sub(1,3) ~= "6.3"
	self.cn = self.notPresentPatch
	
	self.moveHeader = self.lolPatch == 1 and 197 or 137
	self.spellHeader = self.lolPatch == 1 and 223 or 299
	self.goldHeader = self.lolPatch == 1 and 179 or 58
	
	--Recall
	self.recallHeader = self.lolPatch == 1 and 0x012B or 0x008D
	self.recallPos1 = self.lolPatch == 1 and 80 or 80
	self.recallPos2 = self.lolPatch == 1 and 6 or 6
	
	--cspell2
	self.cspell2Header = self.lolPatch == 1 and 173 or 173
	self.cspell2Pos = self.lolPatch == 1 and 6 or 6
	self.cspell2Byte = self.lolPatch == 1 and 0xD8 or 0xD8
	
	local IDBytes = {	
	[1] =--6.3
		{[0x01] = 0x18,[0x02] = 0x3C,[0x03] = 0x51,[0x04] = 0xC8,[0x05] = 0x80,[0x06] = 0xE1,[0x07] = 0xF9,[0x08] = 0x2E,[0x09] = 0x86,[0x0A] = 0x8A,[0x0B] = 0x6B,[0x0C] = 0x96,[0x0D] = 0x1F,[0x0E] = 0xD3,[0x0F] = 0x44,[0x10] = 0x8E,[0x11] = 0x47,[0x12] = 0x0C,[0x13] = 0x30,[0x14] = 0x03,[0x15] = 0xB2,[0x16] = 0xCF,[0x17] = 0x3F,[0x18] = 0xBC,[0x19] = 0xCA,[0x1A] = 0xA1,[0x1B] = 0xA4,[0x1C] = 0x93,[0x1D] = 0x6E,[0x1E] = 0x37,[0x1F] = 0x79,[0x20] = 0x88,[0x21] = 0x81,[0x22] = 0x9D,[0x23] = 0x02,[0x24] = 0x2D,[0x25] = 0x1A,[0x26] = 0xAF,[0x27] = 0x0D,[0x28] = 0xA7,[0x29] = 0x41,[0x2A] = 0xA3,[0x2B] = 0xB8,[0x2C] = 0x7F,[0x2D] = 0x82,[0x2E] = 0xA0,[0x2F] = 0x32,[0x30] = 0xAE,[0x31] = 0x28,[0x32] = 0x23,[0x33] = 0x57,[0x34] = 0xEB,[0x35] = 0x1E,[0x36] = 0xD6,[0x37] = 0xE6,[0x38] = 0x35,[0x39] = 0x4D,[0x3A] = 0x08,[0x3B] = 0xCC,[0x3C] = 0x1D,[0x3D] = 0x25,[0x3E] = 0x83,[0x3F] = 0x5E,[0x40] = 0xA5,[0x41] = 0x5A,[0x42] = 0xB3,[0x43] = 0xC1,[0x44] = 0x2A,[0x45] = 0x4E,[0x46] = 0x5D,[0x47] = 0xCB,[0x48] = 0xA9,[0x49] = 0xC3,[0x4A] = 0x73,[0x4B] = 0xF1,[0x4C] = 0x9E,[0x4D] = 0x61,[0x4E] = 0x05,[0x4F] = 0xAD,[0x50] = 0x17,[0x51] = 0xEA,[0x52] = 0x56,[0x53] = 0x91,[0x54] = 0x5B,[0x55] = 0xFB,[0x56] = 0xEC,[0x57] = 0x10,[0x58] = 0xBD,[0x59] = 0xC4,[0x5A] = 0xDB,[0x5B] = 0x04,[0x5C] = 0x36,[0x5D] = 0x89,[0x5E] = 0x8F,[0x5F] = 0x42,[0x60] = 0xDC,[0x61] = 0x5C,[0x62] = 0xB9,[0x63] = 0x0A,[0x64] = 0x69,[0x65] = 0xD2,[0x66] = 0x2B,[0x67] = 0x52,[0x68] = 0x3A,[0x69] = 0x6D,[0x6A] = 0x15,[0x6B] = 0xD5,[0x6C] = 0x40,[0x6D] = 0x77,[0x6E] = 0x49,[0x6F] = 0x13,[0x70] = 0xF8,[0x71] = 0x07,[0x72] = 0x70,[0x73] = 0x90,[0x74] = 0xCD,[0x75] = 0x87,[0x76] = 0x3E,[0x77] = 0x48,[0x78] = 0x1C,[0x79] = 0xB5,[0x7A] = 0xDD,[0x7B] = 0x3B,[0x7C] = 0xF0,[0x7D] = 0x43,[0x7E] = 0x71,[0x7F] = 0xBE,[0x80] = 0xE7,[0x81] = 0xEE,[0x82] = 0xD7,[0x83] = 0xB1,[0x84] = 0x55,[0x85] = 0xC6,[0x86] = 0x19,[0x87] = 0xFC,[0x88] = 0xA2,[0x89] = 0x31,[0x8A] = 0x00,[0x8B] = 0x9B,[0x8C] = 0xC7,[0x8D] = 0x76,[0x8E] = 0xC0,[0x8F] = 0xDA,[0x90] = 0x6C,[0x91] = 0x7C,[0x92] = 0xD8,[0x93] = 0x75,[0x94] = 0x68,[0x95] = 0xF6,[0x96] = 0x95,[0x97] = 0x97,[0x98] = 0x78,[0x99] = 0x14,[0x9A] = 0x94,[0x9B] = 0xE9,[0x9C] = 0x60,[0x9D] = 0x5F,[0x9E] = 0x2F,[0x9F] = 0xBA,[0xA0] = 0x33,[0xA1] = 0xAC,[0xA2] = 0xDE,[0xA3] = 0x7E,[0xA4] = 0x9A,[0xA5] = 0xD9,[0xA6] = 0xC9,[0xA7] = 0x22,[0xA8] = 0x99,[0xA9] = 0x27,[0xAA] = 0xFF,[0xAB] = 0x45,[0xAC] = 0xF2,[0xAD] = 0xB7,[0xAE] = 0xA6,[0xAF] = 0x72,[0xB0] = 0xCE,[0xB1] = 0x98,[0xB2] = 0x24,[0xB3] = 0x65,[0xB4] = 0x0F,[0xB5] = 0xD4,[0xB6] = 0xA8,[0xB7] = 0x66,[0xB8] = 0xF4,[0xB9] = 0x54,[0xBA] = 0x39,[0xBB] = 0x92,[0xBC] = 0xAB,[0xBD] = 0x0E,[0xBE] = 0xAA,[0xBF] = 0x11,[0xC0] = 0x8B,[0xC1] = 0xFA,[0xC2] = 0x8D,[0xC3] = 0xEF,[0xC4] = 0x64,[0xC5] = 0x4A,[0xC6] = 0xE4,[0xC7] = 0x67,[0xC8] = 0x8C,[0xC9] = 0x21,[0xCA] = 0x38,[0xCB] = 0x06,[0xCC] = 0x2C,[0xCD] = 0xF7,[0xCE] = 0x7A,[0xCF] = 0x3D,[0xD0] = 0x63,[0xD1] = 0xD1,[0xD2] = 0x12,[0xD3] = 0x85,[0xD4] = 0x4F,[0xD5] = 0x53,[0xD6] = 0x34,[0xD7] = 0x9C,[0xD8] = 0xFE,[0xD9] = 0x29,[0xDA] = 0x26,[0xDB] = 0xD0,[0xDC] = 0xB4,[0xDD] = 0xE8,[0xDE] = 0x58,[0xDF] = 0x62,[0xE0] = 0xE0,[0xE1] = 0x01,[0xE2] = 0xF5,[0xE3] = 0xFD,[0xE4] = 0x84,[0xE5] = 0xF3,[0xE6] = 0x09,[0xE7] = 0x50,[0xE8] = 0xE2,[0xE9] = 0x1B,[0xEA] = 0x46,[0xEB] = 0xC2,[0xEC] = 0x6A,[0xED] = 0xB6,[0xEE] = 0x0B,[0xEF] = 0x20,[0xF0] = 0xC5,[0xF1] = 0x7D,[0xF2] = 0xBB,[0xF3] = 0x7B,[0xF4] = 0xE5,[0xF5] = 0x6F,[0xF6] = 0x4B,[0xF7] = 0xE3,[0xF8] = 0xB0,[0xF9] = 0x16,[0xFA] = 0x59,[0xFB] = 0xDF,[0xFC] = 0x4C,[0xFD] = 0x9F,[0xFE] = 0xBF,[0xFF] = 0x74,[0x00] = 0xED,}
	,[2] =--6.2
		{[0x00] = 0xFC, [0x01] = 0x19, [0x02] = 0xFE, [0x03] = 0xE0, [0x04] = 0x56, [0x05] = 0x82, [0x06] = 0x8D, [0x07] = 0x9A, [0x08] = 0x96, [0x09] = 0xB8, [0x0A] = 0xAE, [0x0B] = 0x3D, [0x0C] = 0xC4, [0x0D] = 0xAF, [0x0E] = 0x30, [0x0F] = 0xA6, [0x10] = 0xCF, [0x11] = 0x0E, [0x12] = 0x8B, [0x13] = 0x76, [0x14] = 0xB0, [0x15] = 0xD2, [0x16] = 0xBD, [0x17] = 0x11, [0x18] = 0x97, [0x19] = 0x6A, [0x1A] = 0x74, [0x1B] = 0x36, [0x1C] = 0x28, [0x1D] = 0xE9, [0x1E] = 0x10, [0x1F] = 0x8E, [0x20] = 0xEB, [0x21] = 0x46, [0x22] = 0x1E, [0x23] = 0x3C, [0x24] = 0x04, [0x25] = 0x21, [0x26] = 0xA9, [0x27] = 0x53, [0x28] = 0x75, [0x29] = 0x41, [0x2A] = 0x15, [0x2B] = 0x5C, [0x2C] = 0x58, [0x2D] = 0xEE, [0x2E] = 0xC2, [0x2F] = 0xFD, [0x30] = 0x2B, [0x31] = 0xDF, [0x32] = 0xD5, [0x33] = 0xC1, [0x34] = 0x77, [0x35] = 0x90, [0x36] = 0xDD, [0x37] = 0x49, [0x38] = 0x63, [0x39] = 0x7E, [0x3A] = 0x31, [0x3B] = 0x84, [0x3C] = 0x26, [0x3D] = 0xEF, [0x3E] = 0x1A, [0x3F] = 0x13, [0x40] = 0x33, [0x41] = 0x00, [0x42] = 0x06, [0x43] = 0x4F, [0x44] = 0xD6, [0x45] = 0x2E, [0x46] = 0x2A, [0x47] = 0x9F, [0x48] = 0x47, [0x49] = 0x07, [0x4A] = 0xA5, [0x4B] = 0xDB, [0x4C] = 0xAB, [0x4D] = 0xD9, [0x4E] = 0x09, [0x4F] = 0xAD, [0x50] = 0x5F, [0x51] = 0x4A, [0x52] = 0x39, [0x53] = 0xA1, [0x54] = 0x2D, [0x55] = 0x0F, [0x56] = 0xE7, [0x57] = 0x0B, [0x58] = 0x9E, [0x59] = 0x92, [0x5A] = 0x20, [0x5B] = 0x2F, [0x5C] = 0x42, [0x5D] = 0x54, [0x5E] = 0x50, [0x5F] = 0x87, [0x60] = 0x66, [0x61] = 0x23, [0x62] = 0x18, [0x63] = 0x48, [0x64] = 0x02, [0x65] = 0x8F, [0x66] = 0x57, [0x67] = 0x7A, [0x68] = 0x99, [0x69] = 0x5E, [0x6A] = 0xCD, [0x6B] = 0x9B, [0x6C] = 0x6B, [0x6D] = 0x80, [0x6E] = 0xFA, [0x6F] = 0xC9, [0x70] = 0x5D, [0x71] = 0xBA, [0x72] = 0x65, [0x73] = 0x93, [0x74] = 0x73, [0x75] = 0xD8, [0x76] = 0x7C, [0x77] = 0xF7, [0x78] = 0xC7, [0x79] = 0x6F, [0x7A] = 0xF1, [0x7B] = 0xA7, [0x7C] = 0xEC, [0x7D] = 0x0D, [0x7E] = 0x1B, [0x7F] = 0xB5, [0x80] = 0x55, [0x81] = 0xCA, [0x82] = 0xB7, [0x83] = 0xED, [0x84] = 0x68, [0x85] = 0xD7, [0x86] = 0x1C, [0x87] = 0xFB, [0x88] = 0x78, [0x89] = 0x5A, [0x8A] = 0xE8, [0x8B] = 0x16, [0x8C] = 0xF5, [0x8D] = 0x08, [0x8E] = 0xA4, [0x8F] = 0x9D, [0x90] = 0xAA, [0x91] = 0x4B, [0x92] = 0x44, [0x93] = 0x0A, [0x94] = 0x89, [0x95] = 0x3A, [0x96] = 0x98, [0x97] = 0xBF, [0x98] = 0x7F, [0x99] = 0xCB, [0x9A] = 0xA8, [0x9B] = 0xF6, [0x9C] = 0x94, [0x9D] = 0xE3, [0x9E] = 0x4D, [0x9F] = 0x6D, [0xA0] = 0x69, [0xA1] = 0xBC, [0xA2] = 0x91, [0xA3] = 0xCE, [0xA4] = 0x29, [0xA5] = 0x35, [0xA6] = 0x43, [0xA7] = 0xB3, [0xA8] = 0x6E, [0xA9] = 0xD1, [0xAA] = 0x03, [0xAB] = 0x67, [0xAC] = 0xC6, [0xAD] = 0xC3, [0xAE] = 0x17, [0xAF] = 0x12, [0xB0] = 0x1D, [0xB1] = 0x3F, [0xB2] = 0xF2, [0xB3] = 0x64, [0xB4] = 0xD0, [0xB5] = 0x8C, [0xB6] = 0x95, [0xB7] = 0xB6, [0xB8] = 0xE6, [0xB9] = 0x40, [0xBA] = 0x14, [0xBB] = 0x70, [0xBC] = 0x45, [0xBD] = 0xFF, [0xBE] = 0xDA, [0xBF] = 0x4E, [0xC0] = 0x62, [0xC1] = 0xF0, [0xC2] = 0xC8, [0xC3] = 0x4C, [0xC4] = 0x52, [0xC5] = 0x3B, [0xC6] = 0xF4, [0xC7] = 0x81, [0xC8] = 0x34, [0xC9] = 0x5B, [0xCA] = 0x0C, [0xCB] = 0xB2, [0xCC] = 0xE2, [0xCD] = 0x8A, [0xCE] = 0xCC, [0xCF] = 0x22, [0xD0] = 0x61, [0xD1] = 0x24, [0xD2] = 0xEA, [0xD3] = 0x1F, [0xD4] = 0xA3, [0xD5] = 0x3E, [0xD6] = 0xE1, [0xD7] = 0xBB, [0xD8] = 0x71, [0xD9] = 0x79, [0xDA] = 0xE4, [0xDB] = 0x59, [0xDC] = 0xB4, [0xDD] = 0x6C, [0xDE] = 0xF8, [0xDF] = 0x9C, [0xE0] = 0xAC, [0xE1] = 0xF3, [0xE2] = 0xF9, [0xE3] = 0xA2, [0xE4] = 0xDC, [0xE5] = 0x83, [0xE6] = 0x72, [0xE7] = 0x7B, [0xE8] = 0xB9, [0xE9] = 0x2C, [0xEA] = 0x25, [0xEB] = 0xB1, [0xEC] = 0x32, [0xED] = 0xC5, [0xEE] = 0xE5, [0xEF] = 0x7D, [0xF0] = 0xD4, [0xF1] = 0x86, [0xF2] = 0xDE, [0xF3] = 0x60, [0xF4] = 0xD3, [0xF5] = 0x38, [0xF6] = 0x37, [0xF7] = 0xC0, [0xF8] = 0x51, [0xF9] = 0x05, [0xFA] = 0xA0, [0xFB] = 0x85, [0xFC] = 0x01, [0xFD] = 0x27, [0xFE] = 0x88, [0xFF] = 0xBE,}

	}
	self.IDBytes = IDBytes[self.lolPatch]
	
	self:Level()
end

function MachineLib:SkinChange(what)
	if self.cn or not SetSkin then return end
	
	if self.lolPatch == 1 then
		local skinPB = what - 2
		SetSkin(myHero, skinPB)
	else
		local skinPB = what - 2
		SetSkin(myHero, skinPB)
	end
end

local lvlspell2 = _G.LevelSpell
function MachineLib:Level(id)
	_G.LevelSpell = function(id)
		if self.cn then return end
		
		if self.lolPatch == 1 then
			lvlspell2(id)
		else
			lvlspell2(id)
			
		end
	end
end
