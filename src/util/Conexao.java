package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Conexao {
	 	 private static String consulta1;
		public String getconsulta1() {
			return consulta1;
		}
		public void setconsulta1(String novaconsulta1) {
			Conexao.consulta1=novaconsulta1;
		}
	 	 static String consulta2;
	 	public String getConsulta2() {
			return consulta2;
		}
		public void setConsulta2(String novaconsulta2) {
			consulta2=novaconsulta2;
		}
		 static String consulta3;
		public String getConsulta3() {
			return consulta3;
		}
		public void setConsulta3(String novaconsulta3) {
			consulta3=novaconsulta3;
		}
		 static String consulta4;
		public String getConsulta4() {
			return consulta4;
		}
		public void setConsulta4(String novaconsulta4) {
			consulta4=novaconsulta4;
		}
		 static String consulta5;
		public String getConsulta5() {
			return consulta5;
		}
		public void setConsulta5(String novaconsulta5) {
			consulta5=novaconsulta5;
		}
		 static String consulta6;
		public String getConsulta6() {
			return consulta6;
		}
		public void setConsulta6(String novaconsulta6) {
			consulta6=novaconsulta6;
		}
		  static String consulta7;
		public String getConsulta7() {
			return consulta7;
		}
		public void setConsulta7(String novaconsulta7) {
			consulta7=novaconsulta7;
		}
		   static String consulta8;
		public String getConsulta8() {
			return consulta8;
		}
		public void setConsulta8(String novaconsulta8) {
			consulta8=novaconsulta8;
		}
		   static String consulta9;
		public String getConsulta9() {
			return consulta9;
		}
		public void setConsulta9(String novaconsulta9) {
			consulta9=novaconsulta9;
		}
		   static String consulta10;
		public String getConsulta10() {
			return consulta10;
		}
		public void setConsulta10(String novaconsulta10) {
			consulta10=novaconsulta10;
		}
		
		 int op;
		 static String imprimir;
		public int getop() {
			return op;
		}
		public void setop(int novoop) {
			this.op=novoop;
		}
		public  void separador(){
    	switch(op) {
    	case 1:
    		imprimir=consulta1;
    		break;
    	case 2:
    		imprimir=consulta2;
    		break;
    	case 3:
    		imprimir=consulta3;
    		break;
    	case 4:
    		imprimir=consulta4;
    		break;
    	case 5:
    		imprimir=consulta5;
    		break;
    	case 6:
    		imprimir=consulta6;
    		break;
    	case 7:
    		imprimir=consulta7;
    		break;
    	case 8:
    		imprimir=consulta8;
    		break;
    	case 9:
    		imprimir=consulta9;
    		break;
    	case 10:
    		imprimir=consulta10;
    		break;
    	}
    }
	@SuppressWarnings("unused")
	public Connection getConexao() {
		Connection conn = null;
		Statement smtm = null;
		String USER = "root";
		String PASS = "root";
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aeroporto",USER, PASS);
			System.out.println("Conectado com sucesso!");			
			Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(imprimir);
			 switch(op) {
			 	case 1:
			 		System.out.println("\n=====CLIENTES=====");
			 		while(rs.next()) {
			 			String nome = rs.getString("nomecliente");
						System.out.println("Nome:" + nome);
			 		}break;
			 	case 2:
			 		System.out.println("\nQuantidade de litros abastecidos em todo o aeroporto");
			 		while(rs.next()) {
						int qtd = rs.getInt("SUM(quantidade_de_litros)");
						System.out.println("QUANTIDADE=>> " + qtd + "litros");
					}break;
			 	case 3:
			 		System.out.println("\nNome dos pilotos ligados a alguma empresa aerea");
				 	while(rs.next()) {
						String nome = rs.getString("nomepiloto");
						System.out.println("Nome do Piloto->> " + nome);
					}break;
			 	case 4:
			 		System.out.println("\nQuantidade de aeronaves do modelo 'Boing-737'");
				 	while(rs.next()) {
						int qtd = rs.getInt("count(modeloaeronave)");
						System.out.println("Quantidade de aeronaves->> " + qtd + " unidades");
					}break;
			 	case 5: 
			 		System.out.println("\nNome e endereço dos funcionarios do aeroporto");
				 	while(rs.next()) {
				 		String nome = rs.getString("nomefuncionario");
				 		String endereco = rs.getString("enderecofuncionario");
				 		System.out.println("\nNome: " + nome + "\nEndereço:" + endereco);
				 	}break;
			 	case 6:
			 		System.out.println("\nNome dos funcionarios que precisaram de consulta");
				 	while(rs.next()) {
						String nome = rs.getString("nomefuncionario");
						System.out.println("Nome: " + nome);
					}break;
			 	case 7: 
			 		System.out.println("\nNome de clientes Infratores");
				 	while(rs.next()) {
						String nome = rs.getString("nomecliente");
						System.out.println("Nome: " + nome);
					}break;
			 	case 8: 
			 		System.out.println("\nNome das empresas aereas");
				 	while(rs.next()) {
						String nome = rs.getString("nomeempresaaerea");
						System.out.println("Nome: " + nome);
					}break;
			 	case 9: 
			 		System.out.println("\nEmpresas aereas e suas aeronaves");
				 	while(rs.next()) {
				 		String nomeempresaaerea = rs.getString("nomeempresaaerea");
				 		String modeloaeronave = rs.getString("modeloaeronave");
				 		System.out.println("Nome da Empresa Aerea: " + nomeempresaaerea + "\nModeloa da Aeronave: " + modeloaeronave +"\n");
				 	}break;
			 	case 10: 
				 	System.out.println("\n\n===DADOS DO VOO===");
				 	while(rs.next()) {
				 		int idvoo = rs.getInt("idvoo");
					 	String nomepiloto = rs.getString("nomepiloto");
					 	String modeloaeronave = rs.getString("modeloaeronave");
					 	String nomeempresa = rs.getString("nomeempresaaerea");
					 	String horavoo = rs.getString("horariovoo");
					 	String datavoo = rs.getString("datavoo");
					 	System.out.println("ID do voo: " + idvoo);
					 	System.out.println("Nome do Piloto: " + nomepiloto);
					 	System.out.println("Modelo da Aeronave: " + modeloaeronave);
					 	System.out.println("Nome da Empresa Aerea: " + nomeempresa); 
					 	System.out.println("Hora do voo:  " + horavoo); 
					 	System.out.println("Data do voo:  " + datavoo);
					 	System.out.println("\n");
				 	}break;
			 	case 0:
				break;
			 }
		} catch (SQLException e) {
			System.err.println("Erro ao conectar");
			e.printStackTrace();
		}
		return conn;
	}
	@SuppressWarnings("unused")
	private static Statement createStatement() {
		return null;
	}	
}