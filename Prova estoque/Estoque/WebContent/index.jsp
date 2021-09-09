<%@page import="java.util.ArrayList"%>
<%@page import="control.JogoControll"%>
<%@page import="model.Jogo"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Minha página</title>
</head>
<body>
	<%
		JogoControll jc = new JogoControll();
	
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String valor = request.getParameter("valor");
		String quantidade = request.getParameter("quantidade");
		String tipo = request.getParameter("tipo");

		
		if(nome != null &&
			descricao != null &&
			valor != null &&
			quantidade != null){

			
			
			Jogo j = new Jogo();
			j.setNome(nome);
			j.setDescricao(descricao);
			j.setValor(valor);
			j.setQuantiadade(quantidade);
			
			switch(tipo) {
				case "0":
					jc.cadastrar(j);
					break;
				case "1":
					jc.editar(j);
					break;
					
			}
		
	
		}
		
	%>
	<form action="index.jsp" method="POST">
	<input type="text" name="nome" id="nome" placeholder="Nome"><br>
	<input type="text" name="descricao" id="descricao" placeholder="Descrição"><br>
	<input type="text" name="valor" id="valor" placeholder="Valor"><br>
	<input type="text" name="quantidade" id="quantidade" placeholder="Quantidade"><br>
	<input type="hidden" name="tipo" value="0" id="tipo">
	<input type="hidden" name="excluir" value="0" id="excluir">
	<input type="submit" value="Cadastrar">
	
	</form>
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Descrição</th>
				<th>Valor</th>
				<th>Quantiade</th>
			</tr>
		</thead>
		<tbody>
			<%
				ArrayList<String>data = jc.lista();
				for(String linha : data){
					String[] tmp = linha.split(";");
					out.print("<tr>");
					out.print("<td>"+tmp[0]+"</td>");
					out.print("<td>"+tmp[1]+"</td>");
					out.print("<td>"+tmp[2]+"</td>");
					out.print("<td>"+tmp[3]+"</td>");
					out.print("<td><button onclick='edita(this)'>Editar</button></td>");
					out.print("<td><button onclick='apagar(this)'>Excluir</button></td>");
					out.print("</tr>");
				}
			%>
		</tbody>
	</table>
</body>
<script src="script.js"></script>
</html>