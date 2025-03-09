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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="form-container">
        <h2>Sign Up for an Account</h2>

        <div class="row">
            <div class="col-6">
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" />
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                    ErrorMessage="First Name is required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revFirstName" runat="server" ControlToValidate="txtFirstName"
                    ErrorMessage="Only alphabets allowed" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^[a-zA-Z]+$" />
            </div>

            <div class="col-6">
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" />
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Last Name is required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revLastName" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Only alphabets allowed" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^[a-zA-Z]+$" />
            </div>
        </div>

        <!-- Dropdowns -->
        <div class="address-row">
            <div class="col-4">
                <label for="inputState">State</label>
                <asp:DropDownList ID="inputState" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="inputState_SelectedIndexChanged">
                    <asp:ListItem Text="--select state---" Value="" />
                    <asp:ListItem>Maharashtra</asp:ListItem>
                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                    <asp:ListItem>Delhi</asp:ListItem>
                    <asp:ListItem>Gujarat</asp:ListItem>
                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                    <asp:ListItem>Punjab</asp:ListItem>
                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="inputState"
    InitialValue="" ErrorMessage="State selection is required" ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="col-4">
                <label for="inputCity">City</label>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="Lucknow">Lucknow</asp:ListItem>
                    <asp:ListItem>Mumbai</asp:ListItem>
                    <asp:ListItem>Chennai</asp:ListItem>
                    <asp:ListItem>New Delhi</asp:ListItem>
                    <asp:ListItem>Ahmedabad</asp:ListItem>
                    <asp:ListItem>Amritsar</asp:ListItem>
                    <asp:ListItem>Bhopal</asp:ListItem>
                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="DropDownList1"
                    InitialValue="" ErrorMessage="City selection is required" ForeColor="Red" Display="Dynamic" />

                
            </div>

            <div class="col-4">
                <label for="inputZip">Zip</label>
                <asp:DropDownList ID="ddlzip" runat="server" AutoPostBack="True">
                    <asp:ListItem>--choose----</asp:ListItem>
                    <asp:ListItem>400001</asp:ListItem>
                    <asp:ListItem>600001</asp:ListItem>
                    <asp:ListItem>110001</asp:ListItem>
                    <asp:ListItem>380001</asp:ListItem>
                    <asp:ListItem>226001</asp:ListItem>
                    <asp:ListItem>143001</asp:ListItem>
                    <asp:ListItem>462001</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="ddlzip"
                    InitialValue="" ErrorMessage="Zip Code selection is required" ForeColor="Red" Display="Dynamic" />
            </div>
        </div>

        <div class="col-12">
            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revUsername" runat="server" ControlToValidate="txtUsername"
                ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic"
                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
        </div>

        <div class="col-12">
            <label for="inputPassword4">Password</label>
            <asp:TextBox ID="inputPassword4" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="inputPassword4"
                ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="inputPassword4"
                ErrorMessage="Password must be at least 6 characters" ForeColor="Red" Display="Dynamic"
                ValidationExpression="^.{6,}$" />
        </div>

        <div class="col-12">
            <label for="inputPhone">Phone Number</label>
            <asp:TextBox ID="inputPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number" />
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="inputPhone"
                ErrorMessage="Phone Number is required" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="inputPhone"
                ErrorMessage="Enter a valid 10-digit phone number" ForeColor="Red" Display="Dynamic"
                ValidationExpression="^\d{10}$" />
        </div>

        <div class="col-12">
            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="btnRegister_Click"  />
            <br />
            <p>Already have an account? <a href="Login.aspx">Sign In</a></p>
        </div>
    </div>
</asp:Content>