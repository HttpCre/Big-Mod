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
