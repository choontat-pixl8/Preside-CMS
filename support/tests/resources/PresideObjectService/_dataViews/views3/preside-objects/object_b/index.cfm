<cfscript>
	param name="args.title"           type="string" field="label";
	param name="args.datecreated" type="string";
</cfscript>

<cfoutput>
	<h1>#args.title#</h1>
	<p> #args.datecreated#</p>
</cfoutput>