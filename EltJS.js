function fnApplyAllFunctions() {
    // var data = {
    //     SourceId: profile.SourceId,
    //     offSetRecord: profile.OffSetRecord
    // };
    $.ajax({
        url: 'rest/wsApplyAllFunctions',
        type: 'GET',
        headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
        success: function (data) {
            //console.log(data);
            fnLoadTable(data);
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}
function fnChangeColValues() {
    var data = {
        SourceId: profile.SourceId,
        offSetRecord: profile.OffSetRecord
    };
    $.ajax({
        url: 'rest/wsChangeSrcColumnValue',
        type: 'GET',
        data: data,
        headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
        success: function (data) {
            //console.log(data);
            fnLoadTable(data);
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}
function fnColNameChangeModal(ProfileColumnId, ProfileColumnIndex) {
    fnInitializeFunction();

    var htmlData = `
    <h4 class="mb-4" style=" text-align: left; margin-bottom: 32px;">Update Header</h4>
    <form>
    <div class="form-group row">
        <label id="mdllabel1" for="mdltext1" class="col-sm-4 col-form-label">Enter Column Name :</label>
        <div class="col-sm-8">
              <input type="text" class="form-Control" id="mdltext1" />
        </div>
    </div>
  
 
    <div class="form-group row">
        <div class="col-sm-12 text-right">
            <button type="button" class="Button btn btn-default" id="submitBtn">Submit</button>
        </div>
    </div>
    </form>
    `;

    $('#htmlData').html(htmlData);

    // var htmlData = `	<label id="mdllabel1"></label>
    //     <input type="text" class="form-Control" id="mdltext1" />
    //     <button type="button" class="Button btn btn-default" id="submitBtn">Submit</button>`;

    // $('#htmlData').html(htmlData);
    $('#mdllabel1').text('Enter Column Header :')
    $('#popupModal').fadeIn();
    $('#mdltext1').val('')
    $('#submitBtn').on('click', function () {
        var newHeaderValue = $('#mdltext1').val();
        if (newHeaderValue !== '') {
            var data = {
                ProfileColumnId: ProfileColumnId,
                ColumnIndex: ProfileColumnIndex,
                NewColumnHeader: newHeaderValue,
                isForDataType: false

            };
            $.ajax({
                url: 'rest/wsUpdateProfileHeader',
                type: 'GET',
                data: data,
                headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
                success: function (data) {
                    console.log(data);
                    fnLoadTable(data);
                    fnCloseModal();
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        } else {
            alert('Please Enter Header..!')
        }
    });
}
function fnChangeDataType(ProfileColumnId, ProfileColumnIndex) {
    fnInitializeFunction();

    var htmlData = `
    <h4 class="mb-4" style=" text-align: left; margin-bottom: 32px;">Update DataType</h4>
    <form>
    <div class="form-group row">
        <label id="mdllabel1" for="mdltext1" class="col-sm-4 col-form-label">Select DataType :</label>
        <div class="col-sm-8">
            <select class="form-Control js-example-basic-single" id="ddlDataType">
               <option value="Text">Text</option>
               <option value="Date">Date</option>
               <option value="Number">Number</option>
             </select><br/>
        </div>
    </div>
  
 
    <div class="form-group row">
        <div class="col-sm-12 text-right">
            <button type="button" class="Button btn btn-default" id="submitBtnDT">Submit</button>
        </div>
    </div>
    </form>
    `;

    $('#htmlData').html(htmlData);

    $('#ddlDataType').select2({
        width: '100%' // Ensure select2 respects the width
    });



    // var htmlData = `<label id="mdllabel1">Select DataType</label>
    //     <select class="form-Control" id="ddlDataType">
    //         <option value="Text">Text</option>
    //         <option value="Date">Date</option>
    //         <option value="Number">Number</option>
    //     </select><br/>
    //     <button type="button" class="Button btn btn-default" id="submitBtnDT">Submit</button>`;
    // $('#htmlData').html(htmlData);

    $('#popupModal').fadeIn();
    $('#submitBtnDT').on('click', function () {
        var selectedDataType = $('#ddlDataType').val();
        var data = {
            ProfileColumnId: ProfileColumnId,
            ColumnIndex: ProfileColumnIndex,
            //NewColumnHeader: newHeaderValue,
            isForDataType: true,
            ColDataType: selectedDataType
        };
        $.ajax({
            url: 'rest/wsUpdateProfileHeader',
            type: 'GET',
            data: data,
            headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
            success: function (data) {
                console.log(data);
                fnLoadTable(data);
                fnCloseModal();
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
}
function fnRemoveColumn(ProfileColumnId, ProfileColumnIndex) {
    var isConfirm = confirm('Do you want remove this column');

    if (isConfirm) {
        var data = {
            ProfileColumnId: ProfileColumnId,
            ColumnIndex: ProfileColumnIndex
        };
        $.ajax({
            url: 'rest/wsRemoveSrcProfileColumn',
            type: 'GET',
            data: data,
            headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
            success: function (data) {
                //console.log(data);
                fnLoadTable(data);
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
            }
        });
    }
}





function fnSplitMarkCheckBox(ProfileColumnId, ProfileColumnIndex) {
    fnInitializeFunction();
    var htmlData = `
    <h4 class="mb-4" style=" text-align: left; margin-bottom: 32px;">Split Marking</h4>
    <form>
    <div class="form-group row">
        <div class="col-sm-4">
               <div class="form-check">
                 <label class="form-check-label" style="font-size: 15px; padding: 12px;" for="">Split</label>
                 <input class="form-check-input" type="checkbox" id="hasActiveSplitMark">
            </div>
        </div>
    </div>
  
 
    <div class="form-group row">
        <div class="col-sm-12 text-right">
            <button type="button" class="Button btn btn-default" id="submitBtnSplitBtn">Submit</button>
        </div>
    </div>
    </form>
    `;

    $('#htmlData').html(htmlData);

    $('#popupModal').fadeIn();

    $('#submitBtnSplitBtn').on('click', function () {
     
        var hasActiveSplitMark = $('#hasActiveSplitMark').prop('checked');
        
        var data = {
            ProfileColumnId: ProfileColumnId,
            ColumnIndex: ProfileColumnIndex,
            HasActiveSplitMark: hasActiveSplitMark,
        };

        console.log("Ahmed",data);

        $.ajax({
            url: 'rest/wsSetSplitMarking',
            type: 'GET',
            data: data,
            headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
            success: function (data) {
                fnLoadTable(data);
                fnCloseModal();
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
}

function fnChangeDestinationColumn(ProfileColumnId, ProfileColumnIndex) {
    fnInitializeFunction();
    // var htmlData = `<label id="mdllabel3">Destination Column</label>
    //     <select class="form-Control" id="ddlDestColumn">
    //         <option value="">--Select Column--</option>
    //     </select><br/>
    //     <button type="button" class="Button btn btn-default" id="submitBtnDTCol">Submit</button>`;
    // $('#htmlData').html(htmlData);

    var htmlData = `
    <h4 class="mb-4" style=" text-align: left; margin-bottom: 32px;">Destination Column</h4>
    <form>
    <div class="form-group row">
        <label id="mdllabel3" for="mdltext1" class="col-sm-4 col-form-label">Destination Column :</label>
        <div class="col-sm-8">
                <select class="form-Control js-example-basic-single" id="ddlDestColumn" style="width:100%;">
        <option value="">--Select Column--</option>
    </select><br/>
        </div>
    </div>
  
 
    <div class="form-group row">
        <div class="col-sm-12 text-right">
            <button type="button" class="Button btn btn-default" id="submitBtnDTCol">Submit</button>
        </div>
    </div>
    </form>
    `;

    $('#htmlData').html(htmlData);


    // var htmlData = `<label id="mdllabel3">Destination Column</label>
    // <select class="form-Control js-example-basic-single" id="ddlDestColumn" style="width:100%;">
    //     <option value="">--Select Column--</option>
    // </select><br/>
    // <button type="button" class="Button btn btn-default" id="submitBtnDTCol">Submit</button>`;
    // $('#htmlData').html(htmlData);

    populateDestColumn('ddlDestColumn', ProfileColumnIndex)
    $('#ddlDestColumn').select2();
    $('#popupModal').fadeIn();
    $('#submitBtnDTCol').on('click', function () {
        debugger;
        var selectedDestColumnId = $('#ddlDestColumn').val();
        var selectedDestColumnHeader = $("#ddlDestColumn option:selected").text();
        var data = {
            ProfileColumnId: ProfileColumnId,
            ColumnIndex: ProfileColumnIndex,
            DestProfileId: profile.DestProfileId,
            DestProfileColHeader: selectedDestColumnHeader,
            DestProfileColId: selectedDestColumnId
        };
        $.ajax({
            url: 'rest/wsSetDestColumn',
            type: 'GET',
            data: data,
            headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
            success: function (data) {
                //console.log(data);
                fnLoadTable(data);
                fnCloseModal();
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
}
function fnAddColumn() {

    var htmlData = `
    <h4 class="mb-4" style="
    text-align: left;
    margin-bottom: 32px;
">Add New Column</h4>
    <form>
    <div class="form-group row">
        <label for="mdltext1" class="col-sm-4 col-form-label">Enter Column Name :</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="mdltext1" />
        </div>
    </div>
    <div class="form-group row">
        <label for="mdltext2" class="col-sm-4 col-form-label">Constant Value :</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="mdltext2" />
        </div>
    </div>
    <div class="form-group row">
        <label for="ddlDBColumn" class="col-sm-4 col-form-label">Database Column :</label>
        <div class="col-sm-8">
            <select class="form-control" id="ddlDBColumn">
                <option value="">--Select Column--</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label for="ddlDataType" class="col-sm-4 col-form-label">Data Type :</label>
        <div class="col-sm-8">
            <select class="form-control" id="ddlDataType">
                <option value="Text">Text</option>
                <option value="Date">Date</option>
                <option value="Number">Number</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12 text-right">
            <button type="button" class="Button btn btn-default" id="submitBtnAddCol">Submit</button>
        </div>
    </div>
    </form>
    `;

    $('#htmlData').html(htmlData);

    // var htmlData = `<label id="mdllabel1">Enter Column Name</label>
    //     <input type="text" class="form-Control" id="mdltext1" /><br/>
    //     <label id="mdllabel2">Constant Value</label>
    //     <input type="text" class="form-Control" id="mdltext2" /><br/>
    //     <label id="mdllabel3">Database Column</label>
    //     <select class="form-Control" id="ddlDBColumn">
    //         <option value="">--Select Column--</option>
    //     </select><br/>
    //     <label id="mdllabel3">Data Type</label>
    //     <select class="form-Control" id="ddlDataType">
    //         <option value="Text">Text</option>
    //         <option value="Date">Date</option>
    //         <option value="Number">Number</option>
    //     </select><br/>
    //     <button type="button" class="Button btn btn-default" id="submitBtnAddCol">Submit</button>`;

    // $('#htmlData').html(htmlData);
    populateDropdown('ddlDBColumn');
    $('#popupModal').fadeIn();
    $('#mdltext1').val('')
    $('#mdltext2').val('')
    var isValidate = false;
    $('#submitBtnAddCol').on('click', function () {
        debugger;
        var columnName = $('#mdltext1').val();
        var constantValue = $('#mdltext2').val();
        var selectedDBColumn = $('#ddlDBColumn').val();
        var selectedDataType = $('#ddlDataType').val();
        var selectedDBColumnHeader = $("#ddlDBColumn option:selected").text();
        if (columnName == '') {
            alert('Please Enter Column Header');
        }
        else if (columnName.trim().includes(' ')) {
            alert('Column name should not contain spaces. Please enter a valid column name.');
        }
        else if (constantValue == '' && selectedDBColumn == false) {
            alert('Please Enter Constant Value or Select Database Column');
        } else {
            isValidate = true;
        }
        if (isValidate) {
            var data = {
                SrcProfileColHeader: columnName,
                SrcProfileColName: selectedDBColumn,
                SrcProfileColConVal: constantValue,
                SrcProfileColDataType: selectedDataType,
                SourceId: profile.SourceId,
                offSetRecord: profile.OffSetRecord
            };
            $.ajax({
                url: 'rest/wsAddSrcProfileColumn',
                type: 'GET',
                data: data,
                headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
                success: function (data) {
                    //console.log(data);
                    fnLoadTable(data);
                    fnCloseModal();
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }
    });
}
function populateDestColumn(elementName, ProfileColumnIndex) {
    $.ajax({
        url: 'rest/wsGetDestinationColumnBySourceIdDestProfileId',
        type: 'GET',
        headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
        data: {
            //ColDataType: ColDataType,
            DestProfileId: profile.DestProfileId,
            ColumnIndex: ProfileColumnIndex
        },
        contentType: 'application/json; charset=UTF-8',
        success: function (data) {
            //console.log(data);
            var dropdown = $('#' + elementName);
            dropdown.empty();  // Clear any existing options
            dropdown.append('<option value="">--Select an Option--</option>');  // Default option

            // Loop through the data and append each option to the dropdown
            data.destColumnList.forEach(function (item) {
                dropdown.append('<option value="' + item.DestProfileColId + '">' + item.DestProfileColHeader + '</option>');
            });
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}


function populateDropdown(elementName) {

    $.ajax({
        url: 'rest/prGetEltColumnBySourceId',
        type: 'GET',
        data: {
            SourceId: profile.SourceId
        },
        headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
        success: function (data) {
            //console.log(data);
            var dropdown = $('#' + elementName);
            dropdown.empty();  // Clear any existing options
            dropdown.append('<option value="">--Select an Option--</option>');  // Default option

            // Loop through the data and append each option to the dropdown
            data.listDDL.forEach(function (item) {
                dropdown.append('<option value="' + item.dataId + '">' + item.dataValue + '</option>');
            });
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}
function populateMultiplyDropdown(elementName) {

    $.ajax({
        url: 'rest/wsGetEltColumnBySourceId',
        type: 'GET',
        data: {
            SourceId: profile.SourceId,
            SrcProfileId: profile.SrcProfileId
        },
        headers: { "Content-type": "application/json; charset=UTF-8", 'Authorization': token },
        success: function (data) {
            //console.log(data);
            var dropdown = $('#' + elementName);
            dropdown.empty();
            data.ListDDL.forEach(function (item) {
                dropdown.append('<option value="' + item.dataValue + '">' + item.dataValue + '</option>');
            });
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}
function fnCloseModal() {
    $('#popupModal').fadeOut();
}
function fnFunctionCloseModal() {
    $('#funpopupModal').fadeOut();
}
// Close the popup if the user clicks outside the popup content
$(window).on('click', function (event) {
    if ($(event.target).is('#popupModal')) {
        $('#popupModal').fadeOut();
    }
    if ($(event.target).is('#funpopupModal')) {
        $('#funpopupModal').fadeOut();
    }
});
function removeColumn(arr, columnName) {
    return arr.map(obj => {
        const { [columnName]: _, ...rest } = obj; // Destructure and exclude the specified column
        return rest;
    });
};
const downloadCsv = (jsonData, filename = 'data.csv') => {
    const csvData = jsonToCsv(jsonData);
    const blob = new Blob([csvData], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);

    const link = document.createElement('a');
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
};
const jsonToCsv = (jsonData) => {
    const keys = Object.keys(jsonData[0]);
    const csvRows = [keys.join(',')];

    jsonData.forEach(obj => {
        debugger;
        const values = keys.map(key => JSON.stringify(obj[key], (key, value) => value === null ? '' : value));
        csvRows.push(values.join(','));
    });

    return csvRows.join('\n');
};
