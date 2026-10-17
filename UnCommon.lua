local orace, prace, _ = UnitRace("player")
print("|cff1eff00UnCommon|r loaded! Detected player race: "..orace)
local pfaction, _ = UnitFactionGroup("player")

local lang = {
	["Human"] = "Common",
	["Orc"] = "Orcish",
	["Dwarf"] = "Dwarven",
	["NightElf"] = "Darnassian",
	["Scourge"] = "Gutterspeak",
	["Tauren"] = "Taurahe",
	["Gnome"] = "Gnomish",
	["Troll"] = "Zandali",
	["Skyborne"] = "Thalassian"
}

local translators = {
	["Common"] = {
		[0] = 12,
		[1] = {"A", "E", "I", "O", "U", "Y"},
		[2] = {"An", "Ko", "Lo", "Lu", "Me", "Ne", "Re", "Ru", "Se", "Ti", "Va", "Ve"},
		[3] = {"Ash", "Bor", "Bur", "Far", "Gol", "Hir", "Lon", "Mod", "Nud", "Ras", "Ver", "Vil", "Vos"},
		[4] = {"Ador", "Agol", "Dana", "Goth", "Lars", "Noth", "Nuff", "Odes", "Ruff", "Thor", "Uden", "Veld", "Vohl", "Vrum"},
		[5] = {"Algos", "Barad", "Borne", "Melka", "Ergin", "Eynes", "Garde", "Gloin", "Majis", "Nagan", "Novas", "Regen", "Tiras", "Wirsh"},
		[6] = {"Aesire", "Aziris", "Daegil", "Danieb", "Ealdor", "Engoth", "Goibon", "Mandos", "Nevren", "Rogesh", "Rothas", "Ruftos", "Skilde", "Valesh", "Vandar", "Waldir"},
		[7] = {"Andovis", "Ewiddan", "Faergas", "Forthis", "Kaelsig", "Koshvel", "Lithtos", "Nandige", "Nostyec", "Novaedi", "Sturume", "Vassild"},
		[8] = {"Aldonoth", "Cynegold", "Endirvis", "Hamerung", "Landowar", "Lordaere", "Methrine", "Ruftvess", "Thorniss"},
		[9] = {"Aetwinter", "Danagarde", "Eloderung", "Firalaine", "Gloinador", "Gothalgos", "Regenthor", "Udenmajis", "Vandarwos", "Veldbarad"},
		[10] = {"Aelgestron", "Cynewalden", "Danavandar", "Dyrstigost", "Falhedring", "Vastrungen"},
		[11] = {"Agolandovis", "Bornevalesh", "Dornevalesh", "Farlandowar", "Forthasador", "Thorlithtos", "Vassildador", "Wershaesire"},
		[12] = {"Golveldbarad", "Mandosdaegil", "Nevrenrothas", "Waldirskilde"}
	},
	["Orcish"] = {
		[0] = 13,
		[1] = {"A", "N", "G", "O", "L"},
		[2] = {"Ha", "Ko", "No", "Mu", "Ag", "Ka", "Gi", "Il"},
		[3] = {"Lok", "Tar", "Kaz", "Ruk", "Kek", "Mog", "Zug", "Gul", "Nuk", "Aaz", "Kil", "Ogg"},
		[4] = {"Rega", "Nogu", "Tago", "Uruk", "Kagg", "Zaga", "Grom", "Ogar", "Gesh", "Thok", "Dogg", "Maka", "Maza"},
		[5] = {"Regas", "Nogah", "Kazum", "Magan", "No'bu", "Golar", "Throm", "Zugas", "Re'ka", "No'ku", "Ro'th"},
		[6] = {"Thrakk", "Revash", "Nakazz", "Moguna", "No'gor", "Goth'a", "Raznos", "Ogerin", "Gezzno", "Thukad", "Makogg", "Aaz'no"},
		[7] = {"Lok'Tar", "Gul'rok", "Kazreth", "Tov'osh", "Zil'Nok", "Rath'is", "Kil'azi"},
		[8] = {"Throm'ka", "Osh'Kava", "Gul'nath", "Kog'zela", "Ragath'a", "Zuggossh", "Moth'aga"},
		[9] = {"Tov'nokaz", "Osh'kazil", "No'throma", "Gesh'nuka", "Lok'mogul", "Lok'bolar", "Ruk'ka'ha"},
		[10] = {"Regasnogah", "Kazum'nobu", "Throm'bola", "Gesh'zugas", "Maza'rotha", "Ogerin'naz"},
		[11] = {"Thrakk'reva", "Kaz'goth'no", "No'gor'goth", "Kil'azi'aga", "Zug-zug'ama", "Maza'thrakk"},
		[12] = {"Lokando'nash", "Ul'gammathar", "Golgonnashar", "Dalggo'mazah"},
		[13] = {"Khaz'rogg'ahn", "Moth'kazoroth"}
	},
	["Dwarven"] = {
		[0] = 14,
		[1] = {"A"},
		[2] = {"Am", "Ga", "Go", "Ke", "Lo", "Ok", "Ta", "Um", "We", "Zu"},
		[3] = {"Ahz", "Dum", "Dun", "Eft", "Gar", "Gor", "Hor", "Kha", "Mok", "Mos", "Red", "Ruk"},
		[4] = {"Gear", "Gosh", "Grum", "Guma", "Helm", "Hine", "Hoga", "Hrim", "Khaz", "Kost", "Loch", "Modr", "Rand", "Rune", "Thon"},
		[5] = {"Algaz", "Angor", "Dagum", "Frean", "Gimil", "Goten", "Havar", "Havas", "Mitta", "Modan", "Modor", "Scyld", "Skalf", "Thros", "Weard"},
		[6] = {"Bergum", "Drugan", "Farode", "Haldir", "Haldji", "Modgud", "Modoss", "Mogoth", "Robush", "Rugosh", "Skolde", "Syddan"},
		[7] = {"Dun-fel", "Ganrokh", "Geardum", "Godkend", "Haldren", "Havagun", "Kaelsag", "Kost-um", "Mok-kha", "Thorneb", "Zu-Modr"},
		[8] = {"Azregahn", "Gefrunon", "Golganar", "Khaz-dum", "Khazrega", "Misfaran", "Mogodune", "Moth-tur", "Ok-Hoga", "Thulmane"},
		[9] = {"Ahz-Dagum", "Angor-dum", "Arad-Khaz", "Gor-skalf", "Grum-mana", "Khaz-rand", "Kost-Guma", "Mund-helm"},
		[10] = {"Angor-Magi", "Gar-Mogoth", "Hoga-Modan", "Midd-Havas", "Nagga-roth", "Thros-gare"},
		[11] = {"Azgol-haman", "Dun-haldren", "Ge'ar-anvil", "Guma-syddan"},
		[12] = {"Robush-mogan", "Thros-am-Kha"},
		[13] = {"Gimil-thumane", "Gol'gethrunon", "Haldji-drugan"},
		[14] = {"Gosh-algaz-dun", "Scyld-modor-ok"}
	},
	["Darnassian"] = {
		[0] = 17,
		[1] = {"A", "D", "E", "I", "N", "O"},
		[2] = {"Al", "An", "Da", "Do", "Lo", "Ni", "No", "Ri", "Su"},
		[3] = {"Ala", "Ano", "Anu", "Ash", "Dor", "Dur", "Fal", "Nei", "Nor", "Osa", "Tal", "Tur"},
		[4] = {"Alah", "Aman", "Anar", "Andu", "Dath", "Dieb", "Diel", "Fulo", "Mush", "Rini", "Shar", "Thus"},
		[5] = {"Adore", "Balah", "Bandu", "Eburi", "Fandu", "Ishnu", "Shano", "Shari", "Talah", "Terro", "Thera", "Turus"},
		[6] = {"Asto're", "Belore", "Do'rah", "Dorini", "Ethala", "Falla", "Ishura", "Man'ar", "Neph'o", "Shando", "T'as'e", "U'phol"},
		[7] = {"Al'shar", "Alah'ni", "Aman'ni", "Anoduna", "Dor'Ano", "Mush'al", "Shan're"},
		[8] = {"D'ana'no", "Dal'dieb", "Dorithur", "Eraburis", "Il'amare", "Mandalas", "Thoribas"},
		[9] = {"Banthalos", "Dath'anar", "Dune'adah", "Fala'andu", "Neph'anis", "Shari'fal", "Thori'dal"},
		[10] = {"Ash'therod", "Dorados'no", "Isera'duna", "Shar'adore", "Thero'shan"},
		[11] = {"Fandu'talah", "Shari'adune"},
		[12] = {"Dor'ana'badu", "T'ase'mushal"},
		[13] = {"U'phol'belore"},
		[14] = {"Anu'dorannador", "Turus'il'amare"},
		[15] = {"Asto're'dunadah", "Shindu'falla'na"},
		[16] = {"Shindu'fallah'na"},
		[17] = {"Anu'dorinni'talah", "Ando'meth'derador", "Esh'thero'mannash", "Thoribas'no'thera"}
	},
	["Gutterspeak"] = {
		[0] = 12,
		[1] = {"A", "E", "I", "O", "U", "Y"},
		[2] = {"An", "Ko", "Lo", "Lu", "Me", "Ne", "Re", "Ru", "Se", "Ti", "Va", "Ve"},
		[3] = {"Ash", "Bor", "Bur", "Far", "Gol", "Hir", "Lon", "Mos", "Nud", "Ras", "Ver", "Vil", "Wos"},
		[4] = {"Ador", "Agol", "Dana", "Goth", "Lars", "Noth", "Nuff", "Odes", "Ruff", "Thor", "Uden", "Veld", "Vohl", "Vrum"},
		[5] = {"Algos", "Barad", "Borne", "Eynes", "Ergin", "Garde", "Gloin", "Majis", "Melka", "Nagan", "Novas", "Regen", "Tiras", "Wirsh"},
		[6] = {"Aesire", "Aziris", "Daegil", "Danieb", "Ealdor", "Engoth", "Goibon", "Mandos", "Nevren", "Rogesh", "Rothas", "Ruftos", "Skilde", "Valesh", "Vandar", "Waldir"},
		[7] = {"Andovis", "Ewiddan", "Faergas", "Forthis", "Kaelsig", "Koshvel", "Lithtos", "Nandige", "Nostyec", "Novaedi", "Sturume", "Vassild"},
		[8] = {"Aldonoth", "Cynegold", "Endirvis", "Hamerung", "Landowar", "Lordaere", "Methrine", "Ruftvess", "Thorniss"},
		[9] = {"Aetwinter", "Danagarde", "Eloderung", "Firalaine", "Gloinador", "Gothalgos", "Regenthor", "Udenmajis", "Vandarwos", "Veldbarad"},
		[10] = {"Aelgestron", "Cynewalden", "Danavandar", "Dyrstigost", "Falhedring", "Vastrungen"},
		[11] = {"Agolandovis", "Bornevalesh", "Farlandowar", "Forthasador", "Thorlithtos", "Vassildador", "Wershaesire"},
		[12] = {"Adorstaerume", "Golveldbarad", "Mandosdaegil", "Nevrenrothas", "Waldirskilde"}
	},
	["Taurahe"] = {
		[0] = 15,
		[1] = {"A", "E", "I", "N", "O"},
		[2] = {"Ba", "Ki", "Lo", "Ne", "Ni", "No", "Po", "Ta", "Te", "Tu", "Wa"},
		[3] = {"Aki", "Alo", "Awa", "Chi", "Ich", "Ish", "Kee", "Owa", "Paw", "Rah", "Uku", "Zhi"},
		[4] = {"A'ke", "Awak", "Balo", "Eche", "Isha", "Hale", "Halo", "Mani", "Nahe", "Shne", "Shte", "Tawa", "Towa"},
		[5] = {"A'hok", "A'iah", "Abalo", "Ahmen", "Anohe", "Ishte", "Kashu", "Nechi", "Nokee", "Pawni", "Poalo", "Porah", "Shush", "Ti'ha", "Tanka", "Yakee"},
		[6] = {"Aloaki", "Hetawa", "Ichnee", "Kichalo", "Lakota", "Lomani", "Neahok", "Nitawa", "Owachi", "Pawene", "Sho'wa", "Taisha", "Tatanka", "Washte"},
		[7] = {"Ishnelo", "Owakeri", "Pikialo", "Sechalo", "Shtealo", "Shteawa", "Tihikea"},
		[8] = {"Akiticha", "Awaihilo", "Ishnialo", "O'ba'chi", "Orahpajo", "Ovaktalo", "Owatanka", "Porahalo", "Shtumani", "Tatahalo", "Towateke"},
		[9] = {"Echeyakee", "Haloyakee", "Ishne'alo", "Tawaporah"},
		[10] = {"Awaka'nahe", "Ichnee'awa", "Ishamuhale", "Shteowachi"},
		[11] = {"Aloaki'shne", "Awakeekielo", "Lakota'mani", "Shtumanialo"},
		[12] = {"Awakeekielo", "Aloaki'shne"},
		[13] = {"Ishne'awahalo", "Neashushahmen"},
		[14] = {"Awakeeahmenalo"},
		[15] = {"Ishne'alo'porah"}
	},
	["Gnomish"] = {
		[0] = 11,
		[1] = {"A", "C", "D", "E", "F", "G", "I", "O", "T"},
		[2] = {"Am", "Ga", "Ke", "Lo", "Ok", "So", "Ti", "Um", "Va", "We"},
		[3] = {"Bur", "Dun", "Fez", "Giz", "Gal", "Gar", "Her", "Mik", "Mor", "Mos", "Nid", "Rod", "Zah"},
		[4] = {"Buma", "Cost", "Dani", "Gear", "Gosh", "Grum", "Helm", "Hine", "Huge", "Lock", "Kahs", "Rand", "Riff", "Rune"},
		[5] = {"Algos", "Angor", "Dagem", "Frend", "Goten", "Haven", "Havis", "Mitta", "Modan", "Modor", "Nagin", "Tiras", "Thros", "Weird"},
		[6] = {"Danieb", "Drugan", "Dumssi", "Gizber", "Haldir", "Helmok", "Mergud", "Protos", "Revosh", "Rugosh", "Shermt", "Waldor"},
		[7] = {"Bergrim", "Costirm", "Ferdosr", "Ganrokh", "Geardum", "Godling", "Haidren", "Havagun", "Noxtyec", "Scrutin", "Sturome", "Thorneb"},
		[8] = {"Aldanoth", "Azregorn", "Bolthelm", "Botlikin", "Dimligar", "Gefrunon", "Godunmug", "Grumgizr", "Kahsgear", "Kahzregi", "Landivar", "Methrine", "Mikthros", "Misfaran", "Nandiger", "Thulmane"},
		[9] = {"Angordame", "Elodergim", "Elodmodor", "Naggirath", "Nockhavis"},
		[10] = {"Ahzodaugum", "Alegaskron", "Algosgoten", "Danavandar", "Dyrstagist", "Falhadrink", "Frendgalva", "Mosgodunan", "Mundgizber", "Naginbumat", "Sihnvulden", "Throsigear", "Vustrangin"},
		[11] = {"Ferdosmodan", "Gizbarlodun", "Haldjinagin", "Helmokheram", "Kahzhaldren", "Lockrevoshi", "Robuswaldir", "Skalfgizgar", "Thrunon'gol", "Thumanerand"}
	},
	["Zandali"] = {
		[0] = 9,
		[1] = {"A", "E", "H", "J", "M", "N", "O", "S", "U"},
		[2] = {"Di", "Fi", "Fu", "Im", "Ir", "Is", "Ju", "So", "Wi", "Yu"},
		[3] = {"Deh", "Dim", "Fus", "Han", "Mek", "Noh", "Sca", "Tor", "Weh", "Wha"},
		[4] = {"Cyaa", "Duti", "Iman", "Iyaz", "Riva", "Skam", "Ting", "Worl", "Yudo"},
		[5] = {"Ackee", "Atuad", "Caang", "Difus", "Nehjo", "Siame", "T'ief", "Wassa"},
		[6] = {"Bwoyar", "Deh'yo", "Fidong", "Honnah", "Icense", "Italaf", "Quashi", "Saakes", "Smadda", "Stoosh", "Wi'mek", "Yuutee"},
		[7] = {"Chakari", "Craaweh", "Flimeff", "Godehsi", "Lok'dim", "Reespek", "Rivasuf", "Tanponi", "Uptfeel", "Yahsoda", "Ziondeh"},
		[8] = {"Ginnalka", "Machette", "Nyamanpo", "Oondasta", "Wehnehjo", "Whutless", "Yeyewata", "Zutopong"},
		[9] = {"Fus'obeah", "Or'manley"}
	},
	["Thalassian"] = {
		[0] = 17,
		[1] = {"A", "N", "I", "O", "E", "D"},
		[2] = {"Da", "Lo", "An", "Ni", "Al", "Do", "Ri", "Su", "No"},
		[3] = {"Ano", "Dur", "Tal", "Nei", "Ash", "Dor", "Anu", "Fal", "Tur", "Ala", "Nor", "Osa"},
		[4] = {"Alah", "Andu", "Dath", "Mush", "Shar", "Thus", "Fulo", "Aman", "Diel", "Dieb", "Rini", "Anar"},
		[5] = {"Talah", "Adore", "Ishnu", "Bandu", "Balah", "Fandu", "Thera", "Turus", "Shari", "Shano", "Terro", "Eburi"},
		[6] = {"Dorini", "Shando", "Ethala", "Fallah", "Belore", "Do'rah", "Neph'o", "Man'ar", "Ishura", "U'phol", "T'as'e"},
		[7] = {"Asto're", "Anoduna", "Alah'ni", "Dor'Ano", "Al'shar", "Mush'al", "Aman'ni", "Shan're"},
		[8] = {"Mandalas", "Eraburis", "Dorithur", "Dal'dieb", "Thoribas", "D'ana'no", "Il'amare"},
		[9] = {"Neph'anis", "Dune'adah", "Banthalos", "Fala'andu", "Dath'anar", "Shari'fal", "Thori'dal"},
		[10] = {"Thero'shan", "Isera'duna", "Ash'therod", "Dorados'no", "Shar'adore"},
		[11] = {"Fandu'talah", "Shari'adune"},
		[12] = {"Dor'ana'badu", "T'ase'mushal"},
		[13] = {"U'phol'belore"},
		[14] = {"Turus'il'amare", "Anu'dorannador"},
		[15] = {"Asto're'dunadah"},
		[16] = {"Shindu'fallah'na"},
		[17] = {"Thoribas'no'thera", "Ando'meth'derador", "Anu'dorinni'talah", "Esh'thero'mannash"}
	}
}

local function MatchCase(source, target)
	if source:match("^%u+$") and #source > 1 then return target:upper() end
	if source:match("^%u") then return target:sub(1,1):upper() .. target:sub(2):lower() end
	return target:lower()
end

local function TranslateMessage(self, event, text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, languageID, lineID, guid, ...)
	--print("guid: "..guid)
	--print("name: "..playerName)
	_, _, _, srace, _, _, _ = GetPlayerInfoByGUID(guid)
	--print("srace: "..srace)
	
	-- do nothing for same race, even if msg is in common
	if srace == prace then
		return false
	end

	-- only convert common for alliance, orcish for horde
	if (pfaction == "Alliance" and languageID == 7) or (pfaction == "Horde" and languageID == 1) or event == "CHAT_MSG_CHANNEL" then
		--print("language: "..lang[srace])
		--print("original: "..text)
		local t = translators[lang[srace]]
		local links = {}
		local i = 0
		
		-- protect item links
		local clean = text:gsub("(\124c.-\124r)", function(link)
			table.insert(links, link)
			return "ǂ"
		end)
		
		-- do translation
		local translated = clean:gsub("(%a+)", function(word)
			local len = #word
			if len > t[0] then len = t[0] end
			
			-- pick a word by length
			local options = t[len]
			local index = (word:lower():byte(1) or 1) % #options + 1
			local newWord = options[index]
			
			return MatchCase(word, newWord)
		end)
		
		-- add item links back
		local final = translated:gsub("(ǂ)", function(link)
			i = i + 1
			return links[i]
		end)
		
		return false, "["..lang[srace].."] "..final, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, languageID, lineID, guid, ...
	end

end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", TranslateMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", TranslateMessage)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", TranslateMessage)