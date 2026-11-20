# 奥卡兹监狱 · 部落进本前接任务

适用于 WoW Forever，角色 48 级可接。需要 Polestar 0.4.1 或更新版本。

从 0.1.0 升级时，Polestar 0.4.1 起能保留进行到 Ulka 对话的旧进度。

## 安装

将 ZIP 解压到 Forever 的 `Interface/AddOns`，确认 `PolestarPack_AlcazPrison` 下面直接有同名 TOC 和 `Guides.lua`。重启客户端，部落角色输入 `/polestar guides`，搜索「奥卡兹监狱」。

## 路线

| 顺序 | 位置和 NPC | 任务 |
| --- | --- | --- |
| 1 | 奥格瑞玛智慧谷，约 34.6, 38.6，伊崔格 | 接 The Missing Kor'kron（95283） |
| 2 | 尘泥沼泽蕨墙村，约 35.3, 30.7，纳泽尔·血矛 | 交 95283，接 The Elite of the Elite（95284） |
| 3 | 尘泥沼泽奥卡兹岛，约 70.3, 19.0，Sergeant Ulka | 交 95284，接 Right Place, Wrong Time（95285），继续和 Ulka 对话 |
| 4 | 同一位 Sergeant Ulka | 任务显示可交付后，原地交 95285 |
| 5 | 同一位 Sergeant Ulka | 接 No Orc Left Behind（95309）、A Little Payback（96332）、Blood Red Bandanas（96334） |
| 6 | 奥卡兹岛北侧塔楼，尘泥沼泽 75.3, 14.1 | 进塔下到地下室找传送门 |

地图上的「0/8」统计已完成的任务。进本前要带进日志的是步骤 5 的三项。其余五项包括从 Folkar 推进的 95454、96369、95483，以及 Mason Connery 的可选支线 96335、96337。96332 出本交给 Ulka，96334 回奥格瑞玛交给伊崔格，95483 交给萨尔。

要做囚犯支线，进门前告诉队友留着 The Questioner。到尾王附近先接 Mason 的任务，再回头杀 The Questioner 拿钥匙。后续线索指向西部荒野月溪镇。若打早了又拿不到钥匙，可以留到下个副本进度。

## 核对依据

- 本机 Dungeon Quest Atlas 的 ALCAZ 任务表和按阵营计算进度的逻辑，用于核对部落可见任务 ID 和入口坐标。
- [Wowhead 奥卡兹监狱指南](https://www.wowhead.com/forever/guide/alcaz-prison-dungeon-overview-location-rewards)与 [Icy Veins 任务地图](https://db.icy-veins.com/wow-forever/quests/95284)用于交叉核对任务链和 NPC。伊崔格和纳泽尔有略有偏差的地图记录，按村落及 NPC 名找。Ulka 使用尘泥沼泽大地图坐标。
- [Icy Veins 开始任务](https://db.icy-veins.com/wow-forever/quests/95283)、[Ulka 对话](https://db.icy-veins.com/wow-forever/quests/95285)、[96332 目标](https://db.icy-veins.com/wow-forever/quests/96332)和 [96334 目标和交付点](https://db.icy-veins.com/wow-forever/quests/96334)。资料确认 95283 是常规起点，任务数据对 95284 是否必须交过 95283 缺少明确记录。指南保留常规顺序，读到后续任务即可跳过更早的接取。
- [Folkar 后续](https://undying.app/dungeons/alcaz-prison)和 [Wowhead 囚犯支线实测](https://www.wowhead.com/forever/guide/alcaz-operative-disguise-toy-secret-walkthrough)用于核对本内提醒。
- NPC 伊崔格、纳泽尔·血矛的简中名来自 QuestieDB 语言表，后者也与本机简中缓存一致。其余未核实的简中名称保留英文，由 Polestar 按 ID 读取客户端能提供的名称。
