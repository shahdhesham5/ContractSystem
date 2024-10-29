$(document).ready(function() {
    $("#id_contract").change(function() { 
        var url = SitesURL; 
        var contractId = $(this).val();

        $.ajax({
            url: url,
            data: {
                'contract_id': contractId 
            },
            success: function(data) {
                $("#id_site").html("");  
                $.each(data, function(key, value) {
                    $("#id_site").append(
                        "<option value='" + value.id + "'>" + value.site_name + "</option>"
                    );
                });
            },
            error: function(xhr, status, error) {
                console.error("Error loading sites:", error);
                $("#id_site").html(""); 
                $("#id_site").append("<option value=''>No sites available</option>"); 
            }
        });
    });
});
