/// Description: SlideTransition(mode,targetroom)
/// Argument: Mode sets transition mode between next, restart and goto.
/// Argument: Target sets target room when using goto mode.

with (o_transition)
{
	mode = argument[0]; 
	if (argument_count > 1) target = argument[1];
}