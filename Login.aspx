<%@ Page Title="" Language="C#" MasterPageFile="~/PrimeMart.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PrimeMart.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
        /* Background and overlay */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('/Images/toy-shopping-cart-with-boxes-credit-card-with-copy-space_339191-197.jpg') no-repeat center center/cover;
            height: 100vh;
            position: relative;
            background-size: cover;
            background-attachment: fixed;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2);
            z-index: 0;
        }

        /* Login container */
        .form-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, 0.9);
            width: 400px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .form-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .btn {
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

        .btn:hover {
            background-color: brown;
        }

        .register-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Login</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmailFormat" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
        <a href="SignUp_Form.aspx" class="register-link">Not registered? Sign Up Now</a>
    </div>
</asp:Content>
