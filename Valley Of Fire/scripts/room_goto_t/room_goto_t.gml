if !instance_exists(o_transf)
{
	var a;
	a = instance_create_depth(0, 0, -100, o_transf);
	a.rm = argument0;
}