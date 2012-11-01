[% INCLUDE index.tpl %]
[% BLOCK main %]
	[% FOREACH post IN posts %]
	<div class="well">
		<h4><a href="[% config.baseuri %][% post.blogpath %]">[% post.caption %]</a></h4>
		<div>
			[% post.content %]
			<div style="border-top: 1px solid #c4c4c4">
				posted [% date.format(post.date, '%d.%m.%y %H:%M:%S') %]
			</div>
		</div>
	</div>
	[% END %]
	[% IF prev %]
		<a href="[% prev %]">newer posts</a>
	[% END %]
	[% IF next %]
		<a href="[% next %]">older posts</a>
	[% END %]
[% END %]
[% BLOCK header %]
  <link href="[% config.baseuri %]/blog/feed/atom.xml" rel="alternate" title="[% config.sitetitle %] atom feed" type="application/atom+xml" />
[% END %]
