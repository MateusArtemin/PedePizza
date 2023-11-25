<%-- 
    Document   : EnderQ
    Created on : 19 de nov. de 2023, 16:27:26
    Author     : artemin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="css/style.css" rel="stylesheet"/>
    
        <script src="js/log.js"></script>
    </head>
    
    <body>
    
    <header>
        <h1>Pede Pizza</h1>
    </header>
    
    <nav>
        <li><a href="index.html">HOME</a></li>
        <li><a href="pizzerias.html" class="switch3">PIZZARIAS</a></li>    
        <li><a href="EnderM.html" class="switch3">ENDEREÇOS</a></li>
        <li><a href="conta.jsp" class="switch3">CONTA</a></li>
        <li><a href="login.html" id="switch1">ENTRAR</a></li>
        <li><a href="register.html" id="switch2">CADASTRAR</a></li>
    </nav>
        
    <div class="background-image"></div>

    <div class="login-container" style="margin-top: 40px;">
        <form name="FormEnd" method="post" action="cadEnde.jsp">
            
            <p>
                <label for="ID">ID:</label>
                <% 
                            
                        String ss = request.getParameter("var1");
                        try
                        {
                             Class.forName("com.mysql.jdbc.Driver"); // registra            
                             Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
                             
                             int IdLog = 0;
                             ResultSet rs = null;
                             
                             String sql1 = "SELECT * FROM `usolog` ";
                             String sql2 = "SELECT * FROM endereco_cliente WHERE id_end_cliente=?";
                             String sql3 = "SELECT * FROM endereco_cliente WHERE idendereco=?";
                             
                             
                             try(PreparedStatement pstmt1 = conexao.prepareStatement(sql1))
                             {
                                    rs = pstmt1.executeQuery();
                                    if(rs.next())
                                    {                                   
                                    IdLog = Integer.parseInt(rs.getString("IdUsoLog"));   
                                    }
                             }
                             
                             
                             
                             try(PreparedStatement pstmt2 = conexao.prepareStatement(sql2))
                             {
                                    pstmt2.setInt(1,IdLog);
                                    rs = pstmt2.executeQuery();
                                    
                                    
                                    
                                    %> 
                <select id="fff" name="fff" onchange="mudouOpcao()">
                <option value="test"> Selecione um endereço </option> 
                    <%  
                        
                        while(rs.next())
                                    {
                                    int x = Integer.parseInt(rs.getString("idendereco"));
                    
                    %>
                    
                                    <option value=<%=x %>> <%=x %> </option>
                                     
                                    <%
                                    }
                                    
                             }

                             if(ss != "")
                             {
                                    
                                    try(PreparedStatement pstmt3 = conexao.prepareStatement(sql3))
                                    {
                                    pstmt3.setString(1, ss);
                                    rs = pstmt3.executeQuery();
                                    
                                        if(rs.next())
                                        {                                   

                                        String CEP = rs.getString("cep");
                                        String RUA = rs.getString("rua");
                                        String bairro = rs.getString("bairro");
                                        String cidade = rs.getString("cidade");
                                        String estado = rs.getString("estado");
                                        String complemento = rs.getString("complemento");
                                        String numero = rs.getString("numero");

                                        
          %> 
                    
                
                </select>
                    
            </p>
            
            <p>
                <label for="CEP">CEP:</label>
                <input type="text" name="CEP" id="CEP" value="<%= CEP %>" >
            </p>
            
            <p>
                <label for="Rua">Rua:</label>
                <input type="text" name="Rua" id="Rua" value="<%= RUA %>">
            </p>
            
            <p>
                <label for="Bairro">Bairro:</label>
                <input type="text" name="Bairro" id="Bairro" value="<%= bairro %>">
            </p>
            
            <p>
                <label for="Cidade">Cidade:</label>
                <input type="text" name="Cidade" id="Cidade" value="<%= cidade %>">
            </p>
            
            <p>
                <label for="Estado">Estado:</label>
                <input type="text" name="Estado" id="Estado" value="<%= estado %>">
            </p>
            
            
            <p>
                <label for="Complemento">Complemento:</label>
                <input type="text" name="Complemento" id="Complemento" value="<%= complemento %>">
            </p>
            
            
            <p>
                <label for="Numero">Numero:</label>
                <input type="text" name="Numero" id="Numero" value="<%= numero %>">
            </p>
            

            <p> <button type="submit" value="login"> atualizar </button> 
             <button type="submit" value="excluir" formaction="DelEnd.jsp"> excluir </button> </p>
            
            <input type="hidden" id="CIP" name="CIP" value="<%= ss %>">
        </form>
    </div>
          
    <%
                                        }
                                    }
                             
                             }
                        conexao.close();
                        }
                        
                        catch(Exception ex)
                        {
                            ex.printStackTrace();
                            out.println("Erro: " + ex.toString());
                        }
                    %>
    
    <script src="js/log.js"></script>
    
    <script>
        
        var CuteBunny = '<%= ss %>';
        //alert(CuteBunny);
        
        var select = document.getElementById("fff");
        
        for (var i = 0; i < select.options.length; i++) {
        if (select.options[i].value === CuteBunny) {
            select.options[i].selected = true;
            break;
        }
        }
        
        function mudouOpcao()
        {
            var selectElement = document.getElementById("fff");
            var selectedValue = selectElement.value;
            var url = 'EnderQ.jsp?var1=' + encodeURIComponent(selectedValue);
            window.location.href = url;
        }
            
            
        
        
        
        
        
         
       
    </script>

</body>
</html>

