local bossLines = {
    SAM_HOF_FACTOTUM = "Interesting%. These devices have all reset themselves%. I didn't do that%.",
    SAM_HOF_COMMITEE = "Ah! There you are, finally!",
    SAM_HOF_AG_SPAWN = "Now that's the second largest construct I've ever seen%.",
    SAM_HOF_AG_P1 = "Attack the secondary terminals!",
    SAM_HOF_AG_P2 = "It's bypassing my alterations! Disrupt the secondary terminals now!",
    SAM_HOF_AG_P3 = "The secondary terminals are attempting to compensate! Give them a whack!",
    SAM_MOL_ZHAJHASSA = "Don't .... It's ... trap%.",
    SAM_MOL_RAKKHAT = "Have you not heard me%? Have I not",
    SAM_AA_VARLARIEL = "The Celestial Mage summons me to",
    SAM_AA_MAGE = "Now, mortals, you will die%.",
    SAM_SS_NAHVIINTAAS = "To restore the natural order%. To reclaim all that was and will be",
    SAM_KA_FALGRAVN = "You dare face me%? Baleful power lurks beneath your feet, and I will have it for my own!",
    SAM_RG_BAHSEI = "Great Xalvakka drank deep from the souls we served her%. Soon, she arrives!",
    SAM_DSR_LY_TURLI_P1_1 = "Come forth, hounds!",
    SAM_DSR_LY_TURLI_P1_2 = "Watch me Turli, this is how it's done%.",
    SAM_DSR_LY_TURLI_P1_3 = "That was just a taste of what's to come%.",
    SAM_DSR_LY_TURLI_P1_4 = "Je lance la première manche", -- TODO
    SAM_DSR_LY_TURLI_P1_5 = "Je me charge de la première reprise, Ly", -- TODO
    SAM_DSR_LY_TURLI_P1_6 = "You looked a little too eager to kill our hounds for my taste%.",
    SAM_DSR_LY_TURLI_P1_7 = "Don't get up, Ly%. This will just be a moment%.",
    SAM_DSR_LY_TURLI_P1_8 = "Le vrai combat commence", -- TODO
    SAM_DSR_LY_TURLI_P1_9 = "My hounds will sear your flesh%.",
    SAM_DSR_LY_TURLI_P1_10 = "You pass%. Barely%.",
    SAM_DSR_LY_TURLI_P2_1 = "I don't wish to hog all the excitement%. Turli, why don't you get in on the action%?",
    SAM_DSR_LY_TURLI_P2_2 = "Je t'ai déjà vu plus vaillant, Ly", -- TODO
    SAM_DSR_LY_TURLI_P2_3 = "That was a limp performance, Turli%. I'll show them what true power is%.",
    SAM_DSR_LY_TURLI_P2_4 = "If you're done sulking, Ly, some assistance would be welcome%.",
    SAM_DSR_LY_TURLI_P2_5 = "I thought you'd never ask%.",
    SAM_DSR_LY_TURLI_P2_6 = "I don't want to finish them off before you get a crack at them, Ly%.",
    SAM_DSR_LY_TURLI_P2_7 = "Faisons couler le sang", -- TO DO
    SAM_DSR_LY_TURLI_P2_8 = "Come on, Turli, lets secure the victory%.",
    SAM_DSR_LY_TURLI_P2_9 = "It would seem my bad luck has rubbed off on you, Ly%.",
    SAM_DSR_TALERIA = "Barging into a lady's private chambers%. You are bold%.",
    SAM_SE_YASEYLA = "Votre sorcellerie trompe les gens de bien", --TODO
    SAM_SE_TWELVANE = "Why do you still hesitate, Vanton%?",
    SAM_SE_ANSUUL = "Elle me fait du mal" --TODO
}

for key, value in pairs(bossLines) do
    SafeAddVersion(key, 1)
    ZO_CreateStringId(key, value)
end