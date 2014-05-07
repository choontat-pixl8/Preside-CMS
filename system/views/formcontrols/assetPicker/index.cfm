<cfscript>
	inputName          = args.name             ?: "";
	inputId            = args.id               ?: "";
	placeholder        = args.placeholder      ?: "";
	defaultValue       = args.defaultValue     ?: "";
	remoteUrl          = args.remoteUrl        ?: "";
	prefetchUrl        = args.prefetchUrl      ?: "";
	browserUrl         = args.browserUrl      ?: "";
	sortable           = args.sortable         ?: "";
	multiple           = args.multiple         ?: "";
	resultTemplate     = selectedTemplate = '<div class="asset-result-container"><div class="icon-container">{{{icon}}}</div> <div class="folder-and-text"><span class="folder">{{folder}}</span> <span class="title">{{text}}</span></div></div>';
	resultTemplateId   = "result_template_" & CreateUUId();
	selectedTemplateId = "selected_template_" & CreateUUId();

	value = event.getValue( name=inputName, defaultValue=defaultValue );
	if ( not IsSimpleValue( value ) ) {
		value = "";
	}
</cfscript>

<cfoutput>
	<script type="text/mustache" id="#resultTemplateId#">#resultTemplate#</script>
	<script type="text/mustache" id="#selectedTemplateId#">#selectedTemplate#</script>
	<select class="asset-picker"
	        name="#inputName#"
	        id="#inputId#"
	        tabindex="#getNextTabIndex()#"
	        data-placeholder="#placeholder#"
	        data-sortable="#( IsBoolean( sortable ) && sortable ? 'true' : 'false' )#"
	        data-value="#value#"
	        data-prefetch-url="#prefetchUrl#"
	        data-remote-url="#remoteUrl#"
	        data-browser-url="#browserUrl#"
	    	data-result-template="#resultTemplateId#"
	    	data-selected-template="#selectedTemplateId#"
	        <cfif IsBoolean( multiple ) && multiple>
	        	multiple="multiple"
	        </cfif>
	></select>
</cfoutput>