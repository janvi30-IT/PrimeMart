<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ShowCategories.aspx.cs" Inherits="PrimeMart.Admin.ShowCategories"  MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <h2 class="text-center">Categories List</h2>

  
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="modalMessage"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
        DataKeyNames="Categories_id" OnRowEditing="GridViewCategories_RowEditing"
        OnRowDeleting="GridViewCategories_RowDeleting" OnRowCancelingEdit="GridViewCategories_RowCancelingEdit"
        OnRowUpdating="GridViewCategories_RowUpdating">
        <Columns>
            <asp:BoundField DataField="Categories_id" HeaderText="ID" ReadOnly="True" />

            <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate>
                    <asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("Category_Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCategoryName" runat="server" Text='<%# Bind("Category_Name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

     
<asp:TemplateField HeaderText="Image">
    <ItemTemplate>
     
        <asp:Image ID="imgCategory" runat="server" 
            ImageUrl='<%# ResolveUrl(Eval("ImageURL").ToString()) %>' 
            Width="100px" Height="100px" CssClass="img-thumbnail" />
    </ItemTemplate>
    <EditItemTemplate>
       
        <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control" />
     
        <asp:Label ID="lblCurrentImage" runat="server" Text='<%# Eval("ImageURL") %>' Visible="false"></asp:Label>
    </EditItemTemplate>
</asp:TemplateField>

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm"
                        CommandName="Edit" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                        CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this category?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success btn-sm"
                        CommandName="Update" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-warning btn-sm"
                        CommandName="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>