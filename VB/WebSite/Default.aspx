<%-- BeginRegion Page setup --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="ClientSideEditTrigger" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxPager" TagPrefix="dxwp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Switch to the edit mode by clicking a status bar button or by double-clicking a row</title>
	<Style>
	 .over {color:yellow; background: navy}
	 .down {color:yellow; background: navy; font-style: italic}
	</Style>
</head>
<body>
	<form id="form1" runat="server">

	<dxwgv:ASPxGridView ID="grid" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="EmployeeID" OnRowDeleting="grid_RowDeleting" OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating">
		<Columns>
			<dxwgv:GridViewDataColumn Caption="#" ReadOnly="True" VisibleIndex="5">
				 <DataItemTemplate>
					 <input type="button" onclick="grid.StartEditRow(<%#Container.VisibleIndex%>)" value="Edit"/>
					 <input type="button" onclick="grid.DeleteRow(<%#Container.VisibleIndex%>)" value="Delete"/>
				 </DataItemTemplate>
				<EditFormSettings Visible="False" />
			 </dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataTextColumn Caption="EmployeeID" FieldName="EmployeeID" ReadOnly="True"
				VisibleIndex="0">
				<EditFormSettings Visible="False" />
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataTextColumn Caption="LastName" FieldName="LastName" VisibleIndex="1">
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataTextColumn Caption="FirstName" FieldName="FirstName" VisibleIndex="2">
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataTextColumn Caption="City" FieldName="City" VisibleIndex="3">
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataTextColumn Caption="Country" FieldName="Country" VisibleIndex="4">
			</dxwgv:GridViewDataTextColumn>
		</Columns>
		<Settings ShowFilterRow="True" ShowStatusBar="Visible" />
		<SettingsBehavior AllowFocusedRow="True" />
		<ClientSideEvents RowDblClick="function(s, e) {
	grid.StartEditRow(e.visibleIndex);
}" />
		<SettingsEditing Mode="EditForm" />
		<Templates>
  <EditForm>
	 <div style="padding:4px 4px 3px 4px">
		 <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
  <br/>
  <input type="button" value="Update" 
	  onmouseover="this.className='over';" 
	  onmouseout="this.className='';" 
	  onmousedown="this.className='down';" 
	  onmouseup="this.className='over';" 
	  onclick="grid.UpdateEdit()"/>
  <input type="button" value="Cancel" 
	  onmouseover="this.className='over';" 
	  onmouseout="this.className='';" 
	  onmousedown="this.className='down';" 
	  onmouseup="this.className='over';" 
	  onclick="grid.CancelEdit()"/>
	 </div>
	 </EditForm>
			<StatusBar>
				<input id="btnAdd" type="button" value="Add" onclick="grid.AddNewRow();" />
				<input id="btnEdit" type="button" value="Edit" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());" />
				<input id="btnDelete" type="button" value="Delete" onclick="grid.DeleteRow(grid.GetFocusedRowIndex());" />
			</StatusBar>
		</Templates>
		<SettingsPager PageSize="5">
			<FirstPageButton Visible="True">
			</FirstPageButton>
			<LastPageButton Visible="True">
			</LastPageButton>
		</SettingsPager>
	</dxwgv:ASPxGridView>
	<%-- BeginRegion DataSource --%>
	 <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT * FROM [Employees]">
	</asp:AccessDataSource>
	<%-- EndRegion --%>
	</form>
</body>
</html>
