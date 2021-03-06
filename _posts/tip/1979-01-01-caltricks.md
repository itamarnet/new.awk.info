---
layout: default
title: 'Fun with "cal"'
tags: [tip, cal, external_links]
permalink: /tip/caltricks.html
---

# {{ page.title }}

## Author

[Walter Ferlazzo][1], 2003.

## Background

Some time ago, it was shown the use of the cal shell command to generate
a calendar of the current month. Another more recent hint talked about
using  this utility to have a desktop calendar, a simple solution that
I enjoyed a lot.

But something wasn't perfect for me, so I did a little study on the
subject to solve some problems and enhance the display of cal. I know
that I could have used other programs or AppleScript and lived happily,
but I wanted to use only shell scripting (so geeky ... but fun). Read
the rest of the hint for my efforts.

All examples below are a one single line of code, and you should be able
to copy and paste them directly into your Terminal. Let's start:

## First day of week

What if first day of week is Monday, not Sunday? cal has no flag to
solve the problem, so I did a little scripting and solved it this way:

{% highlight sh %}
cal | awk '{ print " "$0; getline; print " Mo Tu We Th Fr Sa Su"; \
getline; if (substr($0,1,2) == " 1") print "                    1 "; \
do { prevline=$0; if (getline == 0) exit; print " " \
substr(prevline,4,17) " " substr($0,1,2) " "; } while (1) }'
{% endhighlight %}

Here is the result:

	      June 2004
	 Mo Tu We Th Fr Sa Su
	     1  2  3  4  5  6 
	  7  8  9 10 11 12 13 
	 14 15 16 17 18 19 20 
	 21 22 23 24 25 26 27 
	 28 29 30  

## Mark current day

Next, it would be handy to display the current day number at the left
of the month's name and in the calendar itself. Here it is:

{% highlight sh %}
echo `date "+%d %B %Y"` | awk \
'{ print substr("          ",1,(21-length($0))/2) $0; }'; \
cal | awk '{ getline; print " Mo Tu We Th Fr Sa Su"; getline; \
if (substr($0,1,2) == " 1")  print "                    1 "; \
do { prevline=$0; if (getline == 0) exit; print " "\
substr(prevline,4,17) " " substr($0,1,2) " "; } while (1) }' | \
awk -v cday=`date "+%d"` '{ fill=(int(cday)>9?"":" ");    \
a=$0; sub(" "fill int(cday)" ","*"fill int(cday)"*",a); print  a }'\
{% endhighlight %}

Here is the result:

	    25 June 2004
	 Mo Tu We Th Fr Sa Su
	     1  2  3  4  5  6 
	  7  8  9 10 11 12 13 
	 14 15 16 17 18 19 20 
	 21 22 23 24*25*26 27 
	 28 29 30  

## Localization

At last, I want the calendar localized without changing the locale of the
shell (it seems that locale is not supported in Darwin. Hints?). Let's
localize it in Italian:

{% highlight sh %}
echo `date "+%d/%m/%Y"` | \
awk '{ split("Gennaio/Febbraio/Marzo/Aprile/Maggio/Giugno/Luglio/Agosto/\
Settembre/Ottobre/Novembre/Dicembre",arr,"/"); \
split($0,arg,"/"); a=" " int(arg[1]) " " arr[int(arg[2])] " " arg[3]; \
print substr("          ",1,(21-length(a))/2) a; }' ; cal | \
awk '{ getline; print " Lu Ma Me Gi Ve Sa Do"; getline; \
if (substr($0,1,2) == " 1")  print "                    1 "; \
do { prevline=$0; if (getline == 0) exit; print " " substr(prevline,4,17) \
" " substr($0,1,2) " "; } while (1) }' | awk -v cday=`date "+%d"` \
'{ fill=(int(cday)>9?"":" ");     a=$0; sub(" "fill int(cday)" ",\
"*"fill int(cday)"*",a); print  a }'
{% endhighlight %}

Here is the result:

	    25 Giugno 2004
	 Lu Ma Me Gi Ve Sa Do
	     1  2  3  4  5  6 
	  7  8  9 10 11 12 13 
	 14 15 16 17 18 19 20 
	 21 22 23 24*25*26 27 
	 28 29 30  

By simply changing the "months" string, you can localize this script for
any language. You can also change the day delimiter (\*) (in the section
"\*"fill int(cday)"\*" to whatever you like -- I got a better display with
""). I presume some parts of my script could be written in a smarter way,
by the way it works. Hope this can be useful for some of you.

## For more...

See [maxosxhints][2] for more cal/awk tips.

[1]: http://www.jaw.it/
[2]: http://www.macosxhints.com/users.php?mode=profile&uid=1005884
