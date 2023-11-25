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
            
            clit.setId(request.getParameter("CIP"));
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
                
                String sql1 = "UPDATE endereco_cliente SET rua = ?, bairro = ?, cidade = ?, estado = ?, complemento = ?, numero = ?, cep = ? WHERE idendereco = ?;";
                String sql2 = "SELECT * FROM `usolog`";
                
                
                
                try (PreparedStatement pstmtt = conexao.prepareStatement(sql2))
                {
                    rs = pstmtt.executeQuery();
                    if (rs.next()) {
                        IdLog = Integer.parseInt(rs.getString("IdUsoLog"));   
                        clit.setIdC(IdLog);
                    }
                }
  
                
                try (PreparedStatement pstmt = conexao.prepareStatement(sql1)) {
                    pstmt.setString(8, clit.getId());
                    pstmt.setString(1, clit.getRua());
                    pstmt.setString(2, clit.getBairro());
                    pstmt.setString(3, clit.getCidade());
                    pstmt.setString(4, clit.getEstado());
                    pstmt.setString(5, clit.getComplemento());
                    pstmt.setString(6, clit.getNumero());
                    pstmt.setString(7, clit.getCep());
                    
                    out.println("<br> aa:" + clit.getId() + "<br>");
                    pstmt.executeUpdate();
                    
                }
                
                    %><script>
        alert("Endereço alterado!");
        window.location.href = "EnderQ.jsp";
        </script> <%
                
                conexao.close();      
            }
            catch(Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
                
            }
            out.println("IdC: " + request.getParameter("CIP"));

        %>
    </body>
</html>
