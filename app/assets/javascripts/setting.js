$(document).on("turbolinks:load", function(){
    $("#csv_select_id").on('change' , function () {
        var module_type= $("#csv_select_id").val();
        if(module_type=='Provider'){
            $("#provider_import_div").show();
            $("#site_import_div").hide();
            $("#event_import_div").hide();
        }else if(module_type=='Site'){
            $("#site_import_div").show();
            $("#provider_import_div").hide();
            $("#event_import_div").hide();

        }else{
            $("#event_import_div").show();
            $("#provider_import_div").hide();
            $("#site_import_div").hide();
        }

    });
});


