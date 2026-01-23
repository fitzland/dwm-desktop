void
shift(unsigned int *tag, int i)
{
	if (i > 0) /* left circular shift */
		*tag = ((*tag << i) | (*tag >> (LENGTH(tags) - i)));
	else       /* right circular shift */
		*tag = (*tag >> (- i) | *tag << (LENGTH(tags) + i));
}

/* view the next/prev tag */
void
shiftview(const Arg *arg)
{
	Arg shifted = { .ui = selmon->tagset[selmon->seltags] };

	shift(&shifted.ui, arg->i);
	view(&shifted);
}

/* view the next/prev tag that has a client, else view the next/prev tag */
void
shiftviewclients(const Arg *arg)
{
	Arg shifted = { .ui = selmon->tagset[selmon->seltags] };
	Client *c;
	unsigned int tagmask = 0;

	for (c = selmon->clients; c; c = c->next)
		tagmask = tagmask | c->tags;

	do
		shift(&shifted.ui, arg->i);
	while (tagmask && !(shifted.ui & tagmask));

	view(&shifted);
}

/* move the active window to the next/prev tag and view it's new tag */
void
shiftboth(const Arg *arg)
{
	Arg shifted = { .ui = selmon->tagset[selmon->seltags] };

	shift(&shifted.ui, arg->i);
	tag(&shifted);
	view(&shifted);
}
