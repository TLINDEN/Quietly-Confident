# Introduction

**Quietly Confident** is a static site generator written in perl.

It is git-aware, which means it is able to use a repository as
the source of pages to generate. **Quietly Confident** understands
textfiles as sources in the following formats:

* [Markdown](http://daringfireball.net/projects/markdown/). It considers
  files with the suffix *.md* or *.txt* to be markdown files.

* [Perl Pod](http://perldoc.perl.org/perlpod.html). POD is a relatively
  simple format and widely known among perl developers.

* HTML. You may just put HTML files as source. **Quietly Confident**
  will remove anything not needed as: anything between `<head>..</head>`,
  `<html>` and `<body>` tags. It will also remove any `<font>` or `<span>` tags
  and any occurence of *style* or *class* attributes. This conversion
  enables you to use the HTML output produced by MS Word. Just in case,
  not that I encourage you to do so :)

**Quietly Confident** does not support any meta data in a source file,
as can be seen with many other static site generators (in most cases
added as YAML on top of the markdown source). The reason: the first adopter
of **Quietly Confident** will be my wife. And for her it must be as simple
as ever possible. So, no fiddling with special things and formats.

The tool generates menus and submenus as well.

# Installation

Download the source:

	$ git clone https://github.com/TLINDEN/Quietly-Confident.git
	$ cd Quietly-Confident

or:

	$ wget http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/Quietly-Confident-0.04.tar.gz
	$ tar xfz Quietly-Confident-0.04.tar.gz
	$ cd Quietly-Confident-0.04

Install it:

	$ perl Makefile.PL
	$ make
	$ sudo make install

Please note that **Quietly Confident** has some dependencies, which can
be installed using *CPAN*:

	$ cpan
	cpan[1]> i Git::Repository
	cpan[1]> i Text::Markdown
	cpan[1]> i Moo
	cpan[1]> i Template
	cpan[1]> i HTTP::Server::Brick
	cpan[1]> i Config::General

You're done with install.

# Quick Start

To try **Quietly Confident** for the first time, you can use it
to create the required directory structure for you.

First, create a new empty directory somewhere:

	$ mkdir mysite

Now let **Quietly Confident** create the directories and put some
files to start with in it:

	$ qc init
	Creating qc.conf
	Creating directories
	mkdir source
	mkdir public_html
	mkdir templates
	Creating basic templates
	Creating static site

This will create the following directories:

	qc.conf
	source/
	source/01-Projects/
	source/01-Projects/index.md
	source/01-Projects/Something.md
	source/index.md
	source/about.md
	public_html/
	public_html/css
	public_html/css/local.css
	public_html/css/bootstrap-responsive.css
	public_html/css/bootstrap.min.css
	public_html/js/
	public_html/js/bootstrap.js
	public_html/js/html5.js
	public_html/js/jquery.js
	public_html/favicon.ico
	templates/
	templates/page.tpl
	templates/index.tpl

Well, this doesn't look that simple, does it? But calm down,
you don't have to cope with most of the stuff, unless you want to.

The most interesting part for you is the *source/* directory. It contains
the source files and directories from which the static site will
be generated.

The *public_html/* directory is where the actual static pages will
be written to and from which they have to be served to the internet.

Finally the *templates/* directory contains the templates used
for the site. In the default site (which we created here), a basic
[Boostrap](http://twitter.github.com/bootstrap/)-based design will
be used. You can use it as a starting point or throw it away and
write your own. Templates are [Template::Toolkit](http://www.template-toolkit.org/index.html)
formatted, which is very simple to use AND very flexible. However,
for now ignore this.

To see how it looks, you might just fire up the built-in
webserver:

	$ qc serve
	[Tue Oct 30 23:32:03 2012] [49876] Mounted wildcard directory at /
	[Tue Oct 30 23:32:03 2012] [49876] Server started on http://clearair.intern:8080/

Just point your browser to the displayed uri and there you go.

# Details on source tree organisation

There are a few rules which you may follow to keep your site
organized:

* generated url's will always end with / and be normalized. Say
  you've got a file *01-Undone Projects/Mikey Mouse.md*. The url
  generated for this file will be: */undone-projects/mikey-mouse/*.

* to order menu entries as you wish, prepend your filenames and
  directories with numbers like *01-Projects*, *02-About.md*. 
  Those numbers will be removed and only used internaly for ordering.

* if you want to put an image into a page, just put the image
  somewhere inside the source directory. It doesn't matter, where.
  Refer to the image in your page without any directory.
  **Quietly Confidence** will move the image to the *public_html/images/*
  directory and modify the *img* html tag accordingly.


# Using a git repository as the source

Earlier I claimed that **Quietly Confidence** git-aware. Ok let's take a look.

Suppose, you already followed the steps outlined above to
create a basic static site directory structure. Now you can
just put the source directory to github:

	$ cd source
	$ git init
	$ git add *
	$ git commit -m 'first commit'
	$ git remote add origin https://github.com/[Insert your Account]/MySite.git
	$ git push -u origin master

No more to do. From now on, **Quietly Confidence** will check the
repository state for each file and directory.

You can use this feature in combination with the **daemon** function
of **Quietly Confidence**. For this you might need an internet-accessible
webspace (heroku service will do as well), where you install **Quietly Confidence**.
There you clone your git repository which contains the site sources and
attach **Quietly Confidence** to it:

	$ qc daemon

By using this command, **Quietly Confidence** will detach itself from
the terminal and run in the background. It will then watch the git repository
regularly for any changes. If something happens, it will re-generate
the static site. Just point some webserver, lighty or apache or whatever
else you have at hands, to the *public_html/* directory and that's it.
If the source directory is not a git repository it looks for filesystem
changes.

The daemon mode maintains a pidfile in the working directory, usually
named *qc.pid* (can be changed in config file). You can also specify
the working directory as the second commandline parameter, which maybe
required if you want to run it from a system startup script. An example
startup script fro FreeBSD is contained in the source directory. If
you're using some other non-*BSD unix-mimicking OS, you've got to
write your own startup script. sorry.

You might also run the the daemon mode in the foreground without
detaching for troubleshooting purposes. For this execute:

	$ qc watch

# What kind of weird name is this for a static site generator?

In case if you wonder why I named the tool **Quietly Confidence**: in
the first place I had something like 'gitweb' or 'staticgit' and such
generica in mind. But none of them really fitted and in addition sounded
way too boring.

I'm a huge fan of Ian Banks *The Culture* series. The stories are
especially famous for its spaceship naming scheme. One of those ships
is a General Systems Vehicle with the name **Sleeper Service** which
first occurred in [Excession](http://en.wikipedia.org/wiki/Excession).
The ships name is not the original one however, it renamed itself sometime.
The original name before renaming were - you guess it - **Quietly Confidence**.
In addition the abbreviation **qc** gives a cool and short command as well.

So. I named my tool like a spaceship in honor to the said ship, which
I liked very much, and in honor to Ian Banks who created one of the
best scify novels I've ever read.

You might read more about the **Quietly Confidence** on its
wikipedia page: [GSV Sleeper Service](http://en.wikipedia.org/wiki/GSV_Sleeper_Service).

# Bugs and issues

One might assume that the version number **0.04** suggests that
the tool is in a quite early stage. Well, that's right. Just file
an issue at Github if you find a bug or think it doesn't behave
as predicted. Patches are most welcome though.

# One last thing

There are thousands of static site generators out there. Why the *ckin
hell did you create another one? In fact I tried some of them, something about
20 different tools. None satisfied my needs: maximum simple input format.
Some are using ruby, which I don't use by principle. Some are too old
and old-fashioned. Some just didn't work.
