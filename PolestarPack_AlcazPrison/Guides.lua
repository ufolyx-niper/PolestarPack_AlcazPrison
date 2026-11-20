local addon = ...
local pack = "alcaz-prison"
if not Polestar.RegisterPack({
    addon = addon,
    id = pack,
    title = "奥卡兹监狱",
    author = "Codex",
    version = "0.1.1",
    format = 11,
    license = "MIT",
    source = "WoW Forever. See README.md for quest and coordinate sources.",
}) then return end

local marsh = 1445
local eitrigg = {3144, "伊崔格", 1454, 34.6, 38.6}
local nazeer = {4791, "纳泽尔·血矛", marsh, 35.3, 30.7}
local ulka = {260383, "Sergeant Ulka", marsh, 70.3, 19.0}

-- Keep the English journal titles as fallbacks until the client resolves them.
local missing, elite, report = 95283, 95284, 95285
local rescue, payback, bandanas = 95309, 96332, 96334
local titles = {
    [missing] = "The Missing Kor'kron",
    [elite] = "The Elite of the Elite",
    [report] = "Right Place, Wrong Time",
    [rescue] = "No Orc Left Behind",
    [payback] = "A Little Payback",
    [bandanas] = "Blood Red Bandanas",
}

local function questGoal(verb, quest, npc, note)
    return {
        t = verb, quest = quest, title = titles[quest], note = note,
        npc = npc[1], npcName = npc[2], map = npc[3], x = npc[4], y = npc[5],
    }
end

local function accept(quest, npc, note, prerequisite, closedBy)
    local goal = questGoal("accept", quest, npc, note)
    goal.minLevel, goal.qlvl = 48, 53
    goal.preAll = prerequisite and {prerequisite} or nil
    goal.closedBy = closedBy
    return goal
end

local function turnin(quest, npc, note)
    return questGoal("turnin", quest, npc, note)
end

local function step(title, ...)
    return {title = title, goals = {...}}
end

local function note(text)
    return {t = "note", text = text}
end

-- A later quest is enough to skip an earlier pickup the player already passed.
-- The shared Mason quests don't count as progress on the Kor'kron chain.
local afterReport = {rescue, payback, bandanas, 95454, 96369, 95483}
local afterElite = {report, unpack(afterReport)}
local afterMissing = {elite, unpack(afterElite)}

Polestar.RegisterGuide({
    id = pack .. "/horde-pickups",
    pack = pack,
    title = "奥卡兹监狱 · 部落进本前接任务",
    category = "Miscellaneous",
    faction = "Horde",
    minLevel = 48,
    maxLevel = 53,
    zone = marsh,
    zoneName = "尘泥沼泽",
    keywords = {"奥卡兹监狱", "奥卡兹岛", "Alcaz Prison", "前置", "部落"},
    version = 1,
    why = "从奥格瑞玛经蕨墙村到奥卡兹岛，进门前接齐 3 个部落副本任务。",
    steps = {
        step("奥格瑞玛 · 找伊崔格",
            accept(missing, eitrigg,
                "去智慧谷找伊崔格（约 34.6, 38.6）。若你已在蕨墙村且纳泽尔直接给下一步，可以先接他的任务。", nil, afterMissing)),
        step("尘泥沼泽 · 蕨墙村接下一步",
            turnin(missing, nazeer, "在蕨墙村找纳泽尔·血矛（约 35.3, 30.7，村内还有 36.4, 31.0 的记录）。"),
            accept(elite, nazeer, "接好后往东北岸走，从岛西侧上岸。岛上有精英，组队过去更稳。", nil, afterElite)),
        step("奥卡兹岛 · 听 Ulka 交代情况",
            turnin(elite, ulka, "到尘泥沼泽大地图 70.3, 19.0 附近找 Sergeant Ulka。"),
            accept(report, ulka, "接取后继续和 Ulka 对话，问清岛上的情况。", elite, afterReport),
            questGoal("complete", report, ulka, "继续和 Ulka 对话，问清岛上的情况。")),
        {
            title = "奥卡兹岛 · 向 Ulka 交任务",
            when = {{k = "complete", q = report}},
            goals = {turnin(report, ulka, "听完在原地交任务，解锁下面三个副本任务。")},
        },
        {
            title = "进本前 · 在 Ulka 处接齐三个任务",
            when = {{k = "turnedin", q = report}},
            goals = {
                accept(rescue, ulka, "进本后在牢房找 Commander Folkar。", report),
                accept(payback, ulka, "进本后杀 15 个士兵、8 个女巫，拿 Ca'zass 的头。出本后回 Ulka 处交。", report),
                accept(bandanas, ulka, "进本后从人类守卫身上捡 8 条红头巾，回奥格瑞玛交给伊崔格。", report),
                note("要做 Mason Connery 的囚犯支线，进门前先跟队友说，留着 The Questioner，接到拿钥匙的任务再回头打。"),
            },
        },
        {
            title = "前往奥卡兹监狱入口",
            when = {{k = "level", op = ">=", n = 48}},
            goals = {
                {t = "goto", map = marsh, x = 75.3, y = 14.1, location = "奥卡兹监狱入口",
                    note = "从岛北面的塔楼进去，下到地下室找传送门。"},
                note("本内先交 No Orc Left Behind，再从 Folkar 接 The Honor of the Kor'kron。尾王后的香水便笺接 Bad News for Folkar，回牢房找 Folkar，再把消息带给奥格瑞玛的萨尔。"),
                note("可选囚犯支线：尾王附近找 Mason 接 The Man in the Iron Chains，回去打 The Questioner 拿钥匙。后续 More Valuable Than Gold 去西部荒野。如果已杀 The Questioner 又拿不到钥匙，可留到下个副本进度。"),
            },
        },
    },
})
