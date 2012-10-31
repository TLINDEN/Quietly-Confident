<?xml version="1.0" encoding="ISO-8859-1"?>
<feed
   xmlns="http://www.w3.org/2005/Atom"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:admin="http://webns.net/mvcb/"
>
   <link href="[% config.baseuri %]/blog/feed/atom.xml" rel="self"
         title="[% config.sitetitle %] atom feed" type="application/atom+xml" />
   <author><name></name></author>
   <title>[% config.sitetitle %] atom feed</title>
   <subtitle type="html"></subtitle>
   <id>[% config.baseuri %]/blog/</id>
   <updated>[% date.format(updated) %]</updated>
   <dc:language>de</dc:language>
   <admin:errorReportsTo rdf:resource="mailto:" />

   [% FOREACH post IN posts %]
     <entry>
        <link href="[% config.baseuri %][% post.blogpath %]" rel="alternate" title="[% post.caption %]"/>
        <author>
            <name>[% post.by %]</name>
            <email>hidden</email>
        </author>
        <published>[% date.format(post.date) %]</published>
        <updated>[% date.format(post.date) %]</updated>
        <id>[% config.baseuri %][% post.blogpath %]</id>
        <title type="html">[% post.caption %]</title>
        <content type="html"><![CDATA[
	       [% post.content %]
        ]]></content>
     </entry>
   [% END %]
</feed>
