print("[BigMod] Initiated!")
audience:registerNew({
	id = "elders",
	display = _T("AUDIENCE_ELDERS", "Elders"),
	genreMatching = {
		action = audience.MATCH_BAD,
		adventure = audience.MATCH_GOOD,
		horror = audience.MATCH_VBAD,
		simulation = audience.MATCH_GOOD,
		fighting = audience.MATCH_BAD,
		strategy = audience.MATCH_VBAD,
		rpg = audience.MATCH_BAD,
		sandbox = audience.MATCH_GOOD,
		racing = audience.MATCH_GOOD}
})

local GameMax = {}
GameMax.id = "GameMax"
GameMax.icon = "reviewer_legit_reviews"
GameMax.display = _T("GAMEMAX", "GameMax")
GameMax.description = {
	{text = _T("LEGIT_REVIEWS_DESC1", "Always here to provide you the best product reviews!"), font = "bh22"},
	{text = _T("LEGIT_REVIEWS_DESC2", "We have been around for a long time and have reviewed many games, you should check us out!"), font = "pix18"}
}
GameMax.maxInterviewChance = 70
GameMax.bribeAcceptChance = 2
GameMax.bribeAcceptChanceIncreaseFromMoney = 4 

GameMax.bribeRevealChance = 11
GameMax.bribeRevealChanceMonthly = GameMax.bribeRevealChance / 15 

GameMax.interviewBaseAcceptChance = 10 

GameMax.interviewReputationCutoff = 25000 

GameMax.interviewAcceptChancePerReputation = 1 / 100 

GameMax.popularity = 2.8 

GameMax.autoInterviewChanceMultiplier = 0.6 

GameMax.recentReviewTimeCutoff = 58 

GameMax.recentInterviewTimeAffector = 0.1 

GameMax.inquireText = _T("GAMEMAX_INQUIRE", "They make unbiased reviews and everyone loves them, they probably never even took a bribe!")

reviewers:registerNew(GameMax)

letsPlayers:registerNew({
	id = "Kxlled",
	display = _T("KXLLED", "Kxlled"),
	icon = "lp_zapdeadcake",
	description = _T("KXLLED_DESC", "Professional lets player, best you will find."),
	minimumViewerBaseForPaidVideos = 10000, 

	availability = {year = 2000, month = 3},
	baseVideoPrice = 3200,
	startingViewers = 100000,
	extraPerSection = 620,
	extraPriceSection = 20000,
	maxViewerbaseMult = 1,
	viewerIncreaseMult = 0.8,
	freeExtraVideosRating = 8, 

	freeExtraVideos = 2, 

	maxVideos = 3, 

	preferredGenres = {
		action = true,
		rpg = true,
                simulation = true,
	},
	
	setupDescbox = function(self, letsPlayer, descBox, wrapWidth)
		if timeline.curTime >= timeline:getDateTime(2017, 4) then
			descBox:addText(_T("KXLLED_DESC_2", "Some people claim he has magical powers."), "pix16", nil, 0, wrapWidth)
		end
	end
})

platforms:registerNew({
	id = "pear_pc",
	manufacturer = "Pear",
	display = _T("PLATFORM_PEAR", "Pear"),
	month = 1,
	releaseDate = {year = 2000, month = 4},
	defaultAttractiveness = 210,
	startingSharePercentage = 55.3,
	developmentTimeAffector = 0.6,
	frustrationMultiplier = 1.1,
	cutPerSale = 0,
	scaleProgression = {
		{year = 2000, scale = 4},
		{year = 2001, scale = 4.5},
		{year = 2002, scale = 5},
		{year = 2003, scale = 5.5},
		{year = 2004, scale = 6},
		{year = 2005, scale = 7},
		{year = 2006, scale = 7.5},
		{year = 2007, scale = 8},
		{year = 2008, scale = 9},
		{year = 2009, scale = 10},
		{year = 2010, scale = 10.5},
		{year = 2011, scale = 11},
		{year = 2012, scale = 12},
		{year = 2013, scale = 13},
		{year = 2014, scale = 14},
		{year = 2015, scale = 15},
		{year = 2016, scale = 16},
		{year = 2017, scale = 17},
		{year = 2018, scale = 18},
		{year = 2019, scale = 19},
		{year = 2020, scale = 20},
	},
	getMaxProjectScale = function(self, targetTime)
		local curYear = timeline:getYear(targetTime)
		local scaleValue = self.scaleProgression[1].scale
		
		for key, data in ipairs(self.scaleProgression) do
			if curYear >= data.year and data.scale > scaleValue then
				scaleValue = data.scale
			end
		end
		
		return scaleValue
	end,
	
	startingQuad = "platform_pear_1",
	laterQuad = "platform_pear_2",
	laterQuadYear = 2004,
	
	getDisplayQuad = function(self)
		if timeline:getYear() >= self.laterQuadYear then
			return self.laterQuad
		end
		
		return self.startingQuad
	end,

	genreMatching = {
		action = 2,
		adventure = 1.60,
		horror = 1.75,
		simulation = 2.05,
		strategy = 1.15,
		rpg = 1.10,
		sandbox = 1.15,
		fighting = 0.7,
		racing = 1.1}
})