<%-- 
    Document   : processaPedido
    Created on : 20 de nov. de 2023, 17:26:00
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
        
        int MaxId = Integer.parseInt(request.getParameter("TotalD"));
        ped.setEstabId(Integer.parseInt(request.getParameter("EstablD")));
        
        ped.setCliLocal(Integer.parseInt(request.getParameter("localE")));  
        
        out.println("estab id: " + request.getParameter("EstablD"));
        
        
        int x = 1;
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
        String sql2 = "INSERT INTO pedidog (IDEstabelecimento , IDCliente, IDEndereco) VALUES ( ?,?,?)";
        String sql3 = "SELECT * FROM `pedidog` ORDER BY `pedidog`.`IDPedido` DESC LIMIT 1";
        
        String sql5 = "SELECT * FROM `usolog`";
        
        ped.setEstabId(Integer.parseInt(request.getParameter("EstablD")));
        
        
        try
        {
            try (PreparedStatement pstmtt = conexao.prepareStatement(sql5))
                {
                    ResultSet rsLog = pstmtt.executeQuery();
                    if (rsLog.next()) {
                        int IdLog = Integer.parseInt(rsLog.getString("IdUsoLog"));   
                        ped.setIdCli(IdLog);
                    }
                }
               
            try(PreparedStatement ps2 = conexao.prepareStatement(sql2))
            {
                ps2.setInt(1,ped.getEstabId());
                ps2.setInt(2,ped.getIdCli());
                ps2.setInt(3,ped.getCliLocal());
                ps2.executeUpdate();
                                   
            }
            
            try(PreparedStatement ps3 = conexao.prepareStatement(sql3))
            {
                ResultSet rsp3 = ps3.executeQuery();
                
                if(rsp3.next()){ped.setPedidoId(rsp3.getInt("IDPedido"));}       
                
            }
        
        while (x <= MaxId){                       
            ped.setIdList(Integer.parseInt(request.getParameter("ValIdProd" + x)));
            ped.setQuantP(Integer.parseInt(request.getParameter("quantity" + x)));
                                                                                           
            String sql1 = "SELECT * FROM produtos WHERE idproduto = ?";                   
            String sql4 = "INSERT INTO produtospedido (IDPedido, IDProduto, Quantidade, Preco) VALUES (?, ?, ?, ?)";
               
            try(PreparedStatement ps = conexao.prepareStatement(sql1))
            {
                ps.setInt(1,ped.getIdList(x-1));
                ResultSet rsp = ps.executeQuery();
                
                if(rsp.next()){ped.setPreco(rsp.getInt("preco"));}       
                
            }
            
            if(ped.getQuantP(x-1) > 0){
            //Produtos ped
            try(PreparedStatement ps4 = conexao.prepareStatement(sql4))
            {
                ps4.setInt(1,ped.getPedidoId()); //
                ps4.setInt(2,ped.getIdList(x-1));
                ps4.setInt(3,ped.getQuantP(x-1));
                ps4.setFloat(4,ped.getPreco(x-1));
                
                ps4.executeUpdate();
            }
            
            
            
            out.println("IdProd: " + ped.getIdList(x-1));
            out.println("QuantProd: " + ped.getQuantP(x-1));
            out.println("PrecoProd: " + ped.getPreco(x-1));
            out.println("<br>");
            
            
        }
            x++;
            
            %><script>
        alert("Pedido feito!");
        window.location.href = "pizzerias.html";
        </script> <%
            
        }  
            conexao.close();
        }
            catch(Exception ex)
            {
            ex.printStackTrace();
            out.println("erro: " + ex.toString());           
            } 
        
     
               
        %>
    </body>
</html>
