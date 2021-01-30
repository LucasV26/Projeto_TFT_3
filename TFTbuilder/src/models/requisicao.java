package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class requisicao {
	private int 	ID;
	private int 	ID_USUARIO;
	private String 	NIVEL_ATUAL;
	private String 	NIVEL_ALMEJADO;
	
	private String tableName 	= "requisicao";
	private String fieldsName   = "ID, ID_USUARIO, NIVEL_ATUAL, NIVEL_ALMEJADO";
	private String keyField 	= "ID";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public requisicao() {
		
	}
	
	public requisicao(int iD, int iD_USUARIO, String nIVEL_ATUAL, String nIVEL_ALMEJADO) {
		this.setID(iD);
		this.setID_USUARIO(iD_USUARIO);
		this.setNIVEL_ATUAL(nIVEL_ATUAL);
		this.setNIVEL_ALMEJADO(nIVEL_ALMEJADO);
	}
	
	public requisicao(int ID_USUARIO) {
		this.setID_USUARIO(ID_USUARIO);
    }
	
	public String toString() {
		return (
				this.getID() + " | " +
				this.getID_USUARIO() + " | " +
				this.getNIVEL_ATUAL() + " | " +
				this.getNIVEL_ALMEJADO()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID(),
						"" + this.getID_USUARIO(),
						"" + this.getNIVEL_ATUAL(),
						"" + this.getNIVEL_ALMEJADO()
					}
				);
	}
	
	public void save() {
		if(this.getID() == 0) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if(this.getID() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public ResultSet selectBy( String field, String value ) {
		ResultSet resultset = this.dbQuery.select( " "+field+"='"+value+"'");
		return(resultset);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public void searchRequestByID() {
		try {
			ResultSet resultSet = this.select(" ID = " + this.getID());
			while (resultSet.next()) {
                this.setID_USUARIO(resultSet.getInt("ID_USUARIO"));
                this.setNIVEL_ATUAL(resultSet.getString("NIVEL_ATUAL"));
                this.setNIVEL_ALMEJADO(resultSet.getString("NIVEL_ALMEJADO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void searchRequest() {
		try {
			ResultSet resultSet = this.select(" ID_USUARIO = " + this.getID_USUARIO());
			while (resultSet.next()) {
                this.setID(Integer.parseInt(resultSet.getString("ID")));
                this.setNIVEL_ATUAL(resultSet.getString("NIVEL_ATUAL"));
                this.setNIVEL_ALMEJADO(resultSet.getString("NIVEL_ALMEJADO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br/>";
		saida += "<table border = 1>";
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("ID") + "</td>";
				saida += "<td>" + rs.getString("ID_USUARIO") + "</td>";
				saida += "<td>" + rs.getString("NIVEL_ATUAL") + "</td>";
				saida += "<td>" + rs.getString("NIVEL_ALMEJADO") + "</td>";
				saida += "</tr> <br/>";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return saida;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getID_USUARIO() {
		return ID_USUARIO;
	}

	public void setID_USUARIO(int iD_USUARIO) {
		ID_USUARIO = iD_USUARIO;
	}

	public String getNIVEL_ATUAL() {
		return NIVEL_ATUAL;
	}

	public void setNIVEL_ATUAL(String nIVEL_ATUAL) {
		NIVEL_ATUAL = nIVEL_ATUAL;
	}

	public String getNIVEL_ALMEJADO() {
		return NIVEL_ALMEJADO;
	}

	public void setNIVEL_ALMEJADO(String nIVEL_ALMEJADO) {
		NIVEL_ALMEJADO = nIVEL_ALMEJADO;
	}

	
}
