<%-- 
    Document   : DelEnd
    Created on : 21 de nov. de 2023, 13:00:34
    Author     : artemin
--%>

<%@page import="controle.Enderecos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
        
        Enderecos end = new Enderecos();
        end.setId(request.getParameter("fff"));
        
        Class.forName("com.mysql.jdbc.Driver"); // registra            
        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
        String DelSQL = "DELETE FROM endereco_cliente WHERE idendereco = ?";
        String SDEL = "SELECT * FROM pedidog WHERE IDEndereco = ?";
        
        try
        {
            try(PreparedStatement ps= conexao.prepareStatement(SDEL))
            {
                ps.setString(1, end.getId());
                ResultSet rs = ps.executeQuery();
                
                if(rs.next())
                {
                    out.println("Não pode ser excluido, esse endereço está ligado a um pedido");
                 %> 
                <script>
                alert("Não pode ser excluido, esse endereço está ligado a um pedido!");
                window.location.href = "EnderQ.jsp";
                </script>
                <%
                }else
                {
                    try(PreparedStatement PSDEL= conexao.prepareStatement(DelSQL))
                     {
                      PSDEL.setString(1, end.getId());
                        PSDEL.executeUpdate();
                     }
                     out.println("Excluido com sucesso");
                     %> 
                <script>
                alert("Excluido com sucesso!");
                window.location.href = "EnderQ.jsp";
                </script>
                <%
                }
            }
        
            
        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }
        
        %>
    </body>
</html>
