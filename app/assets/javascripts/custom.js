$(document).on("turbolinks:load", function() {
   
   // Views
   $(".phone-number").mask("(999) 999-9999");
   $("#provider_ssn").mask("999-99-9999");
   
   $(".datepicker").datetimepicker({
      format: 'MM-DD-YYYY'
   });
   
   // Report Form
   
   // Picklist on load
   var value=$("#module-field-id").val();
   if (value == "Provider") {
    $('#availList_provider').show();
    $('#availList_site').hide();
    $('#availList_shift').hide();
    $('#filterList_shift').hide();
    $('#filterList_provider').show();
    $('#filterList_site').hide();
   } else if (value == "Shift") {
    $('#availList_provider').hide();
    $('#availList_site').hide();
    $('#availList_shift').show();
    $('#filterList_shift').show();
    $('#filterList_provider').hide();
    $('#filterList_site').hide();
   } else {
    $('#availList_provider').hide();
    $('#availList_site').show();
    $('#availList_shift').hide();
    $('#filterList_shift').hide();
    $('#filterList_provider').hide();
    $('#filterList_site').show();
   }

    // Picklist on change
    $("#select_module_id").on("change",function(){
        var type=$("#select_module_id").val();
        if(type=='Shift'){
            $("#module-field-id").val('Shift');
        }else if(type=='Provider'){
            $("#module-field-id").val('Provider');
        }else{
            $("#module-field-id").val('Site');
        }
   
      if(type == 'Shift'){
            $('#availList_shift').show();
            $('#availList_provider').hide();
            $('#availList_site').hide();
            $('#filterList_shift').show();
            $('#filterList_provider').hide();
            $('#filterList_site').hide();
            

        }else if(type=='Provider'){
            $('#availList_provider').show();
            $('#availList_site').hide();
            $('#availList_shift').hide();
            $('#filterList_provider').show();
            $('#filterList_site').hide();
            $('#filterList_shift').hide();

        }else{
            $('#availList_site').show();
            $('#availList_provider').hide();
            $('#availList_shift').hide();
            $('#filterList_site').show();
            $('#filterList_provider').hide();
            $('#filterList_shift').hide();

        }



      //  if(type == 'Shift'){
      //       $('#filterList_shift').hide();
      //       $('#filterList_provider').hide();
      //       $('#filterList_site').hide();
      //       $('#filterList_shift_show_1').show();
      //       $('#filterList_provider_show_1').hide();
      //       $('#filterList_site_show_1').hide();


      //  }else if(type=='Provider'){
      //       $('#filterList_provider').hide();
      //       $('#filterList_site').hide();
      //       $('#filterList_shift').hide();
      //       $('#filterList_provider_show_1').show();
      //       $('#filterList_site_show_1').hide();
      //       $('#filterList_shift_show_1').hide();
            
      //  }else{
      //       $('#filterList_site').hide();
      //       $('#filterList_provider').hide();
      //       $('#filterList_shift').hide();
      //       $('#filterList_site_show_1').show();
      //       $('#filterList_provider_show_1').hide();
      //       $('#filterList_shift_show_1').hide()
      //  }

     });

    $("#select-table-type").on("change",function(){
        var report_type=$("#select-table-type").val();
        if(report_type=="Table"){
            $("#type-field-id").val("Table");
        }else if(report_type=="Summary"){
            $("#type-field-id").val("Summary");
        }else{
            $("#type-field-id").val("Matrix");
        }
    });


    $(".btn-cancel").click(function(){
        window.location.replace('/reports');
    });
    $("#move_up_id").click(function(){
        var selectedColumnsIem=$("#selectedColumns")[0].selectedIndex;
        var selectedColumnsObject=document.getElementById("selectedColumns");
        var selectLength=selectedColumnsObject.length;
        if(selectedColumnsIem>0){
            var cuSelectedColummnsItem=selectedColumnsIem-1;
            $("#selectedColumns").prop('selectedIndex',cuSelectedColummnsItem);
        }else if(selectedColumnsIem==0){
            var cuSelectedColummnsItem=selectedColumnsIem;
            $("#selectedColumns").prop('selectedIndex',cuSelectedColummnsItem);
        }
    });
    $("#move_down_id").click(function(){
        var selectedColumnsIem=$("#selectedColumns")[0].selectedIndex;
        var selectedColumnsObject=document.getElementById("selectedColumns");
        var selectLength=selectedColumnsObject.length;
        if(selectedColumnsIem<selectLength){
            var cuSelectedColummnsItem=selectedColumnsIem+1;
            $("#selectedColumns").prop('selectedIndex',cuSelectedColummnsItem);
        }else if(selectedColumnsIem==selectLength){
            var cuSelectedColummnsItem=selectedColumnsIem;
            $("#selectedColumns").prop('selectedIndex',cuSelectedColummnsItem);
        }
    });
    $("#movecol_del_id").click(function(){
        var selectedColumnsIem=$("#selectedColumns")[0].selectedIndex;
        var selectedColumnsObject=document.getElementById("selectedColumns");
        selectedColumnsObject.remove(selectedColumnsIem);
    });
    $("#select-table-type").click(function(){
        var table_type=$("#select-table-type").val();
        if(table_type=='Table'){
            $(".reportImage").css("background","url(//img.zohostatic.com/crm/1069265/images/reportsicon.svg) no-repeat");
            $(".reportImage").css("background-position","-1px -8px");
            $("#para-report-type").text("Tabular reports provide you the way to list your data in a simpler form.");
        }else if(table_type=='Summary'){
            $(".reportImage").css("background","url(//img.zohostatic.com/crm/1085378/images/reportsicon.svg) no-repeat");
            $(".reportImage").css("background-position","-1px -122px");
            $("#para-report-type").text("Summary Reports allow you to view your data along with subtotals, groupings, and other summary information.");
        }else{
            $(".reportImage").css("background","url(//img.zohostatic.com/crm/1085378/images/reportsicon.svg) no-repeat");
            $(".reportImage").css("background-position","-1px -236px");
            $("#para-report-type").text("Matrix Reports use a grid layout to summarize your data.");
        }

    });
    var arrayTemp=new Array();
    $("#button-add-column").on("click", function(){
        var type = $("#select_module_id").val();
        var representationArray = $('#arraylist').val();
        $('#representation-field-id').val(representationArray);
       
        
        if(type == 'Shift'){
            var selectedText=$("#availList_shift").val();
            if(isAdded(selectedText)==false){
                var selectedItemIndex=$("#availList_shift")[0].selectedIndex;
                $("#availList_shift").prop('selectedIndex',selectedItemIndex);
                var selectedRealText=$("#availList_shift").val();
                $("#selectedColumns").append("<option>"+selectedText+"</option>");
                arrayTemp.push(selectedRealText);
                console.log(arrayTemp);
                $('#arraylist').val(arrayTemp);
            }

        }else if(type=='Provider'){
            var selectedText=$("#availList_provider").val();
            if(isAdded(selectedText)==false) {
                var selectedItemIndex = $("#availList_provider")[0].selectedIndex;
                $("#availList_provider").prop('selectedIndex', selectedItemIndex);
                var selectedRealText = $("#availList_provider").val();
                console.log(selectedRealText)
                $("#selectedColumns").append("<option>" + selectedText + "</option>");
                arrayTemp.push(selectedRealText);
                $('#arraylist').val(arrayTemp);
            }

        }else{
            var selectedText=$("#availList_site").val();
            if(isAdded(selectedText)==false) {
                var selectedItemIndex = $("#availList_site")[0].selectedIndex;
                $("#availList_site").prop('selectedIndex', selectedItemIndex);
                var selectedRealText = $("#availList_site").val();
                $("#selectedColumns").append("<option>" + selectedText + "</option>");
                arrayTemp.push(selectedRealText);
                $('#arraylist').val(arrayTemp);
            }

        }
        




    });
    // // $("#btn-continue-1").click(function(){
    //     var name=$("#report_name_id").val();
    //     $("#name-field-id").val(name);

    //     var report_type=$("#select-table-type").val();
    //     if(report_type=="Table"){
    //         $("#type-field-id").val("Table");
    //     }else if(report_type=="Summary"){
    //         $("#type-field-id").val("Summary");
    //     }else{
    //         $("#type-field-id").val("Matrix");
    //     }

    //     var type=$("#select_module_id").val();
    //     if(type=='Shift'){
    //         $("#module-field-id").val('Shift');
    //     }else if(type=='Provider'){
    //         $("#module-field-id").val('Provider');
    //     }else{
    //         $("#module-field-id").val('Site');
    //     }


    //     if(type == 'Shift'){
    //         $('#availList_shift').hide();
    //         $('#availList_provider').hide();
    //         $('#availList_site').hide();
    //         // $('#availList_shift_show').show();
    //         // $('#availList_provider_show').hide();
    //         // $('#availList_site_show').hide();


    //     }else if(type=='Provider'){
    //         $('#availList_provider').hide();
    //         $('#availList_site').hide();
    //         $('#availList_shift').hide();
    //         // $('#availList_provider_show').show();
    //         // $('#availList_site_show').hide();
    //         // $('#availList_shift_show').hide();

    //     }else{
    //         $('#availList_site').hide();
    //         $('#availList_provider').hide();
    //         $('#availList_shift').hide();
    //         // $('#availList_site_show').show();
    //         // $('#availList_provider_show').hide();
    //         // $('#availList_shift_show').hide();

    //     }
    //   //  $("#div-2").fadeIn();
    // });
    // $("#btn-continue-2" +
    //     "").click(function(){
    //     var representationArray = $('#arraylist').val();
    //     $('#representation-field-id').val(representationArray);
    //     var type = $("#select_module_id").val();
    //     if(type == 'Shift'){
    //         $('#filterList_shift').hide();
    //         $('#filterList_provider').hide();
    //         $('#filterList_site').hide();
    //         $('#filterList_shift_show_1').show();
    //         $('#filterList_provider_show_1').hide();
    //         $('#filterList_site_show_1').hide();


    //     }else if(type=='Provider'){
    //         $('#filterList_provider').hide();
    //         $('#filterList_site').hide();
    //         $('#filterList_shift').hide();
    //         $('#filterList_provider_show_1').show();
    //         $('#filterList_site_show_1').hide();
    //         $('#filterList_shift_show_1').hide();
    //     }else{
    //         $('#filterList_site').hide();
    //         $('#filterList_provider').hide();
    //         $('#filterList_shift').hide();
    //         $('#filterList_site_show_1').show();
    //         $('#filterList_provider_show_1').hide();
    //         $('#filterList_shift_show_1').hide()
    //     }
    //   //  $("#div-3").fadeIn();
    // });


    $("#create-report").click(function(){
        var arrayFilterTemp=new Array();
        var arrayOperateTemp=new Array();
        var arrayFirstvalTemp=new Array();
        var arraySecondvalTemp=new Array();
        var type = $("#select_name").val();
        console.log(i);
        for(j=1;j<=i;j++){
            if(type==1){
                if($("#filterList_shift_"+ j.toString(10)).length){
                    var selectedShiftItemIndex=$("#filterList_shift_"+j.toString(10))[0].selectedIndex;
                    $("#filterList_shift").prop('selectedIndex',selectedShiftItemIndex);
                    var filterField=$("#filterList_shift").val();
                    console.log(filterField);
                    arrayFilterTemp.push(filterField);
                    $("#filterlist").val(arrayFilterTemp);

                    if($("#select-second-integer-filter_"+ j.toString(10)).is(":visible")){
                        var filterOperator=$("#select-second-integer-filter_"+ j.toString(10)).val();

                    }else if($("#select-second-string-filter_"+ j.toString(10)).is(":visible")){
                        var filterOperator=$("#select-second-integer-filter_"+ j.toString(10)).val();
                    }else{
                        var filterOperator=$("#select-second-date-filter_"+ j.toString(10)).val();
                    }

                    arrayOperateTemp.push(filterOperator);
                    $("#operatorlist").val(arrayOperateTemp);

                }
            }else if(type==2){
                if($("#filterList_provider_"+ j.toString(10)).length){
                    var selectedProviderItemIndex=$("#filterList_provider_"+j.toString(10))[0].selectedIndex;
                    $("#filterList_provider").prop('selectedIndex',selectedProviderItemIndex);
                    var filterField=$("#filterList_provider").val();
                    arrayFilterTemp.push(filterField);
                    $("#filterlist").val(arrayFilterTemp);

                    if($("#select-second-integer-filter_"+ j.toString(10)).is(":visible")){
                        var filterOperator=$("#select-second-integer-filter_"+ j.toString(10)).val();

                    }else if($("#select-second-string-filter_"+ j.toString(10)).is(":visible")){
                        var filterOperator=$("#select-second-string-filter_"+ j.toString(10)).val();
                    }else{
                        var filterOperator=$("#select-second-date-filter_"+ j.toString(10)).val();
                    }

                    arrayOperateTemp.push(filterOperator);
                    $("#operatorlist").val(arrayOperateTemp);

                }
            }else{
                if($("#filterList_site_"+ j.toString(10)).length){
                    var selectedSiteItemIndex=$("#filterList_site_"+j.toString(10))[0].selectedIndex;
                    $("#filterList_site").prop('selectedIndex',selectedSiteItemIndex);
                    var filterField=$("#filterList_site").val();
                    arrayFilterTemp.push(filterField);
                    $("#filterlist").val(arrayFilterTemp);

                    if($("#select-second-integer-filter_"+ j.toString(10)).is(":visible")){
                        var filterOperator=$("#select-second-integer-filter_"+ j.toString(10)).val();

                    }else if($("#select-second-string-filter_"+ j.toString(10)).is(":visible")){
                        var filterOperator=$("#select-second-string-filter_"+ j.toString(10)).val();
                    }else{
                        var filterOperator=$("#select-second-date-filter_"+ j.toString(10)).val();
                    }

                    arrayOperateTemp.push(filterOperator);
                    $("#operatorlist").val(arrayOperateTemp);

                }

            }

            if($("#searchnum_inputfield_"+ j.toString(10)).length){
                var filterFirstVal=$("#searchnum_inputfield_"+ j.toString(10)).val();
                arrayFirstvalTemp.push(filterFirstVal);
                $("#firstvallist").val(arrayFirstvalTemp);
            }


        }
        var tempFilter=$("#filterlist").val();
        console.log(tempFilter);
        var tempOperator=$("#operatorlist").val();
        console.log(tempOperator);
        var tempFirstVal=$("#firstvallist").val();
        console.log(tempFirstVal);
        var tempSecondVal=$("#secondvallist").val();
        $("#filter-field-id").val(tempFilter);
        console.log($("#filter-field-id").val());
        $("#operator-field-id").val(tempOperator);
        console.log($("#operator-field-id").val());
        $("#first-val-field-id").val(tempFirstVal);
        $("#second-val-field-id").val(tempSecondVal);
    });
});