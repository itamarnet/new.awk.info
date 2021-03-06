---
layout: default
title: Faster Hashing in Mawk
tags: [mawk, hashing, external_links, news]
permalink: /news/mawkHashing.html
---

Faster Hashing in Mawk
======================

_J. Mellander reports in [comp.lang.awk][1] how to make Mawk's hashing
run 20+ times faster._

Recently, for a project, I had the occasion to use mawk - I have a list
of ~12,000,000 Unix timestamps to nanosecond precision that I needed
to match the first field of every record in a number of huge files.
Gawk couldn't handle the number of records, and so I used mawk, as being
more memory thrifty.  The program was a one-liner like this:

{% highlight awk %}
mawk 'FNR==NR {x[$1]++;next} $1 in x}' timestamp_file log_file
{% endhighlight %}

which works perfectly, but the run time seemed excessive - many hours
per log file - which made me think that the hashing function was causing
many collisions, and thus hash chaining...

When stuck in a slow meeting, I started looking at the mawk source
code, specifically the hashing functions, of which there are 2: hash()
in hash.c & ahash() in array.c

I was surprised to find that the hashing functions in both cases
essentially just sum the bytes of the key to create the hash - this
means that 123, 321, 213, etc. would all hash to the same location and
cause collisions, and hash chaining.

Modifying the hashing to a more efficient hash caused an enormous gain
in efficiency, as in this test:

{% highlight sh %}
$ wc -l j
2999999 j

$ time mawk-1.3.3/mawk '{x[$1]++}' j >/dev/null

real    2m24.362s
user    2m20.174s
sys     0m0.663s

$ time mawk-1.3.3a/mawk '{x[$1]++}' j >/dev/null

real    0m6.607s
user    0m6.146s
sys     0m0.241s
{% endhighlight %}

mawk-1.3.3a has the below modifications. In hash.c I replaced the 'hash'
function with:

{% highlight c %}
/*
FNV-1 hash function, per en.wikipedia.org/wiki/Fowler-Noll-
Vo_hash_function
*/
unsigned hash(s)
register char *s ;
{
	register unsigned h = 2166136261 ;
	while (*s) h = (h * 16777619) ^ *s++ ;
	return h ;
}
{% endhighlight %}

and in array.c replaced 'ahash' with:

{% highlight c %}
/*
FNV-1 hash function, per en.wikipedia.org/wiki/Fowler-Noll-
Vo_hash_function
*/
static unsigned ahash(sval)
STRING* sval ;
{
	register unsigned h = 2166136261 ;
	register char *s = sval->str;

	while (*s) h = (h * 16777619) ^ *s++ ;
	return h ; 
}
{% endhighlight %}

[1]: http://groups.google.com/group/comp.lang.awk/browse_thread/thread/0b9e369234f79bbe#
