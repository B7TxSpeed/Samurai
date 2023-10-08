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
    SAM_SS_NAHVIINTAAS = "Pour ramener l'ordre naturel%. Reprendre ce qui fut et ce qui sera%. Corriger l'erreur mortelle%.",
    SAM_KA_FALGRAVN = "Vous osez m'affronter",
    SAM_DSR_TALERIA = "Vous vous invitez dans les appartements",
    SAM_SE_TWELVANE = "Pourquoi hésitez%-vous encore, Vanton"
}

for key, value in pairs(bossLines) do
    SafeAddVersion(key, 2)
    ZO_CreateStringId(key, value)
end