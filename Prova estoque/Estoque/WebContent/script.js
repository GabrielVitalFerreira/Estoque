var nome = document.querySelector("#nome");
var descricao = document.querySelector("#descricao");
var valor = document.querySelector("#valor");
var quantiade = document.querySelector("#quantiade");
var tipo = document.querySelector("#tipo");
var excluir = document.querySelector("#excluir");
var bt = document.querySelector("input[type=submit]");
var apaga = document.querySelector("input[type=submit]");


function edita(e) {
	let linha = e.parentNode.parentNode.querySelectorAll("td");
	nome.value = linha[0].innerHTML;
	descricao.value = linha[1].innerHTML;
	valor.value = linha[2].innerHTML;
	quantidade.value = linha[3].innerHTML;
	tipo.value = 1;
	bt.value = "Editar";
}
function apagar(e) {
	e.parentNode.parentNode.remove();
}
