package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class nivelusuario {
	private int 	ID;
	private String 	NOME;
	
	private String tableName 	= "nivelusuario";
	private String fieldsName = "ID, NOME";
	private String keyField 	= "ID";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public nivelusuario() {
		
	}
	
	public nivelusuario(int ID) {
		this.setID(ID);
    }
	
	public nivelusuario(int ID, String NOME) {
		this.setID(ID);
        this.setNOME(NOME);
    }
	
	public String toString() {
		return (
				this.getID() + " | " +
				this.getNOME()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID(),
                        "" + this.getNOME()
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
	
	public void searchLevel() {
		try {
			ResultSet resultSet = this.select(" ID = " + this.getID());
			while (resultSet.next()) {
                this.setNOME(resultSet.getString("NOME"));;
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
				saida += "<td>" + rs.getString("NOME") + "</td>";
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

	public String getNOME() {
		return NOME;
	}

	public void setNOME(String nOME) {
		NOME = nOME;
	}
	
	
}


