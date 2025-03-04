<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/PrimeMart.Master" AutoEventWireup="true" CodeBehind="SignUp_Form.aspx.cs" Inherits="PrimeMart.SignUp_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Your CSS styles */
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('/Images/toy-shopping-cart-with-boxes-credit-card-with-copy-space_339191-197.jpg') no-repeat center center/cover;
            height: 100vh;
            position: relative;
            background-size: cover;  /* Ensure image covers the full screen */
            background-attachment: fixed;  /* Keep the background fixed when scrolling */
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2); /* Optional: Change the overlay to lighter */
            z-index: 0;
        }


        /* Form container styling */
        .form-container {
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: none; /* Light Transparent White */
            backdrop-filter: none; /* Blur Effect */
            width: 450px;
            padding: 40px 30px;
/*            border-radius: 10px;*/
            box-shadow:none;
            z-index: 1;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            color: #333;
        }

        /* Flexbox for First Name and Last Name */
        .form-container .row {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .form-container .col-6 {
            width: 48%;
        }

        /* Input fields styling */
        .form-container input, .form-container select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        /* Flexbox for City, State, and Zip Code */
        .form-container .address-row {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .form-container .col-4 {
            width: 32%;
        }

        .form-container .col-4 input {
            width: 100%;
        }

        /* Button styling */
        .form-container button[type="submit"], .form-container .btn {
            width: 100%;
            padding: 12px;
            background-color: lightcoral;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Hover effect for the button */
        .form-container button[type="submit"]:hover, .form-container .btn:hover {
            background-color: brown;
        }

        /* Centering the "Already have an account" text */
        .form-container p {
            text-align: center;
            font-size: 14px;
            margin-top: 15px;
        }

        .form-container a {
            color: #007bff;
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }
        .auto-style1 {
            height: 92px;
        }
        .auto-style2 {
            height: 103px;
        }
        .auto-style3 {
            height: 110px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Sign Up for an Account</h2>

        <div class="row">
            <div class="col-6">
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" />
                <asp:RegularExpressionValidator ID="revFname" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Only letters allowed in First Name!" ForeColor="Red" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="col-6">
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" />
                <asp:RegularExpressionValidator ID="revLname" runat="server" ControlToValidate="txtLastName" ErrorMessage="Only letters allowed in Last Name!" ForeColor="Red" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="auto-style1">
            <label for="inputEmail4">Email</label>
            <asp:TextBox ID="inputEmail4" runat="server" CssClass="form-control" placeholder="Enter your email" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="inputEmail4" ErrorMessage="Email is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="inputEmail4" ErrorMessage="Invalid email format!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
        </div>

        <div class="auto-style2">
            <label for="inputPassword4">Password</label>
            <asp:TextBox ID="inputPassword4" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="inputPassword4" ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="auto-style3">
            <label for="inputPhone">Phone Number</label>
            <asp:TextBox ID="inputPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number" />
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="inputPhone" ErrorMessage="Phone number is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="inputPhone" ErrorMessage="Phone must be 10 digits!" ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
        </div>

        <div class="address-row">
            <div class="col-4" style="height: 99px; width: 32%">
                <label for="inputState">State</label>
                <asp:DropDownList ID="inputState" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Choose..." Value="" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="inputState" ErrorMessage="Please select a state!" ForeColor="Red" InitialValue="&quot;&quot;"></asp:RequiredFieldValidator>
            </div>

            <div class="col-4" style="height: 102px">
                <label for="inputCity">City</label>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="34px">
                    <asp:ListItem>--choose---</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please select a city!" ForeColor="Red" InitialValue="&quot;&quot;"></asp:RequiredFieldValidator>
            </div>

        </div>

        <div class="col-12">

            <div class="col-4" style="height: 134px">
                <label for="inputZip">Zip</label>
                <asp:TextBox ID="inputZip" runat="server" CssClass="form-control" placeholder="Zip Code" />
                <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="inputZip" ErrorMessage="Please Enter Zip code!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="inputZip" ErrorMessage="Enter a valid 6-digit  PIN Code!" ForeColor="Red" ValidationExpression="^[1-9][0-9]{5}$"></asp:RegularExpressionValidator>
            </div>
            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="btnRegister_Click" />
            <br />
<p>Already have an account? <a href="Login.aspx">Sign In</a></p>
        </div>
    </div>
</asp:Content>
