<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NETBMI.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BMI Calculator</title>
    <style type="text/css">
        body
        {
            background-image:url('wallpaper.jpg');
            background-size: cover;
        }
        h1
        {
            margin: auto;
            align-content: center;
            width: 245px;
            font-family: Rockwell;
        }
        .content
        {
            align-content: center;
            margin:auto;
            height: 641px;
            width: 343px;
            background-color: rgba(255, 255, 255, 0.30);
            font-family: Rockwell;
        }
        .height
        {
            background-color: rgb(208, 183, 234);
            padding: 10px;
            float: left;
        }
        .weight
        {
            background-color: rgb(162, 181, 226);
            padding: 10px;
            float: left;
        }
        .image
        {
            margin: auto;
            width: 127px;
            height: 381px; 
        }
        .spacer 
        {
            margin: auto;
            display: inline-block;
            width: 86px;
        }
        #btnSubmit
        {
            margin: auto;
            display: block;
            height: 21px;
            width: 50px;
            font-family: Rockwell;
        }
        .finalbmi
        {
            text-align: center;
            margin: auto;
            width: 313px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <h1>BMI Calculator</h1>
        <div class="content">
            <div class="height" style="width: 152px; height: 134px">
                <asp:Label ID="lblFeetSelect" runat="server" Text="Height in Feet"></asp:Label>
                <br />
                <!--Drop down list for both feet and inches-->
                <asp:DropDownList runat="server" ID="drpFeet">
                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblInchesSelect" runat="server" Text="Height in Inches"></asp:Label>
                <br />
                    <asp:DropDownList runat="server" ID="drpInches">
                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                </asp:DropDownList>
                <!--These height validators prevent people from using developer 
                    tools to alter the range of the feet and inch values to whatever they want-->
                <asp:RangeValidator
                    ControlToValidate="drpFeet"
                    MinimumValue="0"
                    MaximumValue="9"
                    Type="Double"
                    EnableClientScript="true"
                    ValidationExpression="^[0-9]*$"
                    runat="server">
                </asp:RangeValidator>

                <asp:RangeValidator
                    ControlToValidate="drpInches"
                    MinimumValue="0"
                    MaximumValue="11"
                    Type="Double"
                    EnableClientScript="true"
                    ValidationExpression="^[0-9]*$"
                    runat="server">
                </asp:RangeValidator>
                <br /><br />
                <!--This label is for preventing the user from-->
                <asp:Label ID="lblHeightValidate" runat="server" Text="Must be one inch tall" ForeColor="red" Visible="false"></asp:Label>
            </div>

            <div class="weight" style="width: 150px; height: 134px">
                <br />
                <asp:Label ID="lblWeight" runat="server" Text="Weight"></asp:Label>
                <br />
                <asp:TextBox ID="txtWeight" runat="server" Width="100px"></asp:TextBox>
                <br /><br />
                <!--Makes sure that *only numbers* between 1-1000 can be entered-->
                <asp:RequiredFieldValidator 
                    runat="server" ID="vlWeight" ControlToValidate="txtWeight" EnableClientScript="true" ErrorMessage="Enter your weight" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator id="vlWeightRange"
                    ControlToValidate="txtWeight"
                    MinimumValue="1"
                    MaximumValue="1000"
                    Type="Integer"
                    EnableClientScript="true"
                    Text="Weight must be between 1 and 1000"
                    ValidationExpression="^[0-9]*$"
                    ForeColor="Red"
                    runat="server">
                </asp:RangeValidator>
            </div>
            <!--Gives a little bit of space for the BMI labels-->
            <div class ="spacer"></div>
            <asp:Button ID="btnSubmit" runat="server" Font-Bold="True" Text="GET BMI" class="button" Width="188px" OnClick="btnSubmit_Click" />
            <br />

            <div class="finalbmi">
                <asp:Label ID="lblFinalBMITitle" runat="server" Width="55px" Height="38px" Font-Bold="True" Font-Size="X-Large" Visible="false">BMI: </asp:Label>
                <asp:Label ID="lblFinalBMI" runat="server" Width="81px" Height="38px" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            </div>
            <!--All images are here and are invisible until they are made visible by the C# code-->
            <div class="image">
                <asp:Image runat="server" ID="obese" alt="Obese" class="obese" Visible="false" src="obese.png"  />
                <asp:Image runat="server" ID="overweight" alt="Overweight" class="overweight" Visible="false" src="overweight.png" />
                <asp:Image runat="server" ID="healthy" alt="Healthy" class="healthy" Visible="false" src="healthy.png" />
                <asp:Image runat="server" ID="underweight" alt="Underweight" class="underweight" Visible="false" src="underweight.png" />
                <asp:Image runat="server" ID="unknown" alt="BMI is unknown" class="unknown"  Visible="true" src="unknown.png" />
            </div>
        
       </div>
</form>
</body>
</html>
