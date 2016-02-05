--Version 0.11
--Library for Machine Series by Ralphlol

class 'MachineLib'
function MachineLib:__init()
	self.version = 0.12
	
	self.lolPatch = GetGameVersion and GetGameVersion():sub(1,3) == "6.2" and 1 or 2
	self.notPresentPatch = GetGameVersion and GetGameVersion():sub(1,3) ~= "6.1" and GetGameVersion():sub(1,3) ~= "6.2"
	self.cn = self.notPresentPatch
	
	self.moveHeader = self.lolPatch == 1 and 137 or 197
	self.spellHeader = self.lolPatch == 1 and 299 or 126
	self.goldHeader = self.lolPatch == 1 and 58 or 8
	
	--Recall
	self.recallHeader = self.lolPatch == 1 and 0x008D or 0x00D4
	self.recallPos1 = self.lolPatch == 1 and 80 or 6
	self.recallPos2 = self.lolPatch == 1 and 6 or 11
	local IDBytes = {	
	[1] =--6.2
		{[0x00] = 0xFC, [0x01] = 0x19, [0x02] = 0xFE, [0x03] = 0xE0, [0x04] = 0x56, [0x05] = 0x82, [0x06] = 0x8D, [0x07] = 0x9A, [0x08] = 0x96, [0x09] = 0xB8, [0x0A] = 0xAE, [0x0B] = 0x3D, [0x0C] = 0xC4, [0x0D] = 0xAF, [0x0E] = 0x30, [0x0F] = 0xA6, [0x10] = 0xCF, [0x11] = 0x0E, [0x12] = 0x8B, [0x13] = 0x76, [0x14] = 0xB0, [0x15] = 0xD2, [0x16] = 0xBD, [0x17] = 0x11, [0x18] = 0x97, [0x19] = 0x6A, [0x1A] = 0x74, [0x1B] = 0x36, [0x1C] = 0x28, [0x1D] = 0xE9, [0x1E] = 0x10, [0x1F] = 0x8E, [0x20] = 0xEB, [0x21] = 0x46, [0x22] = 0x1E, [0x23] = 0x3C, [0x24] = 0x04, [0x25] = 0x21, [0x26] = 0xA9, [0x27] = 0x53, [0x28] = 0x75, [0x29] = 0x41, [0x2A] = 0x15, [0x2B] = 0x5C, [0x2C] = 0x58, [0x2D] = 0xEE, [0x2E] = 0xC2, [0x2F] = 0xFD, [0x30] = 0x2B, [0x31] = 0xDF, [0x32] = 0xD5, [0x33] = 0xC1, [0x34] = 0x77, [0x35] = 0x90, [0x36] = 0xDD, [0x37] = 0x49, [0x38] = 0x63, [0x39] = 0x7E, [0x3A] = 0x31, [0x3B] = 0x84, [0x3C] = 0x26, [0x3D] = 0xEF, [0x3E] = 0x1A, [0x3F] = 0x13, [0x40] = 0x33, [0x41] = 0x00, [0x42] = 0x06, [0x43] = 0x4F, [0x44] = 0xD6, [0x45] = 0x2E, [0x46] = 0x2A, [0x47] = 0x9F, [0x48] = 0x47, [0x49] = 0x07, [0x4A] = 0xA5, [0x4B] = 0xDB, [0x4C] = 0xAB, [0x4D] = 0xD9, [0x4E] = 0x09, [0x4F] = 0xAD, [0x50] = 0x5F, [0x51] = 0x4A, [0x52] = 0x39, [0x53] = 0xA1, [0x54] = 0x2D, [0x55] = 0x0F, [0x56] = 0xE7, [0x57] = 0x0B, [0x58] = 0x9E, [0x59] = 0x92, [0x5A] = 0x20, [0x5B] = 0x2F, [0x5C] = 0x42, [0x5D] = 0x54, [0x5E] = 0x50, [0x5F] = 0x87, [0x60] = 0x66, [0x61] = 0x23, [0x62] = 0x18, [0x63] = 0x48, [0x64] = 0x02, [0x65] = 0x8F, [0x66] = 0x57, [0x67] = 0x7A, [0x68] = 0x99, [0x69] = 0x5E, [0x6A] = 0xCD, [0x6B] = 0x9B, [0x6C] = 0x6B, [0x6D] = 0x80, [0x6E] = 0xFA, [0x6F] = 0xC9, [0x70] = 0x5D, [0x71] = 0xBA, [0x72] = 0x65, [0x73] = 0x93, [0x74] = 0x73, [0x75] = 0xD8, [0x76] = 0x7C, [0x77] = 0xF7, [0x78] = 0xC7, [0x79] = 0x6F, [0x7A] = 0xF1, [0x7B] = 0xA7, [0x7C] = 0xEC, [0x7D] = 0x0D, [0x7E] = 0x1B, [0x7F] = 0xB5, [0x80] = 0x55, [0x81] = 0xCA, [0x82] = 0xB7, [0x83] = 0xED, [0x84] = 0x68, [0x85] = 0xD7, [0x86] = 0x1C, [0x87] = 0xFB, [0x88] = 0x78, [0x89] = 0x5A, [0x8A] = 0xE8, [0x8B] = 0x16, [0x8C] = 0xF5, [0x8D] = 0x08, [0x8E] = 0xA4, [0x8F] = 0x9D, [0x90] = 0xAA, [0x91] = 0x4B, [0x92] = 0x44, [0x93] = 0x0A, [0x94] = 0x89, [0x95] = 0x3A, [0x96] = 0x98, [0x97] = 0xBF, [0x98] = 0x7F, [0x99] = 0xCB, [0x9A] = 0xA8, [0x9B] = 0xF6, [0x9C] = 0x94, [0x9D] = 0xE3, [0x9E] = 0x4D, [0x9F] = 0x6D, [0xA0] = 0x69, [0xA1] = 0xBC, [0xA2] = 0x91, [0xA3] = 0xCE, [0xA4] = 0x29, [0xA5] = 0x35, [0xA6] = 0x43, [0xA7] = 0xB3, [0xA8] = 0x6E, [0xA9] = 0xD1, [0xAA] = 0x03, [0xAB] = 0x67, [0xAC] = 0xC6, [0xAD] = 0xC3, [0xAE] = 0x17, [0xAF] = 0x12, [0xB0] = 0x1D, [0xB1] = 0x3F, [0xB2] = 0xF2, [0xB3] = 0x64, [0xB4] = 0xD0, [0xB5] = 0x8C, [0xB6] = 0x95, [0xB7] = 0xB6, [0xB8] = 0xE6, [0xB9] = 0x40, [0xBA] = 0x14, [0xBB] = 0x70, [0xBC] = 0x45, [0xBD] = 0xFF, [0xBE] = 0xDA, [0xBF] = 0x4E, [0xC0] = 0x62, [0xC1] = 0xF0, [0xC2] = 0xC8, [0xC3] = 0x4C, [0xC4] = 0x52, [0xC5] = 0x3B, [0xC6] = 0xF4, [0xC7] = 0x81, [0xC8] = 0x34, [0xC9] = 0x5B, [0xCA] = 0x0C, [0xCB] = 0xB2, [0xCC] = 0xE2, [0xCD] = 0x8A, [0xCE] = 0xCC, [0xCF] = 0x22, [0xD0] = 0x61, [0xD1] = 0x24, [0xD2] = 0xEA, [0xD3] = 0x1F, [0xD4] = 0xA3, [0xD5] = 0x3E, [0xD6] = 0xE1, [0xD7] = 0xBB, [0xD8] = 0x71, [0xD9] = 0x79, [0xDA] = 0xE4, [0xDB] = 0x59, [0xDC] = 0xB4, [0xDD] = 0x6C, [0xDE] = 0xF8, [0xDF] = 0x9C, [0xE0] = 0xAC, [0xE1] = 0xF3, [0xE2] = 0xF9, [0xE3] = 0xA2, [0xE4] = 0xDC, [0xE5] = 0x83, [0xE6] = 0x72, [0xE7] = 0x7B, [0xE8] = 0xB9, [0xE9] = 0x2C, [0xEA] = 0x25, [0xEB] = 0xB1, [0xEC] = 0x32, [0xED] = 0xC5, [0xEE] = 0xE5, [0xEF] = 0x7D, [0xF0] = 0xD4, [0xF1] = 0x86, [0xF2] = 0xDE, [0xF3] = 0x60, [0xF4] = 0xD3, [0xF5] = 0x38, [0xF6] = 0x37, [0xF7] = 0xC0, [0xF8] = 0x51, [0xF9] = 0x05, [0xFA] = 0xA0, [0xFB] = 0x85, [0xFC] = 0x01, [0xFD] = 0x27, [0xFE] = 0x88, [0xFF] = 0xBE,}

		,[2] =--6.1
			{[0x01] = 0xC2,[0x02] = 0xF6,[0x03] = 0xFE,[0x04] = 0xDA,[0x05] = 0xE2,[0x06] = 0xD6,[0x07] = 0xDE,[0x08] = 0xCA,[0x09] = 0xD2,
			[0x0A] = 0xC6,[0x0B] = 0xCE,[0x0C] = 0xEA,[0x0D] = 0xF2,[0x0E] = 0xE6,[0x0F] = 0xEE,[0x10] = 0x7A,[0x11] = 0x42,[0x12] = 0x76,
			[0x13] = 0x7E,[0x14] = 0x5A,[0x15] = 0x62,[0x16] = 0x56,[0x17] = 0x5E,[0x18] = 0x4A,[0x19] = 0x52,[0x1A] = 0x46,[0x1B] = 0x4E,
			[0x1C] = 0x6A,[0x1D] = 0x72,[0x1E] = 0x66,[0x1F] = 0x6E,[0x20] = 0xBA,[0x21] = 0x82,[0x22] = 0xB6,[0x23] = 0xBE,[0x24] = 0x9A,
			[0x25] = 0xA2,[0x26] = 0x96,[0x27] = 0x9E,[0x28] = 0x8A,[0x29] = 0x92,[0x2A] = 0x86,[0x2B] = 0x8E,[0x2C] = 0xAA,[0x2D] = 0xB2,
			[0x2E] = 0xA6,[0x2F] = 0xAE,[0x30] = 0x3A,[0x31] = 0x02,[0x32] = 0x36,[0x33] = 0x3E,[0x34] = 0x1A,[0x35] = 0x22,[0x36] = 0x16,
			[0x37] = 0x1E,[0x38] = 0x0A,[0x39] = 0x12,[0x3A] = 0x06,[0x3B] = 0x0E,[0x3C] = 0x2A,[0x3D] = 0x32,[0x3E] = 0x26,[0x3F] = 0x2E,
			[0x40] = 0xF8,[0x41] = 0xC0,[0x42] = 0xF4,[0x43] = 0xFC,[0x44] = 0xD8,[0x45] = 0xE0,[0x46] = 0xD4,[0x47] = 0xDC,[0x48] = 0xC8,
			[0x49] = 0xD0,[0x4A] = 0xC4,[0x4B] = 0xCC,[0x4C] = 0xE8,[0x4D] = 0xF0,[0x4E] = 0xE4,[0x4F] = 0xEC,[0x50] = 0x78,[0x51] = 0x40,
			[0x52] = 0x74,[0x53] = 0x7C,[0x54] = 0x58,[0x55] = 0x60,[0x56] = 0x54,[0x57] = 0x5C,[0x58] = 0x48,[0x59] = 0x50,[0x5A] = 0x44,
			[0x5B] = 0x4C,[0x5C] = 0x68,[0x5D] = 0x70,[0x5E] = 0x64,[0x5F] = 0x6C,[0x60] = 0xB8,[0x61] = 0x80,[0x62] = 0xB4,[0x63] = 0xBC,
			[0x64] = 0x98,[0x65] = 0xA0,[0x66] = 0x94,[0x67] = 0x9C,[0x68] = 0x88,[0x69] = 0x90,[0x6A] = 0x84,[0x6B] = 0x8C,[0x6C] = 0xA8,
			[0x6D] = 0xB0,[0x6E] = 0xA4,[0x6F] = 0xAC,[0x70] = 0x38,[0x71] = 0x00,[0x72] = 0x34,[0x73] = 0x3C,[0x74] = 0x18,[0x75] = 0x20,
			[0x76] = 0x14,[0x77] = 0x1C,[0x78] = 0x08,[0x79] = 0x10,[0x7A] = 0x04,[0x7B] = 0x0C,[0x7C] = 0x28,[0x7D] = 0x30,[0x7E] = 0x24,
			[0x7F] = 0x2C,[0x80] = 0xFB,[0x81] = 0xC3,[0x82] = 0xF7,[0x83] = 0xFF,[0x84] = 0xDB,[0x85] = 0xE3,[0x86] = 0xD7,[0x87] = 0xDF,
			[0x88] = 0xCB,[0x89] = 0xD3,[0x8A] = 0xC7,[0x8B] = 0xCF,[0x8C] = 0xEB,[0x8D] = 0xF3,[0x8E] = 0xE7,[0x8F] = 0xEF,[0x90] = 0x7B,
			[0x91] = 0x43,[0x92] = 0x77,[0x93] = 0x7F,[0x94] = 0x5B,[0x95] = 0x63,[0x96] = 0x57,[0x97] = 0x5F,[0x98] = 0x4B,[0x99] = 0x53,
			[0x9A] = 0x47,[0x9B] = 0x4F,[0x9C] = 0x6B,[0x9D] = 0x73,[0x9E] = 0x67,[0x9F] = 0x6F,[0xA0] = 0xBB,[0xA1] = 0x83,[0xA2] = 0xB7,
			[0xA3] = 0xBF,[0xA4] = 0x9B,[0xA5] = 0xA3,[0xA6] = 0x97,[0xA7] = 0x9F,[0xA8] = 0x8B,[0xA9] = 0x93,[0xAA] = 0x87,[0xAB] = 0x8F,
			[0xAC] = 0xAB,[0xAD] = 0xB3,[0xAE] = 0xA7,[0xAF] = 0xAF,[0xB0] = 0x3B,[0xB1] = 0x03,[0xB2] = 0x37,[0xB3] = 0x3F,[0xB4] = 0x1B,
			[0xB5] = 0x23,[0xB6] = 0x17,[0xB7] = 0x1F,[0xB8] = 0x0B,[0xB9] = 0x13,[0xBA] = 0x07,[0xBB] = 0x0F,[0xBC] = 0x2B,[0xBD] = 0x33,
			[0xBE] = 0x27,[0xBF] = 0x2F,[0xC0] = 0xF9,[0xC1] = 0xC1,[0xC2] = 0xF5,[0xC3] = 0xFD,[0xC4] = 0xD9,[0xC5] = 0xE1,[0xC6] = 0xD5,
			[0xC7] = 0xDD,[0xC8] = 0xC9,[0xC9] = 0xD1,[0xCA] = 0xC5,[0xCB] = 0xCD,[0xCC] = 0xE9,[0xCD] = 0xF1,[0xCE] = 0xE5,[0xCF] = 0xED,
			[0xD0] = 0x79,[0xD1] = 0x41,[0xD2] = 0x75,[0xD3] = 0x7D,[0xD4] = 0x59,[0xD5] = 0x61,[0xD6] = 0x55,[0xD7] = 0x5D,[0xD8] = 0x49,
			[0xD9] = 0x51,[0xDA] = 0x45,[0xDB] = 0x4D,[0xDC] = 0x69,[0xDD] = 0x71,[0xDE] = 0x65,[0xDF] = 0x6D,[0xE0] = 0xB9,[0xE1] = 0x81,
			[0xE2] = 0xB5,[0xE3] = 0xBD,[0xE4] = 0x99,[0xE5] = 0xA1,[0xE6] = 0x95,[0xE7] = 0x9D,[0xE8] = 0x89,[0xE9] = 0x91,[0xEA] = 0x85,
			[0xEB] = 0x8D,[0xEC] = 0xA9,[0xED] = 0xB1,[0xEE] = 0xA5,[0xEF] = 0xAD,[0xF0] = 0x39,[0xF1] = 0x01,[0xF2] = 0x35,[0xF3] = 0x3D,
			[0xF4] = 0x19,[0xF5] = 0x21,[0xF6] = 0x15,[0xF7] = 0x1D,[0xF8] = 0x09,[0xF9] = 0x11,[0xFA] = 0x05,[0xFB] = 0x0D,[0xFC] = 0x29,
			[0xFD] = 0x31,[0xFE] = 0x25,[0xFF] = 0x2D,[0x00] = 0xFA,
		}
	}
	self.IDBytes = IDBytes[self.lolPatch]
	
	self:Level()
end

function MachineLib:SkinChange(what)
	if self.cn then return end
	
	if self.lolPatch == 1 then
		if SetSkin then
			local skinPB = what - 2
			SetSkin(myHero, skinPB)
		end
	else
		if SetSkin then
			local skinPB = what - 2
			SetSkin(myHero, skinPB)
		end
	end
end

local lvlspell2 = _G.LevelSpell
function MachineLib:Level(id)
	_G.LevelSpell = function(id)
		if self.cn then return end
		
		if self.lolPatch == 1 then
			lvlspell2(id)
		else
			 local offsets = { 
				[_Q] = 0x71,
				[_W] = 0xF1,
				[_E] = 0x31,
				[_R] = 0xB1,
			  }
			  local p = CLoLPacket(0x00DB)
			  p.vTable = 0xF6D830
			  p:EncodeF(myHero.networkID)
			  for i = 1, 4 do p:Encode1(0x30) end
			  p:Encode1(0x17)
			  for i = 1, 4 do p:Encode1(0x81) end
			  for i = 1, 4 do p:Encode1(0x6A) end
			  p:Encode1(offsets[id])
			  for i = 1, 4 do p:Encode1(0x00) end
			  SendPacket(p)
		end
	end
end
