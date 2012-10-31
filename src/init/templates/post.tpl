[% INCLUDE index.tpl %]
[% BLOCK main %]
<div class="well">
	<h4><a href="[% config.baseuri %][% post.blogpath %]">[% post.caption %]</a></h4>
	<div>
		[% post.content %]
	</div>
	<div style="border-top: 1px solid #c4c4c4">
		gepostet am [% date.format(post.date, '%d.%m.%y %H:%M:%S') %]
	</div>
</div>
[% END %]
[% BLOCK header %]
[% END %]