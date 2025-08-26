scoreboard objectives add health health
scoreboard objectives setdisplay below_name health
scoreboard objectives modify health displayname {"text":"❤️","color":"red"}

function blazeandcave:config/intro_msg_off
function blazeandcave:config/item_rewards_off
function blazeandcave:config/trophies_first_team
function blazeandcave:config/coop_on_team
function blazeandcave:config/scoreboard_bac_advancements

scoreboard players set #load_status hamcraft_init 1