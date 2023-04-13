/// @description Day duration

if (alpha_transition <= night_alpha)
{
	alpha_transition += 0.01;
	alarm[0] = 1;
}