component output=false validationProvider=true extends="preside.system.base.Service" {

	public boolean function presideObjectUniqueIndex( required string fieldName, struct data={}, required string objectName, required string fields ) output=false validatorMessage="cms:validation.presideObjectUniqueIndex.default" {
		var pobjService  = _getPresideObjectService();
		var dbAdapter    = pobjService.getDbAdapterForObject( arguments.objectName );
		var filter       = "";
		var filterParams = {};
		var field        = "";
		var delimiter    = "";

		if ( not pobjService.objectExists( arguments.objectName ) ) {
			return false;
		}

		if ( StructKeyExists( arguments.data, "id" ) and Len( Trim( arguments.data.id ) ) ) {
			filter               = "id != :id";
			filterParams[ "id" ] = arguments.data.id;
			delimiter            = " and ";
		}

		for( field in ListToArray( arguments.fields ) ){
			if ( not StructKeyExists( arguments.data, field ) ) {
				return false;
			}

			if ( Len( Trim( arguments.data[ field ] ) ) ) {
				filter &= delimiter & "#dbAdapter.escapeEntity( field )# = :#field#";
			} else {
				filter &= delimiter & "(#dbAdapter.escapeEntity( field )# = :#field# or #dbAdapter.escapeEntity( field )# is null)";
			}
			filterParams[ field ]  = arguments.data[ field ];

			delimiter = " and ";
		}

		return not pobjService.dataExists(
			  objectName   = arguments.objectName
			, filter       = filter
			, filterParams = filterParams
		);
	}

	public string function presideObjectUniqueIndex_js() output=false {
		return "function(){ return true; }";
	}

}