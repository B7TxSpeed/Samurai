local bossLines = {
    SAM_HOF_FACTOTUM = "Intéressant%. Ces appareils se sont tous réinitialisés%. Ce n'est pas moi%.",
    SAM_HOF_COMMITEE = "Ah, vous voilà enfin",
    SAM_HOF_AG_SPAWN = "C'est le deuxième plus gros assemblage que j'aie jamais vu%.",
    SAM_HOF_AG_P1 = "Attaquez les terminaux secondaires !",
    SAM_HOF_AG_P2 = "Il contourne mes modifications ! Interrompez tout de suite les terminaux secondaires !",
    SAM_HOF_AG_P3 = "Les terminaux secondaires essaient de compenser ! Donnez%-leur une claque !",
    SAM_MOL_ZHAJHASSA = "Non... C'est... un piège%.",
    SAM_MOL_RAKKHAT = "Vous ne m'avez pas entendu",
    SAM_AA_VARLARIEL = "La Céleste Mage",
    SAM_AA_MAGE = "Et maintenant, mortels, vous allez mourir",
    SAM_SS_NAHVIINTAAS = "Pour ramener l'ordre naturel%. Reprendre ce qui fut et ce qui sera%. Corriger l'erreur mortelle%.",
    SAM_KA_FALGRAVN = "Vous osez m'affronter",
    SAM_RG_BAHSEI = "La grande Xalvakka",
    SAM_DSR_LY_TURLI_P1_1 = "Avancez, chiens",
    SAM_DSR_LY_TURLI_P1_2 = "Regarde%-moi, Turli",
    SAM_DSR_LY_TURLI_P1_3 = "Ce n'était qu'un avant goût",
    SAM_DSR_LY_TURLI_P1_4 = "Je lance la première manche",
    SAM_DSR_LY_TURLI_P1_5 = "Je me charge de la première reprise, Ly",
    SAM_DSR_LY_TURLI_P1_6 = "Vous aviez l'air un peu trop impatients de tuer nos chiens",
    SAM_DSR_LY_TURLI_P1_7 = "Ne te lève pas, Ly",
    SAM_DSR_LY_TURLI_P1_8 = "Le vrai combat commence",
    SAM_DSR_LY_TURLI_P1_9 = "Mes chiens arracheront votre chair",
    SAM_DSR_LY_TURLI_P1_10 = "Vous êtes acceptables",
    SAM_DSR_LY_TURLI_P2_1 = "Turli, et si tu venais jouer aussi",
    SAM_DSR_LY_TURLI_P2_2 = "Je t'ai déjà vu plus vaillant, Ly",
    SAM_DSR_LY_TURLI_P2_3 = "C'était assez décevant, Turli",
    SAM_DSR_LY_TURLI_P2_4 = "Si tu as fini de bouder, Ly, ton aide serait bienvenue",
    SAM_DSR_LY_TURLI_P2_5 = "J'ai cru que tu ne me le demanderais jamais",
    SAM_DSR_LY_TURLI_P2_6 = "Je ne veux pas les achever avant que tu n'aies pu les attaquer, Ly",
    SAM_DSR_LY_TURLI_P2_7 = "Faisons couler le sang",
    SAM_DSR_LY_TURLI_P2_8 = "Viens, Turli, remportons la victoire",
    SAM_DSR_LY_TURLI_P2_9 = "On dirait que ma malchance déteint sur toi, Ly",
    SAM_DSR_TALERIA = "Vous vous invitez dans les appartements",
    SAM_SE_YASEYLA = "Votre sorcellerie trompe les gens de bien",
    SAM_SE_TWELVANE = "Pourquoi hésitez%-vous encore, Vanton",
    SAM_SE_ANSUUL = "Elle me fait du mal"
}

for key, value in pairs(bossLines) do
    SafeAddVersion(key, 2)
    ZO_CreateStringId(key, value)
end