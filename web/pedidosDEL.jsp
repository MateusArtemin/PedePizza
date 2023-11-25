<%-- 
    Document   : pedidosDEL
    Created on : 21 de nov. de 2023, 14:03:55
    Author     : artemin
--%>

<%@page import="controle.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        
        
        
        <%
        
        Pedido ped = new Pedido();
        ped.setPedidoId(Integer.parseInt(request.getParameter("CIP")));
        
        Class.forName("com.mysql.jdbc.Driver"); // registra            
        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
        String DelSQL1 = "DELETE FROM pedidog WHERE IDPedido = ?";
        String DelSQL2 = "DELETE FROM produtospedido WHERE IDPedido = ?";
        
        try
        {
            try(PreparedStatement ps= conexao.prepareStatement(DelSQL2))
            {
                ps.setInt(1, ped.getPedidoId());
                ps.executeUpdate();
            }
        
            try(PreparedStatement ps= conexao.prepareStatement(DelSQL1))
            {
                ps.setInt(1, ped.getPedidoId());
                ps.executeUpdate();
            }
            
            %> <script>
        alert("Excluido!");
        window.location.href = "pedidos.jsp";
    </script>
    <%
        conexao.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }
        
        %>
    </body>
</html>
