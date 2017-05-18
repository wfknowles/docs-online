/**
 * Created by DEV-8 on 5/1/2017.
 */

var i=1;
var row_value=1;
row_array=[];
row_array.push(i);

function filterProvider1(){
    var selectedProviderItemIndex=$("#filterList_provider_show_1")[0].selectedIndex;
    console.log(selectedProviderItemIndex);
    $("#filterList_provider").prop('selectedIndex',selectedProviderItemIndex);
    var selectedFilterProviderRealText=$("#filterList_provider").val();
    $("#provider_type_select").prop('selectedIndex',selectedProviderItemIndex);
    var filterProviderType=$("#provider_type_select").val();
    console.log(filterProviderType);
    if(filterProviderType=='integer'){
        $("#select-second-integer-filter_1").show();
        $("#select-second-string-filter_1").hide();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }else if(filterProviderType=='datetime'){
        $("#select-second-integer-filter_1").hide();
        $("#select-second-string-filter_1").hide();
        $("#select-second-date-filter_1").show();
        $("#searchnum_inputfield_1").datetimepicker();
        $("#second_searchnum_inputfield_1").datetimepicker();
        $("#no-selected").hide();
    }else{
        $("#select-second-integer-filter_1").hide();
        $("#select-second-string-filter_1").show();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }
}

function isAdded(selectText){
    var selectedColumnsObject=document.getElementById("selectedColumns");
    var selectedColumnsLength=document.getElementById("selectedColumns").length;
    var selectOptions=document.getElementById("selectedColumns").options;
    if(selectedColumnsLength==0){
        return false;
    }else{
        for(i=0;i<selectedColumnsLength;i++){
            if(selectText==selectedColumnsObject.options[i].value){
                return true;
            }
        }
    }

    return false;
}

function filterShift1(){
    var selectedShiftItemIndex=$("#filterList_shift_show_1")[0].selectedIndex;
    $("#filterList_provider").prop('selectedIndex',selectedShiftItemIndex);
    var selectedFilterShiftRealText=$("#filterList_shift").val();
    $("#shift_type_select").prop('selectedIndex',selectedShiftItemIndex);
    var filterShiftType=$("#shift_type_select").val();
    console.log(filterShiftType);
    if(filterShiftType=='integer'){
        $("#select-second-integer-filter_1").show();
        $("#select-second-string-filter_1").hide();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }else if(filterShiftType=='datetime'){
        $("#select-second-integer-filter_1").hide();
        $("#select-second-string-filter_1").hide();
        $("#select-second-date-filter_1").show();
        $("#searchnum_inputfield_1").datetimepicker();
        $("#second_searchnum_inputfield_1").datetimepicker();
        $("#no-selected").hide();
    }else if(filterShiftType=='float'){
        $("#select-second-integer-filter_1").show();
        $("#select-second-string-filter_1").hide();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }
    else{
        $("#select-second-integer-filter_1").hide();
        $("#select-second-string-filter_1").show();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }
}

function onDateSetting1(){
    var filterDtaePicker=$("#select-second-date-filter_1").val();
    var  td_val='<td id="add-second-search_1"style="padding-top: 10px;">'+
        '<div style="opacity: 1;height: auto;overflow: visible;">'+
        '<input size="30" maxlength="18" type="text" id="second_searchnum_inputfield_1"  name="second_searchnum_inputfield_1" class="form-control" style="margin-left: 14px">'+
        '</div>'+
        '</td>';

    $("#add-second-search_1").remove();
    if(filterDtaePicker=="between"){
        $("#add-plus-1").before(td_val);



    }

    if(filterDtaePicker=="not between"){
        $("#add-plus-1").before(td_val);

    }
    $("#second_searchnum_inputfield_1").datetimepicker();
}

function filterSite1(){
    var selectedSiteItemIndex=$("#filterList_site_show_1")[0].selectedIndex;
    $("#filterList_site").prop('selectedIndex',selectedSiteItemIndex);
    var selectedFilterSiteRealText=$("#filterList_provider").val();
    $("#site_type_select").prop('selectedIndex',selectedSiteItemIndex);
    var filterSiteType=$("#site_type_select").val();
    if(filterSiteType=='integer'){
        $("#select-second-integer-filter_1").show();
        $("#select-second-string-filter_1").hide();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }else if(filterSiteType=='datetime'){
        $("#select-second-integer-filter_1").hide();
        $("#select-second-string-filter_1").hide();
        $("#searchnum_inputfield_1").datetimepicker();
        $("#select-second-date-filter_1").show();
        $("#no-selected").hide();
    }else{
        $("#select-second-integer-filter_1").hide();
        $("#select-second-string-filter_1").show();
        $("#select-second-date-filter_1").hide();
        $("#no-selected").hide();
    }
}

function onRemove(id){
    console.log(id);
    var length=row_array.length;
    var current_value= document.getElementById("patternNum_"+id).value;
    console.log(length);
    console.log(current_value)
    var index=row_array.indexOf(id);
    if(index!=-1){
        row_array.splice(index,1);
    }
    row_value=length-1;
    $("#searchcriteria-"+id).remove();

    for(j=0;j<row_array.length;j++){
        var k=j+1;
        document.getElementById("patternNum_"+row_array[j].toString(10)).value= k.toString(10);
    }
    var current_length=length-1;
    console.log( row_array[current_length-1]);
    if(current_value==length){
        console.log( row_array[current_length-1]);
        $("#add-plus"+ row_array[current_length-1]).append( '<div onclick="onAdd()" class="check-add addCriteria" >'+'</div>');
    }

}

function onProviderChange(id){
    var selectedProviderItemIndex=$("#filterList_provider_show_"+id)[0].selectedIndex;
    console.log(selectedProviderItemIndex);
    $("#filterList_provider").prop('selectedIndex',selectedProviderItemIndex);
    var selectedFilterProviderRealText=$("#filterList_provider").val();
    $("#provider_type_select").prop('selectedIndex',selectedProviderItemIndex);
    var filterProviderType=$("#provider_type_select").val();
    console.log(filterProviderType);
    $("#no-selected_"+id).hide();
    if(filterProviderType=='integer'){
        $("#select-second-integer-filter_"+id).show();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).hide();

    }else if(filterProviderType=='datetime'){
        $("#select-second-integer-filter_"+id).hide();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).show();
        $("#searchnum_inputfield_"+id).datetimepicker();

    }else{
        $("#select-second-integer-filter_"+id).hide();
        $("#select-second-string-filter_"+id).show();
        $("#select-second-date-filter_"+id).hide();

    }
}

function onSiteChange(id){
    var selectedSiteItemIndex=$("#filterList_site_show_"+id)[0].selectedIndex;
    $("#filterList_site").prop('selectedIndex',selectedSiteItemIndex);
    var selectedFilterSiteRealText=$("#filterList_provider").val();
    $("#site_type_select").prop('selectedIndex',selectedSiteItemIndex);
    var filterSiteType=$("#site_type_select").val();
    $("#no-selected_"+id).hide();
    if(filterSiteType=='integer'){
        $("#select-second-integer-filter_"+id).show();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).hide();
    }else if(filterSiteType=='datetime'){
        $("#select-second-integer-filter_"+id).hide();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).show();
        $("#searchnum_inputfield_"+id).datetimepicker();
    }else{
        $("#select-second-integer-filter_"+id).hide();
        $("#select-second-string-filter_"+id).show();
        $("#select-second-date-filter_"+id).hide();
    }
}

function onShiftChange(id){
    console.log("jkhdjsdfdkjs");
    var selectedShiftItemIndex=$("#filterList_shift_show_"+id)[0].selectedIndex;
    console.log(selectedShiftItemIndex);
    $("#filterList_provider").prop('selectedIndex',selectedShiftItemIndex);
    var selectedFilterShiftRealText=$("#filterList_shift").val();
    $("#shift_type_select").prop('selectedIndex',selectedShiftItemIndex);
    var filterShiftType=$("#shift_type_select").val();
    console.log(filterShiftType);
    if(filterShiftType=='integer'){
        $("#select-second-integer-filter_"+id).show();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).hide();
        $("#no-selected_"+id).hide();
    }else if(filterShiftType=='datetime'){
        $("#select-second-integer-filter_"+id).hide();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).show();
        $("#searchnum_inputfield_"+id).datetimepicker();
        $("#no-selected_"+id).hide();
    }else if(filterShiftType=='float'){
        $("#select-second-integer-filter_"+id).show();
        $("#select-second-string-filter_"+id).hide();
        $("#select-second-date-filter_"+id).hide();
        $("#no-selected_"+id).hide();
    }
    else{
        $("#select-second-integer-filter_"+id).hide();
        $("#select-second-string-filter_"+id).show();
        $("#select-second-date-filter_"+id).hide();
        $("#no-selected_"+id).hide();
    }
}

function onDateSetting(id){
    var filterDtaePicker=$("#select-second-date-filter_"+id).val();
    var  td_val='<td id="add-second-search_'+id+'" style="padding-top: 10px;">'+
        '<div style="opacity: 1;height: auto;overflow: visible;">'+
        '<input size="30" maxlength="18" type="text" id="second_searchnum_inputfield_'+id+'"  name="second_searchnum_inputfield_'+id+'" onclick="onOperatorFilter('+id+')" class="form-control" style="margin-left: 14px">'+
        '</div>'+
        '</td>';
    $("#add-second-search_"+id).remove();
    if(filterDtaePicker=="between"){

        $("#add-plus-"+id).before(td_val);
    }

    if(filterDtaePicker=="not between"){

        $("#add-plus-"+id).before(td_val);

    }
    $("#second_searchnum_inputfield_"+id).datetimepicker();
}

function onAdd(){
    console.log('add');
    row_value++;
    ++i;
    row_array.push(i);
    $(".check-add").remove();
    $("#removeDiv-1").show();
    var type = $("#select_name").val();
    //$("#check-add").remove();
    if (type == 1) {
        var rows = '<tr id="searchcriteria-' + i.toString(10) + '">' +
            '<td style="padding-top: 10px;">' +
            '<div class="wf_slideDownUp_Div tr_cnt_1" style="opacity: 1;height: auto;overflow: visible">' +
            '<span>' +
            '<input id="patternNum_' + i.toString(10) + '" type="text" class="searchMatchText" readonly="readonly" name="patternNum2" value="' + row_value.toString(10) + '">' +
            '</span>' +
            '<input type="hidden" name="match-" ' + i.toString(10) + ' id="match-' + i.toString(10) + '">' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div class="wf_slideDownUp_Div tr_cnt_1" style="opacity: 1;height: auto;overflow: visible">' +
            ' <select id="filterList_shift_show_' + i.toString(10) + '" name="filterList_shift_show_' + i.toString(10) + '"  onchange="onShiftChange(' + i.toString(10) + ')"   class="select form-control"  style="width:200px;max-height:50px;overflow: auto;margin-left: 7px;">' +
            '<option>ID</option>' +
            '<option>Provider Name</option>' +
            '<option>Site Name</option>' +
            '<option>Shift</option>' +
            '<option>Start Time</option>' +
            '<option>End Time</option>' +
            '<option>Status</option>' +
            '<option>Hide From Schedule</option>' +
            '<option>Custom Pay Rate</option>' +
            '<option>Custom Bill Rate</option>' +
            '<option>Area</option>' +
            '<option>Notes</option>' +
            '<option>Filled On</option>' +
            '<option>Access ID</option>' +
            '<option>Updated by</option>' +
            '<option>Color</option>' +
            '<option>Created At</option>' +
            '<option>Updated At</option>' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<select id="select-second-integer-filter_' + i.toString(10) + '"  name ="select-second-filter_' + i.toString(10) + '" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;">' +
            '<option id="option-equal-' + i.toString(10) + '">equal to</option>' +
            '<option id="option-non-equal-' + i.toString(10) + '">non equal to</option>' +
            '<option id="option-less-' + i.toString(10) + '">less than</option>' +
            '<option id="option-less-equal-' + i.toString(10) + '">less than or equals</option>' +
            '<option id="option-greater-' + i.toString(10) + '">greater than</option>' +
            '<option id="option-greater-equal-' + i.toString(10) + '">greater than or equals</option>' +
            '<option id="option-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '<select id="select-second-string-filter_' + i.toString(10) + '" name ="select-second-string-filter_' + i.toString(10) + '" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;display: none;">' +
            '<option id="option-string-is-' + i.toString(10) + '">is</option>' +
            '<option id="option-string-is-not-' + i.toString(10) + '">' + "isn't" + '</option>' +
            '<option id="option-string-contains-' + i.toString(10) + '">contains</option>' +
            '<option id="option-string-starts-with-' + i.toString(10) + '">starts with</option>' +
            '<option id="option-string-ends-with-' + i.toString(10) + '">ends with</option>' +
            '<option id="option-string-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-string-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '<select id="select-second-date-filter_' + i.toString(10) + '" name ="select-second-date-filter_' + i.toString(10) + '"  onchange="onDateSetting(' + i.toString(10) + ')"  class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;display: none;">' +
            '<option id="option-date-is-' + i.toString(10) + '">is</option>' +
            '<option id="option-date-is-not-' + i.toString(10) + '">' + "isn't" + '</option>' +
            '<option id="option-date-is-before-' + i.toString(10) + '">is before</option>' +
            '<option id="option-date-is-after-' + i.toString(10) + '">is after</option>' +
            '<option id="option-date-between-' + i.toString(10) + '">between</option>' +
            '<option id="option-date-not-between-' + i.toString(10) + '">not between</option>' +
            '<option id="option-date-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-date-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<input size="30" maxlength="18" type="text" id="searchnum_inputfield_' + i.toString(10) + '"  name="searchnum_inputfield_' + i.toString(10) + '"  class="form-control" style="margin-left: 7px">' +
            '</div>' +
            '</td>' +
            '<td id="add-plus-' + i.toString(10) + '" style="padding-top: 10px;" >' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<div onclick="onRemove(' + i.toString(10) + ')" id="removeDiv-' + i.toString(10) + '" class="removeCriteria" ></div>' +
            '<div onclick="onAdd()" class="check-add addCriteria" >' + '</div>' +
            '</div>' +
            '</td>' +
            '</tr>';
    } else if (type == 2) {
        var rows = '<tr id="searchcriteria-' + i.toString(10) + '">' +
            '<td style="padding-top: 10px;">' +
            '<div class="wf_slideDownUp_Div tr_cnt_1" style="opacity: 1;height: auto;overflow: visible">' +
            '<span>' +
            '<input id="patternNum_' + i.toString(10) + '" type="text" class="searchMatchText" readonly="readonly" name="patternNum2" value="' + row_value.toString(10) + '">' +
            '</span>' +
            '<input type="hidden" name="match-" ' + i.toString(10) + ' id="match-' + i.toString(10) + '">' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div class="wf_slideDownUp_Div tr_cnt_1" style="opacity: 1;height: auto;overflow: visible">' +
            ' <select id="filterList_provider_show_' + i.toString(10) + '" name="filterList_provider_show_' + i.toString(10) + '" onchange="onProviderChange(' + i.toString(10) + ')" class="select form-control"  style="width:200px;max-height:50px;overflow: auto;margin-left: 7px;">' +
            '<option>ID</option>' +
            '<option>Rails</option>' +
            '<option>Last Name</option>' +
            '<option>First Name</option>' +
            '<option>Preferred Name</option>' +
            '<option>Middle Name</option>' +
            '<option>Salutation</option>' +
            '<option>Address</option>' +
            '<option>Email</option>' +
            '<option>Phone Number</option>' +
            '<option>Status</option>' +
            '<option>SSN</option>' +
            '<option>Birth Date</option>' +
            '<option>Gender</option>' +
            '<option>Spouse Name</option>' +
            '<option>Birth Place</option>' +
            '<option>Superviser</option>' +
            '<option>Hire Date</option>' +
            '<option>Termination Date</option>' +
            '<option>Provider Type</option>' +
            '<option>Provider Skills</option>' +
            '<option>Misc Info</option>' +
            '<option>Insurance</option>' +
            '<option>Contract</option>' +
            '<option>Ecfmg</option>' +
            '<option>Medicare</option>' +
            '<option>Medicaid</option>' +
            '<option>NPI</option>' +
            '<option>CAQH</option>' +
            '<option>ATLS</option>' +
            '<option>ACLS</option>' +
            '<option>PALS</option>' +
            '<option>ALSO</option>' +
            '<option>NRP</option>' +
            '<option>BLS</option>' +
            '<option>State Licensure</option>' +
            '<option>Board Certification</option>' +
            '<option>DEA</option>' +
            '<option>State Narcoitc</option>' +
            '<option>Staff Contact</option>' +
            '<option>Privileges</option>' +
            '<option>Residency</option>' +
            '<option>Medical Education</option>' +
            '<option>Pre Medical Education</option>' +
            '<option>Initial Contact Date</option>' +
            '<option>Application Received Date</option>' +
            '<option>CV Received Date</option>' +
            '<option>Interview Date</option>' +
            '<option>Verification Date</option>' +
            '<option>Verification Completion Date</option>' +
            '<option>Recertification Request Date</option>' +
            '<option>Recertification Completion Date</option>' +
            '<option>Active Referral Options</option>' +
            '<option>Hired Date</option>' +
            '<option>ReferredBy</option>' +
            '<option>First Shift Date</option>' +
            '<option>Referral Paid Date</option>' +
            '<option>Amount</option>' +
            '<option>Notepad</option>' +
            '<option>Referral Code</option>' +
            '<option>Access ID</option>' +
            '<option>Microstaffer ID</option>' +
            '<option>Created At</option>' +
            '<option>Updated At</option>' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<select id="select-second-integer-filter_' + i.toString(10) + '"  name ="select-second-filter_' + i.toString(10) + '" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;">' +
            '<option id="option-equal-' + i.toString(10) + '">equal to</option>' +
            '<option id="option-non-equal-' + i.toString(10) + '">non equal to</option>' +
            '<option id="option-less-' + i.toString(10) + '">less than</option>' +
            '<option id="option-less-equal-' + i.toString(10) + '">less than or equals</option>' +
            '<option id="option-greater-' + i.toString(10) + '">greater than</option>' +
            '<option id="option-greater-equal-' + i.toString(10) + '">greater than or equals</option>' +
            '<option id="option-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '<select id="select-second-string-filter_' + i.toString(10) + '" name ="select-second-string-filter_' + i.toString(10) + '" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;display: none;">' +
            '<option id="option-string-is-' + i.toString(10) + '">is</option>' +
            '<option id="option-string-is-not-' + i.toString(10) + '">' + "isn't" + '</option>' +
            '<option id="option-string-contains-' + i.toString(10) + '">contains</option>' +
            '<option id="option-string-starts-with-' + i.toString(10) + '">starts with</option>' +
            '<option id="option-string-ends-with-' + i.toString(10) + '">ends with</option>' +
            '<option id="option-string-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-string-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '<select id="select-second-date-filter_' + i.toString(10) + '" name ="select-second-date-filter_' + i.toString(10) + '" onchange="onDateSetting(' + i.toString(10) + ')" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;display: none;">' +
            '<option id="option-date-is-' + i.toString(10) + '">is</option>' +
            '<option id="option-date-is-not-' + i.toString(10) + '">' + "isn't" + '</option>' +
            '<option id="option-date-is-before-' + i.toString(10) + '">is before</option>' +
            '<option id="option-date-is-after-' + i.toString(10) + '">is after</option>' +
            '<option id="option-date-between-' + i.toString(10) + '">between</option>' +
            '<option id="option-date-not-between-' + i.toString(10) + '">not between</option>' +
            '<option id="option-date-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-date-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<input size="30" maxlength="18" type="text" id="searchnum_inputfield_' + i.toString(10) + '" name="searchnum_inputfield_' + i.toString(10) + '"  class="form-control" style="margin-left: 7px">' +
            '</div>' +
            '</td>' +
            '<td  id="add-plus-' + i.toString(10) + '" style="padding-top: 10px;" >' +
            '<div  style="opacity: 1;height: auto;overflow: visible;">' +
            '<div onclick="onRemove(' + i.toString(10) + ')"  class="removeCriteria" ></div>' +
            '<div onclick="onAdd()" class="check-add addCriteria" >' + '</div>' +
            '</div>' +
            '</td>' +
            '</tr>';
    } else {
        var rows = '<tr id="searchcriteria-' + i.toString(10) + '">' +
            '<td style="padding-top: 10px;">' +
            '<div class="wf_slideDownUp_Div tr_cnt_1" style="opacity: 1;height: auto;overflow: visible">' +
            '<span>' +
            '<input id="patternNum_' + i.toString(10) + '" type="text" class="searchMatchText" readonly="readonly" name="patternNum2" value="' + row_value.toString(10) + '">' +
            '</span>' +
            '<input type="hidden" name="match-" ' + i.toString(10) + ' id="match-' + i.toString(10) + '">' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div class="wf_slideDownUp_Div tr_cnt_1" style="opacity: 1;height: auto;overflow: visible">' +
            ' <select id="filterList_site_show_' + i.toString(10) + '" name="filterList_site_show_' + i.toString(10) + '"  onchange="onSiteChange(' + i.toString(10) + ')" class="select form-control"  style="width:200px;max-height:50px;overflow: auto;margin-left: 7px;">' +
            '<option>ID</option>' +
            '<option>Hospital Name</option>' +
            '<option>Address</option>' +
            '<option>City</option>' +
            '<option>Phone Number</option>' +
            '<option>Fax Number</option>' +
            '<option>Po Box</option>' +
            '<option>Contacts</option>' +
            '<option>Certification Requirements</option>' +
            '<option>Notepad</option>' +
            '<option>Housing Info</option>' +
            '<option>Status Options</option>' +
            '<option>DWC Contact Staff</option>' +
            '<option>Affiliation</option>' +
            '<option>Billing Address</option>' +
            '<option>Access ID</option>' +
            '<option>Microstaffer ID</option>' +
            '<option>Created At</option>' +
            '<option>Updated At</option>' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<select id="select-second-integer-filter_' + i.toString(10) + '"  name ="select-second-filter_"' + i.toString(10) + ' class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;">' +
            '<option id="option-equal-' + i.toString(10) + '">equal to</option>' +
            '<option id="option-non-equal-' + i.toString(10) + '">non equal to</option>' +
            '<option id="option-less-' + i.toString(10) + '">less than</option>' +
            '<option id="option-less-equal-' + i.toString(10) + '">less than or equals</option>' +
            '<option id="option-greater-' + i.toString(10) + '">greater than</option>' +
            '<option id="option-greater-equal-' + i.toString(10) + '">greater than or equals</option>' +
            '<option id="option-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '<select id="select-second-string-filter_' + i.toString(10) + '" name ="select-second-string-filter_' + i.toString(10) + '" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;display: none;">' +
            '<option id="option-string-is-' + i.toString(10) + '">is</option>' +
            '<option id="option-string-is-not-' + i.toString(10) + '">' + "isn't" + '</option>' +
            '<option id="option-string-contains-' + i.toString(10) + '">contains</option>' +
            '<option id="option-string-starts-with-' + i.toString(10) + '">starts with</option>' +
            '<option id="option-string-ends-with-' + i.toString(10) + '">ends with</option>' +
            '<option id="option-string-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-string-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '<select id="select-second-date-filter_' + i.toString(10) + '" name ="select-second-date-filter_' + i.toString(10) + '" onchange="onDateSetting(' + i.toString(10) + ')" class="select form-control" style="width:200px;max-height:80px;overflow: auto;margin-left: 7px;display: none;">' +
            '<option id="option-date-is-' + i.toString(10) + '">is</option>' +
            '<option id="option-date-is-not-' + i.toString(10) + '">' + "isn't" + '</option>' +
            '<option id="option-date-is-before-' + i.toString(10) + '">is before</option>' +
            '<option id="option-date-is-after-' + i.toString(10) + '">is after</option>' +
            '<option id="option-date-between-' + i.toString(10) + '">between</option>' +
            '<option id="option-date-not-between-' + i.toString(10) + '">not between</option>' +
            '<option id="option-date-is-empty-' + i.toString(10) + '">is empty</option>' +
            '<option id="option-date-is-not-empty-' + i.toString(10) + '">is not empty</option>' +
            '</select>' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;">' +
            '<div style="opacity: 1;height: auto;overflow: visible;">' +
            '<input size="30" maxlength="18" type="text" id="searchnum_inputfield_' + i.toString(10) + '" name="searchnum_inputfield_' + i.toString(10) + '"  class="form-control" style="margin-left: 7px">' +
            '</div>' +
            '</td>' +
            '<td style="padding-top: 10px;" id="add-plus' + i.toString(10) + '">' +
            '<div style="opacity: 1;height: auto;overflow: visible;" >' +
            '<div onclick="onRemove(' + i.toString(10) + ')" class="removeCriteria" ></div>' +
            '<div onclick="onAdd()" class="check-add addCriteria" >' + '</div>' +
            '</div>' +
            '</td>' +
            '</tr>';
    }

    $("#tblCustomers").append(rows);

}