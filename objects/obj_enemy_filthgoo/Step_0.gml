event_inherited();

audio_emitter_position(emitter, x, y, 0);
audio_emitter_velocity(emitter, hspeed, vspeed, 0);

var gain = 1 - (min(player_distance, distance_to_player_listen)/distance_to_player_listen)
audio_emitter_gain(emitter, gain);