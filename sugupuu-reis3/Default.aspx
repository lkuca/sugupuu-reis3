<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sugupuu_reis3._Default" %>
<html>
    <head>
        <title>xml ja xslt andmete kuvamine</title>
    </head>
    <body>
        <h1>xml ja xslt andmete kuvamine</h1>
        <br />
        <div>
            <asp:Xml runat="server" DocumentSource="~/reisid.xml"
                TransformSource="~/reisidLisa.xslt" />
        </div>
    </body>
</html>