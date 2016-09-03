Structure
---------

Each directory corresponds to a race.
For example, `0` is human, `1` is dwarf, etc.
For a full list, see [`src/p3600/race.lua`](../../../../src/p3600/race.lua)

Here is what the directories mean:

| Directory           | Description                                                                                  |
|:------------------- |:-------------------------------------------------------------------------------------------  |
| `/body`             | All the different bodies for procedurally generated creatures. (naked, clothes are seperate) |
| `/body/0.tga`       |  Unsexed                                                                                     |
| `/body/1.tga`       |  Male                                                                                        |
| `/body/2.tga`       |  Female                                                                                      |
| `/body/3.tga`       |  Hermaphrodite                                                                               |
| `/equip`            | All of the equipment sprites. They are drawn over the body, but under the hair.              |
| `/equip/(ID)`       |  An item.                                                                                    |
| `/equip/(ID)/0.tga` |   Unsexed version.                                                                           |
| `/equip/(ID)/1.tga` |   Male version.                                                                              |
| `/equip/(ID)/2.tga` |   Female version.                                                                            |
| `/equip/(ID)/3.tga` |   Hermaphrodite version.                                                                     |
| `/hair`             | All the different hairstyles for procedurally generated creatures. Drawn over everything.    |
| `/hair/0.tga`       |  Unsexed                                                                                     |
| `/hair/1.tga`       |  Male                                                                                        |
| `/hair/2.tga`       |  Female                                                                                      |
| `/hair/3.tga`       |  Hermaphrodite                                                                               |
| `/p`                | Default player skin for the race. (also naked, clothes are seperate)                         |
| `/p/0.tga`          |  Unsexed                                                                                     |
| `/p/1.tga`          |  Male                                                                                        |
| `/p/2.tga`          |  Female                                                                                      |
| `/p/3.tga`          |  Hermaphrodite                                                                               |
