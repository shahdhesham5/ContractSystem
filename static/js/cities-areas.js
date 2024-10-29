// cities & areas
$(document).ready(function() {
    $("#id_city").change(function() {
        var url = CitiesURL;  // URL for the AJAX request
        var cityId = $(this).val();
  
        $.ajax({
            url: url,
            data: {
                'city_id': cityId
            },
            success: function(data) {
                $("#id_area").html("");  // Clear the existing options
                $.each(data, function(key, value) {
                    $("#id_area").append(
                        "<option value='" + value.id + "'>" + value.name + "</option>"
                    );
                });
            }
        });
    });


  $("#id_company").change(function() {
    var url = SubCompaniesURL;  
    var companyId = $(this).val();

    $.ajax({
        url: url,
        data: {
            'company_id': companyId
        },
        success: function(data) {
            $("#id_sub_company").html("");
            $.each(data, function(key, value) {
                $("#id_sub_company").append("<option value='" + value.id + "'>" + value.sub_company_name + "</option>");            });
        }
    });
    });

});