package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class build {
	private int 	ID;
	private int 	ID_USUARIO;
	private String 	NOME;
    private String  DESCRIP;
	
	private String tableName 	= "build";
	private String fieldsName = "ID, ID_USUARIO, NOME, DESCRIP";
	private String keyField 	= "ID";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public build() {
		
	}
	
	public build(int ID_USUARIO) {
		this.setID_USUARIO(ID_USUARIO);
    }
	
	public build(int ID, int ID_USUARIO, String NOME, String DESCRIP) {
		this.setID(ID);
		this.setID_USUARIO(ID_USUARIO);
        this.setNOME(NOME);
        this.setDESCRIP(DESCRIP);
    }
	
	public String toString() {
		return (
				this.getID() + " | " +
				this.getID_USUARIO() + " | " +
				this.getNOME() + " | " +
                this.getDESCRIP()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID(),
						"" + this.getID_USUARIO(),
                        "" + this.getNOME(),
                		"" + this.getDESCRIP()
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
	
	public static int count(int ID_USUARIO) {
		int count = 1;
		
		DBQuery statementTemporario = new DBQuery("build", "ID, ID_USUARIO, NOME, DESCRIP", "ID");
		
		ResultSet RSbuilds =  statementTemporario.select( " ID_USUARIO = " + ID_USUARIO );
		
		try {
			while(RSbuilds.next()) {
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return count;
	}
	
	public int returnNewID() {
		int id = 0;
		ResultSet resultSet = this.select(" ID_USUARIO = " + this.getID_USUARIO());
		try {
			while(resultSet.next()) {
				if(resultSet.getInt("ID") > id)
					id = resultSet.getInt("ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public void searchBuild() {
		try {
			ResultSet resultSet = this.select(" ID = " + this.getID());
			while (resultSet.next()) {
				this.setID_USUARIO(Integer.parseInt(resultSet.getString("ID_USUARIO")));
                this.setNOME(resultSet.getString("NOME"));;
                this.setDESCRIP(resultSet.getString("DESCRIP"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
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

	public String getNOME() {
		return NOME;
	}

	public void setNOME(String nOME) {
		NOME = nOME;
	}

	public String getDESCRIP() {
		return DESCRIP;
	}

	public void setDESCRIP(String dESCRIP) {
		DESCRIP = dESCRIP;
	}
	
	
}

