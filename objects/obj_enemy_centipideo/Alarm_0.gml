/// @description Attack player

if (player_distance <= distance_attack_player) attack();
alarm[0] = room_speed * attack_cooldown;