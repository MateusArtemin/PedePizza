<%-- 
    Document   : conta
    Created on : 21 de nov. de 2023, 11:50:21
    Author     : artemin
--%>

<%@page import="controle.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet"/>
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
        
    <%
    
    Class.forName("com.mysql.jdbc.Driver"); // registra            
    Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
    String SelectLog = "SELECT * FROM `usolog`";
    String SelectCli = "SELECT * FROM `cliente` WHERE idcliente = ?";
    
    Cliente cli = new Cliente();
    ResultSet rsLog;
    try
    {   
    
        try(PreparedStatement ps = conexao.prepareStatement(SelectLog))
        {
        
            rsLog = ps.executeQuery();
            rsLog.next(); 
            cli.setIdCli(Integer.parseInt(rsLog.getString("IdUsoLog")));
            
        }
        
        try(PreparedStatement psC = conexao.prepareStatement(SelectCli))
        {
            psC.setInt(1, cli.getIdCli());
            
            ResultSet PsCrs = psC.executeQuery();
            
            
            PsCrs.next();
            cli.setCPF(PsCrs.getString("CPF"));
                cli.setEmail(PsCrs.getString("email"));
                cli.setNome(PsCrs.getString("nome"));
                cli.setSenha(PsCrs.getString("senha"));
                cli.setTelefone_cliente(PsCrs.getString("telefone_cliente"));
        }
    
    }catch(Exception ex) 
    {
    ex.printStackTrace();
    out.println("Erro: " + ex.toString());
    }
    
    
    %>

    <div class="background-image"></div>
    
    <div class="login-container">
            
        <form name="FormConta" method="post" action="AtuConta.jsp">
                
            <p>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" value="<%= cli.getNome()  %>">
            </p>
                
            <p>
                <label for="email">Email:</label>
                <input type="text" name="email" id="email" value="<%= cli.getEmail()  %>">
            </p>
                
            <p>
                <label for="CPF">Cpf:</label>
                <input type="text" name="CPF" id="CPF" value="<%= cli.getCPF()  %>">
            </p>
                
            <p>
                <label for="tel">Telefone:</label>
                <input type="text" name="tel" id="tel" value="<%= cli.getTelefone_cliente()  %>">
            </p>
                
            <p>
                <label for="senha">Senha:</label>
                <input type="password" name="senha" id="senha" value="<%= cli.getSenha()  %>">
            </p>
            
            
            <input type="hidden" name="idCLI" id="idCLI" value="<%= cli.getIdCli() %>">
            <p> <button type="submit"> alterar </button> </p>
            
        </form>
        
    </div>

    <script src="js/log.js"></script>
    </body>
</html>
