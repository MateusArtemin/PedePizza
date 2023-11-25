<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Enderecos"%>
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
            
            
            Enderecos clit = new Enderecos(); 
            ResultSet rs = null;
            
            clit.setCep(request.getParameter("CEP"));
            clit.setRua(request.getParameter("Rua"));
            clit.setBairro(request.getParameter("Bairro"));
            clit.setCidade(request.getParameter("Cidade"));
            clit.setEstado(request.getParameter("Estado"));
            clit.setComplemento(request.getParameter("Complemento"));
            clit.setNumero(request.getParameter("Numero"));     
            
            out.println(
            "CEP: " + clit.getCep() + "<br>" +
            "Rua: " + clit.getRua() + "<br>" +
            "Bairro: " + clit.getBairro() + "<br>" +
            "Cidade: " + clit.getCidade() + "<br>" +
            "Estado: " + clit.getEstado() + "<br>" +
            "Complemento: " + clit.getComplemento() + "<br>" +
            "Número: " + clit.getNumero() + "<br>");
            
            int IdLog = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver"); // registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
                
                
                String sql1 = "INSERT INTO endereco_cliente (id_end_cliente, rua, bairro, cidade, estado , complemento , numero , cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                String sql2 = "SELECT * FROM `usolog`";
                
                
                
                try (PreparedStatement pstmtt = conexao.prepareStatement(sql2))
                {
                    rs = pstmtt.executeQuery();
                    if (rs.next()) {
                        IdLog = Integer.parseInt(rs.getString("IdUsoLog"));   
                        out.println(IdLog);
                        clit.setIdC(IdLog);
                    }
                }
  
                
                try (PreparedStatement pstmt = conexao.prepareStatement(sql1)) {
                    pstmt.setString(1, clit.getIdC() + "");
                    pstmt.setString(2, clit.getRua());
                    pstmt.setString(3, clit.getBairro());
                    pstmt.setString(4, clit.getCidade());
                    pstmt.setString(5, clit.getEstado());
                    pstmt.setString(6, clit.getComplemento());
                    pstmt.setString(7, clit.getNumero());
                    pstmt.setString(8, clit.getCep());
                    
                    out.println("<br> aa:" + clit.getIdC() + "<br>");
                    pstmt.executeUpdate();
                    
                }
                
                    %><script>
        alert("Endereço cadastrado!");
        window.location.href = "ender.html";
        </script> <%
                
                conexao.close();      
            }
            catch(Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
                
            }
            

        %>
    </body>
</html>
