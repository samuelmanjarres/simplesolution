/**
 * 
 */

$("#apps").change(idApp); 

var idApp = function() {
	
	var id = $(this).val();
	console.log("id: "+id);
	$.getJSON("VersionServlet",{
		id:id},
		function(data, textStatus, jqXHR) {
			$("#SelectVersion").empty();
			$.each( data, function(index, item){
				$("<option/>")
				.attr("value", idVersion)
				.text(Name)
				.appendTo("#SelectVersion"); 
				
			});
			
		});
	
}