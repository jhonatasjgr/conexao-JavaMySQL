package util;
import java.sql.SQLException;
import java.util.Scanner;

public class classemain {
	@SuppressWarnings("resource")
	public static void main(String[] args) throws SQLException {
		Conexao c1 = new Conexao();
		Scanner teclado = new Scanner(System.in);
		int sel=18;
		String consulta1=("select cliente.nomecliente from aeroporto.cliente order by nomecliente");
		c1.setconsulta1(consulta1);
		String consulta2=("select SUM(quantidade_de_litros) FROM aeroporto.abastecimento, aeroporto.centroabastecimento, aeroporto.empresaaerea, aeroporto.aeronave, aeroporto, empresaaerea_e_aeroporto where aeronave.idaeronave=abastecimento.aeronave_idaeronave and centroabastecimento.idcentroabastecimento=abastecimento.centroabastecimento_idcentroabastecimento and aeronave.empresaaerea_idempresaaerea=empresaaerea.idempresaaerea and empresaaerea.idempresaaerea=empresaaerea_e_aeroporto.empresaaerea_idempresaaerea and empresaaerea_e_aeroporto.aeroporto_idaeroporto=aeroporto.idaeroporto;");
		c1.setConsulta2(consulta2);
		String consulta3=("select nomepiloto, nomeempresaaerea from aeroporto.piloto, aeroporto.empresaaerea, aeroporto.aeroporto, aeroporto.empresaaerea_e_aeroporto where piloto.empresaaerea_idempresaaerea=empresaaerea.idempresaaerea and empresaaerea.idempresaaerea=empresaaerea_e_aeroporto.empresaaerea_idempresaaerea and empresaaerea_e_aeroporto.aeroporto_idaeroporto=aeroporto.idaeroporto and aeroporto.idaeroporto=1 group by nomepiloto, nomeempresaaerea order by nomepiloto, nomeempresaaerea;");
		c1.setConsulta3(consulta3);
		String consulta4=("select count(modeloaeronave) from aeroporto.aeronave, aeroporto.empresaaerea where aeronave.empresaaerea_idempresaaerea=empresaaerea.idempresaaerea and modeloaeronave=737;");
		c1.setConsulta4(consulta4);
		String consulta5=("select nomefuncionario, enderecofuncionario from aeroporto.funcionario, aeroporto.setor, aeroporto.aeroporto where funcionario.setor_idsetor=setor.idsetor and setor.aeroporto_idaeroporto=aeroporto.idaeroporto and aeroporto.idaeroporto=1 group by nomefuncionario, enderecofuncionario;");
		c1.setConsulta5(consulta5);
		String consulta6=("select nomefuncionario from aeroporto.funcionario, aeroporto.setor, aeroporto.consulta, aeroporto.centromedico where funcionario.setor_idsetor=setor.idsetor and setor.idsetor=centromedico.setor_idsetor and centromedico.idcentromedico=consulta.centromedico_idcentromedico limit 0,2;");
		c1.setConsulta6(consulta6);
		String consulta7=("select nomecliente from aeroporto.cliente, aeroporto.cliente_e_empresaaerea, aeroporto.empresaaerea, aeroporto.setor, aeroporto.centropolicial, aeroporto.infracao where cliente.idcliente=cliente_e_empresaaerea.cliente_idcliente and cliente_e_empresaaerea.empresaaerea_idempresaaerea=empresaaerea.idempresaaerea and empresaaerea.setor_idsetor=setor.idsetor and centropolicial.setor_idsetor=centropolicial.idcentropolicial and centropolicial.idcentropolicial=infracao.centropolicial_idcentropolicial limit 0,5;");
		c1.setConsulta7(consulta7);
		String consulta8=("select nomeempresaaerea from aeroporto.empresaaerea, aeroporto.empresaaerea_e_aeroporto, aeroporto.aeroporto where empresaaerea.idempresaaerea=empresaaerea_e_aeroporto.empresaaerea_idempresaaerea and empresaaerea_e_aeroporto.aeroporto_idaeroporto=aeroporto.idaeroporto and aeroporto.idaeroporto=1;");
		c1.setConsulta8(consulta8);
		String consulta9=("select nomeempresaaerea, modeloaeronave from aeroporto.empresaaerea, aeroporto.aeronave where aeronave.empresaaerea_idempresaaerea=empresaaerea.idempresaaerea group by nomeempresaaerea, modeloaeronave;");
		c1.setConsulta9(consulta9);
		String consulta10=("select idvoo, nomepiloto, modeloaeronave, nomeempresaaerea, horariovoo, datavoo from aeroporto.voo, aeroporto_e_voo, aeroporto.piloto, aeroporto.aeronave, aeroporto.empresaaerea, aeroporto.aeroporto where aeroporto.idaeroporto=aeroporto_e_voo.aeroporto_idaeroporto and aeroporto_e_voo.voo_idvoo=voo.idvoo and voo.piloto_idpiloto=piloto.idpiloto and voo.aeronave_idaeronave=aeronave.idaeronave and piloto.empresaaerea_idempresaaerea=empresaaerea.idempresaaerea and aeroporto.idaeroporto=1;");
		c1.setConsulta10(consulta10);
		
		
		do {
		System.out.println("\n===========================================================================================================");
		System.out.println("Selecione: ");
		System.out.println("1-listar nome de todos os clientes em ordem alfabetica.");
		System.out.println("2-mostrar a soma da quantidade de litro abastecida em todos os aviões");
		System.out.println("3-mostrar nome e agrupar de todos os pilotos ligados a alguma empresa aerea presente no municio de bom jeus");
		System.out.println("4-contar a quantidade de aeronaves do modelo \"boing 737\" ligadas a alguma empresa aerea");
		System.out.println("5-listar o nome e endereço de todos os funcionarios ligados ao aeroporto de bom jesus");
		System.out.println("6-listar os nomes de 2 funcionarios que realizaram alguma consulta");
		System.out.println("7-listar os nomes de 5 clientes que cometeram alguma infração");
		System.out.println("8-listar todas as empresas aereas ligadas ao aeroporto de bom jesus");
		System.out.println("9-listar as empresas aereas e a aeronave de cada uma");
		System.out.println("10-listar todos os voos que sairam de bom jesus, seus pilotos, a aeronave, a empresa aerea, data e horario");
		System.out.println("0-finalizar");
		sel = teclado.nextInt();
		c1.setop(sel);
		c1.separador(); 
		if(sel!=0){
		c1.getConexao();
		}else {
			System.out.println("\nPROGRAMA FINALIZADO\n");
		}
		}while(sel!=0);
	}
}
