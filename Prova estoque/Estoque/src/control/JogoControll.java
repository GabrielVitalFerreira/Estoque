package control;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import model.Jogo;

public class JogoControll {
	public boolean cadastrar(Jogo jg) {
		try {
			FileWriter jogo = new FileWriter("D:/jogo.txt", true);
			BufferedWriter bw = new BufferedWriter(jogo);
			
			String linha = jg.getNome() + ";" +
					   jg.getDescricao() + ";" +
					   jg.getValor() + ";" +
					   jg.getQuantidade() + ";";
			
			System.out.println("TO AQUI " + linha);
			
			bw.write(linha);
			
			bw.close();
			jogo.close();
			return true;
		}catch(Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	public ArrayList<String> lista() {
		ArrayList<String> data = new ArrayList<String>();
		
		try {
			FileReader fr = new FileReader("D:/jogo.txt");
			BufferedReader br = new BufferedReader(fr);
			
			String linha = "";
			while((linha = br.readLine()) != null) {
				data.add(linha);
			}
			
			br.close();
			fr.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return data;
	}
	public boolean editar(Jogo jg) {
		ArrayList<String> data = lista();
		
		try {
			FileWriter fw = new FileWriter("d:/cad.txt", false);
			BufferedWriter bw = new BufferedWriter(fw);
			
			for(int i = 0; i < data.size(); i++) {
				String linha = data.get(i);
				if(linha.contains(jg.getNome())) {
					linha = jg.getDescricao() + ";" +
							   jg.getValor() + ";" +
							   jg.getQuantidade() + ";" +
					data.remove(i);
					data.add(i, linha);
				}
				bw.write(data.get(i));
			}
			
			bw.close();
			fw.close();
			
			return true;
		}catch(Exception e) {
			
		}
		
		
		return false;
	}
}
