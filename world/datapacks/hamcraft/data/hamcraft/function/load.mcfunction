scoreboard objectives add hamcraft_init dummy
scoreboard players set #load_status hamcraft_init 0
execute unless score #load_status hamcraft_init matches 1 run function hamcraft:init