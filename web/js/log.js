

         
        function atualizar() {
            var s1 = document.getElementById("switch1");
            var s2 = document.getElementById("switch2");
            
            var qiqi = false;
            var qiqi = localStorage.getItem('usuarioLogado');           
            
            
            
            if (qiqi === "true") {
                s1.innerHTML = 'PEDIDOS';
                s1.href = 'pedidos.html';
                s2.innerHTML = 'SAIR';
                s2.href = 'javascript:deslogarUsuario()';          
 
            } else {
                s1.innerHTML = 'ENTRAR';
                s1.href = 'login.html';
                s2.innerHTML = 'CADASTRAR';
                s2.href = 'register.html';
            }
        }
        
        function deslogarUsuario() {
            localStorage.setItem('usuarioLogado', 'false');
       atualizar();
       alert( usuarioLogado);
     window.location.href = 'index.html';
    
}
        window.onload = atualizar();
