﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CatSubcategory1.aspx.cs" Inherits="ControlProductos.CatSubcategory1" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/jscript">
        function OnEndCallback(s, e) {              
            if (s.cpAlertMessage != '') {                
                if (s.cpAlertMessage == 'Update') {
                    swal("Information", "The registry was updated successfully", "success");
                } else if (s.cpAlertMessage == 'Insert') {
                    swal("Information", "Record added successfully!", "success");
                } else if (s.cpAlertMessage == 'Delete') {
                    swal("Information", "Registration was successfully enabled / disabled!", "success");
                } else if (s.cpAlertMessage == 'Error') {
                    swal("Warning", "An error has occurred from the database");
                }
                grid.PerformCallback('Search');
            }
        }

        function raiseValidation() {
            if (ASPxClientEdit.ValidateEditorsInContainer(null))
                grid.UpdateEdit();
        }

        function OnCallback() {
            grid.PerformCallback('Search');
        }

        function GetSelectedFieldValuesCallback(values) {
            var Valores = "";
            for (var i = 0; i < values.length; i++) {
                if (Valores == "") {
                    Valores = Valores + values[i];
                } else {
                    Valores = Valores + ", " + values[i];
                }
            }
        }

        function DisableSelected() {
            var Valores = "";
            $(".chk").each(function () {
                if (this.checked) {
                    if (Valores == "") {
                        Valores = this.id.substr(3);
                    } else {
                        Valores += "," + this.id.substr(3);
                    }
                }
            });

            if (Valores == "") {

                swal({
                    title: "Information",
                    text: "No records selected!",
                    type: "info"
                });
                return;
            }

            swal({
                title: "Are you sure?",
                text: "Are you sure you want to enable / disable all the selected records?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes",
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: false
            },
              function (isConfirm) {
                  if (isConfirm) {
                      CallbackPanelDisable.PerformCallback(Valores);
                      grid.PerformCallback('Search');
                      swal("Deleted", "Records were successfully enabled / disabled", "success");
                  } else {
                      swal("Cancelled", "You canceled the operation", "error");
                  }
              });
        }

        function DisableAll() {

            swal({
                title: "Are you sure?",
                text: "Are you sure you want to enable / disable all registers?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes",
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    CallbackPanelDisableAll.PerformCallback();
                    grid.PerformCallback('Search');
                    swal("Deleted", "All logs were successfully enabled/disabled", "success");
                } else {
                    swal("Cancelled", "You canceled the operation", "error");
                }
            });
        }
    </script>
    <div id="Busqueda" runat="server">
        <dx:ASPxNavBar ID="ASPxNavBar2" runat="server" Theme="Metropolis" Width="100%" Font-Bold="False">
            <Groups>
                <dx:NavBarGroup Text="SubCategorys 1 \ Filters">
                        <ContentTemplate>
                                <div id="Parametros" runat="server" visible="true">
                                    <table style="float: left; width: 40%"" class="OptionsTable BottomMargin">
                                        <tr>
                                            <td  style="width:10%; text-align:left">
                                                    <dx:ASPxLabel ID="lblCodigo" runat="server" Text="Code: ">
                                            </dx:ASPxLabel>
                                            </td>
                                            <td  style="width:30%; text-align:left">
                                                <dx:ASPxTextBox runat="server" Theme="SoftOrange" Height="5px"  ID="xtxtCodigo" Enabled="True" Width="100%" FocusedStyle-Border-BorderColor="#3399ff" FocusedStyle-Border-BorderStyle="Double">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr style="height:5px"></tr>
                                        <tr>
                                            <td  style="width:10%; text-align:left">
                                                    <dx:ASPxLabel ID="lblDescripcion" runat="server" Text="Description: ">
                                            </dx:ASPxLabel>
                                            </td>
                                            <td  style="width:30%; text-align:left">
                                                <dx:ASPxTextBox runat="server" theme="SoftOrange" ID="xtxtDescripcion" Enabled="True" Width="100%" FocusedStyle-Border-BorderColor="#3399ff" FocusedStyle-Border-BorderStyle="Double">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr style="height:5px"></tr>
                                        <tr>
                                            <td  style="width:10%; text-align:left">
                                                <dx:ASPxCheckBox ID="chkActive" runat="server" Theme="SoftOrange"
                                                Text="Active Records" Checked="true" TextAlign="Left"></dx:ASPxCheckBox>
                                            </td>
                                            <td  style="width:20%; text-align:right">
                                                <dx:ASPxButton ID="btnBuscar" runat="server" Text="Search" Theme="SoftOrange" AutoPostBack="false" >
                                                    <ClientSideEvents Click="OnCallback" />
                                                </dx:ASPxButton>
                                            </td>                                                   
                                        </tr>
                                    </table>
                                    <table style="float: right; width: 20%" class="OptionsTable BottomMargin">
                                        <tr>
                                            <td>
                                                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="+ Options" Theme="Metropolis" >
                                                    <PanelCollection>
                                                        <dx:PanelContent>
                                                            <div>
                                                                <table>
                                                                    <tr>
                                                                        <td style="width:100%">
                                                                            <div class="div-container">
                                                                                <div class="div-img" >
                                                                                    <img class="img" src="Assets/Images/New.png" alt="New" style="cursor:pointer" onclick="return grid.AddNewRow();" title="New" />
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td style="width:20%">
                                                                            <div class="div-container">
                                                                                <div class="div-img" >
                                                                                    <img class="img" src="Assets/Images/trash_can.png" alt="Remove Selected" style="cursor:pointer" onclick="return DisableSelected();" title="Remove Selected" />
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td style="width:20%" >
                                                                        <div class="div-container">
                                                                            <div class="div-img" >
                                                                                <img class="img" src="Assets/Images/delete_all.png" alt="Remove All" style="cursor:pointer" onclick="return DisableAll();" title="Remove All" /> 
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxCallbackPanel ID="CallbackPanelDisable" ClientInstanceName="CallbackPanelDisable" runat="server" Width="200px" oncallback="CallbackPanelDisable_Callback"></dx:ASPxCallbackPanel>
                                                                            <dx:ASPxCallbackPanel ID="CallbackPanelDisableAll" ClientInstanceName="CallbackPanelDisableAll" runat="server" Width="200px" oncallback="CallbackPanelDisableAll_Callback"></dx:ASPxCallbackPanel>
                                                                        </td> 
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </dx:PanelContent>
                                                    </PanelCollection>
                                                </dx:ASPxRoundPanel>
                                            </td>
                                        </tr>
                                    </table>
                            </div>
                        </ContentTemplate>                                
                </dx:NavBarGroup>                            
            </Groups>
        </dx:ASPxNavBar>
    </div>
    <div id="Detalle" runat="server">
         <dx:ASPxGridView ID="xgrdSubcategoria1" runat="server" AutoGenerateColumns="False" Width="100%" Font-Names="Segoe UI" KeyFieldName="Subcategoria1ID" 
                    oncustomcallback="xgrdSubcategoria1_CustomCallback" ClientInstanceName="grid" onrowdeleting="xgrdSubcategoria1_RowDeleting"                     
                    onrowvalidating="xgrdSubcategoria1_RowValidating" onrowinserting="xgrdSubcategoria1_RowInserting" onrowupdating="xgrdSubcategoria1_RowUpdating"
                    OnHtmlDataCellPrepared="xgrdSubcategoria1_HtmlDataCellPrepared" OnHtmlEditFormCreated="xgrdSubcategoria1_HtmlEditFormCreated" Theme="Metropolis">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Subcategoria1ID" Visible="false" Caption="Identifier" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Name="CheckID" VisibleIndex="1" Width="20px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="2" Caption="Code" Width="10%">
                        </dx:GridViewDataTextColumn>                     
                        <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3" Caption="Name" Width="30%">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CodigoMaquina" VisibleIndex="4" Caption="Machine Code" Width="10%">
                        </dx:GridViewDataTextColumn>  
                        <dx:GridViewDataTextColumn FieldName="Maquina" VisibleIndex="5" Caption="Machine" Width="30%">
                        </dx:GridViewDataTextColumn>                                                                 
                    </Columns>
                     <SettingsBehavior ConfirmDelete="true"/>
                    <SettingsPager Mode="ShowPager" PageSize="13"/>                    
                    <SettingsEditing Mode="PopupEditForm">                                            
                    </SettingsEditing>
                    <SettingsPopup >
                            <EditForm Width="600"  Modal="true" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" ShowHeader="false"/>
                    </SettingsPopup>
                    <Settings ShowFilterRow="True" />
                    <SettingsText ConfirmDelete="Are you sure you want to enable/disable this record"/> 
                    <Styles>
                        <AlternatingRow BackColor="#F2F2F2"></AlternatingRow>
                        <RowHotTrack BackColor="#CEECF5"></RowHotTrack>   
                        <Header BackColor="#F2F2F2"></Header>                                           
                    </Styles>
                    <SettingsBehavior EnableRowHotTrack="true" />             
                    <ClientSideEvents EndCallback="OnEndCallback"  RowDblClick="function(s, e){                                                                                                        
                                s.StartEditRow(e.visibleIndex);  
                    }"/>       
                    <Templates>
                        <EditForm>
                            <div style="margin:1px 1px 1px 1px; background-color:#F2F2F2" >
                                  <table style="width:100%; height:100px;">
                                     <tr style="background-repeat:repeat-x; background-image:url('Images/GreenBar.png'); vertical-align:middle">
                                        <td  style="height:22px; text-align:left">
                                            <img src="Assets/Images/save.png" alt="" style="cursor:pointer" onclick="return raiseValidation();" />
                                        </td>
                                        <td  style="height:22px; text-align:right">
                                            <img src="Assets/Images/Close.png" alt="" style="cursor:pointer" onclick="return grid.CancelEdit();" />
                                        </td>
                                      </tr>
                                      <tr>
                                        <td style="vertical-align:top;" colspan="2">
                                            <table style="width:100%; padding-left:10px; padding-right:10px; padding-bottom:20px">
                                                <tr style="height:40px">
                                                    <td style="height:40px; padding-right:10px; text-align:right" colspan="2">
                                                        <dx:ASPxLabel runat="server" ID="ASPxLabel3" Text="Subcategory1 register" Font-Size="13pt" Font-Names="Segoe UI"></dx:ASPxLabel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="background-color:#E0E0E0; height:20px" >
                                                        <dx:ASPxLabel runat="server" ID="ASPxLabel2" Text="Description" Font-Size="12pt" Font-Names="Segoe UI"></dx:ASPxLabel>
                                                    </td>
                                                </tr>  
                                                <tr>
                                                    <td style="width:50%;">
                                                        <table style="width:100%; padding-left:0px; padding-right:0px; padding-bottom:0px; padding-top:0px">
                                                            <tr style="height:5px"></tr>
                                                            <tr>
                                                                <td style="padding-left: 10px;">
                                                                    <dx:ASPxLabel runat="server" ID="lblCodigo" Text="Code" Font-Names="Segoe UI"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="padding-left: 10px;">
                                                                    <dx:ASPxTextBox runat="server" ID="xtxtCodigoEdit" theme="SoftOrange" Width="100%" MaxLength="15" Text='<%# Eval("Codigo")%>' Font-Names="Segoe UI"
                                                                        FocusedStyle-Border-BorderColor="#3399ff">
                                                                        <ValidationSettings SetFocusOnError="true" Display="Static" CausesValidation="true">
                                                                            <RegularExpression ValidationExpression="[A-Za-záéíóúñÑ,;:\.\/\_\-\s\d\(\)]+" ErrorText="Please enter just valid characters" />
                                                                            <RequiredField IsRequired="true" ErrorText="Field Required" />
                                                                        </ValidationSettings>                                                            
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:5px"></tr>
                                                            <tr>
                                                                <td style="padding-left: 10px">
                                                                    <dx:ASPxLabel runat="server" ID="lblNombre" Text="Name" Font-Names="Segoe UI"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="padding-left: 10px;">
                                                                    <dx:ASPxTextBox runat="server" ID="xtxtNombreEdit" theme="SoftOrange" Width="200px" MaxLength="50" Text='<%# Eval("Nombre")%>' Font-Names="Segoe UI"
                                                                        FocusedStyle-Border-BorderColor="#3399ff">
                                                                        <ValidationSettings SetFocusOnError="true" Display="Static" CausesValidation="true">
                                                                            <RegularExpression ValidationExpression="[A-Za-záéíóúñÑ,;:\.\/\_\-\s\d\(\)]+" ErrorText="Please enter just valid characters" />
                                                                            <RequiredField IsRequired="true" ErrorText="Field Required" />
                                                                        </ValidationSettings>                                                            
                                                                    </dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width:50%;">
                                                        <table style="width:100%; padding-left:0px; padding-right:0px; padding-bottom:0px; padding-top:0px">
                                                            <tr style="height:5px"></tr>
                                                            <tr>
                                                                <td style="padding-left: 10px">
                                                                    <dx:ASPxLabel runat="server" ID="ASPxMaquina" Text="Machine" Font-Names="Segoe UI"></dx:ASPxLabel>
                                                                </td>
                                                                <td style="padding-left: 10px;">
                                                                    <input type="hidden" id="hdnCodigoMaquina" value='<%# Eval("CodigoMaquina")%>' runat="server"/>
                                                                    <dx:ASPxComboBox CssClass="form-control" ID="cmbMaquinaEdit" runat="server" FocusedStyle-Border-BorderColor="#3399ff" Width="200px"
                                                                    Font-Names="Segoe UI" IncrementalFilteringMode="Contains" FilterMinLength="0" EnableCallbackMode="True" OnDataBound="cmbMaquinaEdit_DataBound" CallbackPageSize="20" Theme="SoftOrange"
                                                                     PopupVerticalAlign="Above" PopupHorizontalAlign="Center" ItemStyle-SelectedStyle-Font-Italic="true">
                                                                        <ValidationSettings>
                                                                            <RequiredField  IsRequired="true" ErrorText="Select a option"/>
                                                                        </ValidationSettings>
                                                                        <ClientSideEvents/>
                                                                        <ButtonStyle BackColor="#0099FF"></ButtonStyle>                                                                                                                       
                                                                    </dx:ASPxComboBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="height:5px"></tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table> 
                                        </td>
                                    </tr>
                                </table>
                                </div>
                        </EditForm>
                    </Templates>                   
               </dx:ASPxGridView>
    </div>
</asp:Content>
