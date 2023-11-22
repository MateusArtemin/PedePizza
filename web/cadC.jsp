<%-- 
    Document   : cadC.jsp
    Created on : 16 de nov. de 2023, 12:06:48
    Author     : artemin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cliente"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        
    </head>
    
    <body>
        
        <h1>Clientes</h1>
        
        <%
            
            //sets
            Cliente clit = new Cliente(); 
            clit.setNome(request.getParameter("nome"));
            clit.setEmail(request.getParameter("email"));
            clit.setCPF(request.getParameter("CPF"));
            clit.setTelefone_cliente(request.getParameter("tel"));
            clit.setSenha(request.getParameter("senha"));
                       
            //GRAVAR!
            try{
                Class.forName("com.mysql.jdbc.Driver");       
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
                
                String sql = "INSERT INTO cliente (nome, senha, email, telefone_cliente, CPF) VALUES (?,?,?,?,?)";
                
                try(PreparedStatement stmt = conexao.prepareStatement(sql))
                {
                    stmt.setString(1,clit.getNome());
                    stmt.setString(2,clit.getSenha());
                    stmt.setString(3,clit.getEmail());
                    stmt.setString(4,clit.getTelefone_cliente());
                    stmt.setString(5,clit.getCPF());
                    
                    stmt.executeUpdate();
                }
                
                
                %> <script>
                alert("Cadastro concluido!");
                window.location.href = "register.html";
                </script>
            <%
                             
                conexao.close();                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            
                       
           out.println(clit.getNome() + clit.getSenha() + clit.getEmail() + clit.getTelefone_cliente() + clit.getCPF());
                       
        %>    
        
    </body>
</html>
