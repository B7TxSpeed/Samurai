local bossLines = {
    SAM_HOF_FACTOTUM = "There! Somethings coming through! Another fabricant!",
    SAM_HOF_COMMITEE = "Reprocessing yard contamination critical",
    SAM_HOF_AG_SPAWN = "Aha! There's its cogitation array, in the distance%. Keep the body distracted while I unravel its mind",
    SAM_HOF_AG_P1 = "Attack the secondary terminals!",
    SAM_HOF_AG_P2 = "It's bypassing my alterations! Disrupt the secondary terminals now!",
    SAM_HOF_AG_P3 = "The secondary terminals are attempting to compensate! Give them a whack!",
    SAM_MOL_ZHAJHASSA = "Don't .... It's ... trap%.",
    SAM_MOL_RAKKHAT = "Have you not heard me%? Have I not",
    SAM_AA_VARLARIEL = "The Celestial Mage summons me to",
    SAM_SS_NAHVIINTAAS = "To restore the natural order%. To reclaim all that was and will be",
    SAM_KA_FALGRAVN = "You dare face me%? Baleful power lurks beneath your feet, and I will have it for my own!",
    SAM_DSR_TALERIA = "Barging into a lady's private chambers%. You are bold%.",
    SAM_SE_TWELVANE = "Why do you still hesitate, Vanton%?"
}

for key, value in pairs(bossLines) do
    SafeAddVersion(key, 1)
    ZO_CreateStringId(key, value)
end