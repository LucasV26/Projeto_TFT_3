package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;
import multitool.RandomCode;

public class usuario {
	private int 	ID;
	private int 	ID_NIVEL;
	private String 	NOME;
	private String  FOTO;
	private String 	SENHA;
	private String 	EMAIL;
	
	private String tableName 	= "usuario";
	private String fieldsName = "ID, ID_NIVEL, NOME, FOTO, SENHA, EMAIL";
	private String keyField 	= "ID";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public usuario() {
		
	}
	
	public usuario(int ID) {
		this.setID(ID);
	}
	
	public usuario(String EMAIL) {
		this.setEMAIL(EMAIL);
	}
	
	public usuario(int ID, int ID_NIVEL, String NOME, String FOTO, String SENHA, String EMAIL) {
		this.setID(ID);
        this.setID_NIVEL(ID_NIVEL);
        this.setNOME(NOME);
        this.setFOTO(FOTO);
        this.setSENHA(SENHA);
        this.setEMAIL(EMAIL);
	}
	
	public usuario(String NOMEouEMAIL, String SENHA) {
        this.setNOME(NOMEouEMAIL);
        this.setEMAIL(NOMEouEMAIL);
        this.setSENHA(SENHA);
	}
	
	public String toString() {
		return (
				this.getID() + " | " +
				this.getID_NIVEL() + " | " +
				this.getNOME() + " | " +
				this.getFOTO() + " | " +
				this.getSENHA() + " | " +
				this.getEMAIL() 
				);
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						""+this.getID(),
						""+this.getID_NIVEL(),
						""+this.getNOME(),
						""+this.getFOTO(),
						""+this.getSENHA(),
						""+this.getEMAIL()
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
	
	public boolean newPassword() {

		try {
			ResultSet resultset = this.select(" EMAIL='"+ this.getEMAIL()+ "'");
			boolean existe = resultset.next();
			
			if ( existe ) {
				
				this.setID(resultset.getInt("ID")); 
				this.setID_NIVEL(resultset.getInt("ID_NIVEL"));
				this.setNOME(resultset.getString("NOME"));
				this.setFOTO(resultset.getString("FOTO"));
				this.setSENHA( new RandomCode().generate(18) );
				this.setEMAIL(resultset.getString("EMAIL"));
				
				this.save();
			}
			
			return existe;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean changeData(String newName, String newPic, String newEmail, String newPass) {
		
        try {
			ResultSet resultset = this.select(" ID = " + this.getID());
			boolean existe = resultset.next();
			
			if ( existe ) {
				
				this.setID(resultset.getInt("ID")); 
				this.setID_NIVEL(resultset.getInt("ID_NIVEL"));
				this.setNOME( newName );
				this.setFOTO( newPic );
				this.setEMAIL( newEmail );
				this.setSENHA( newPass );
				
				this.save();
			}
			
			return existe;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public void searchUser() {
		try {
			ResultSet resultSet = this.select(" ID = " + this.getID());
			while (resultSet.next()) {
				this.setID_NIVEL(resultSet.getInt("ID_NIVEL"));
				this.setNOME(resultSet.getString("NOME"));
				this.setFOTO(resultSet.getString("FOTO"));
				this.setSENHA(resultSet.getString("SENHA"));
				this.setEMAIL(resultSet.getString("EMAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkLogin() {
		int id = 0;
		try {
			ResultSet resultSet = this.select(" EMAIL='"+ this.getEMAIL()+ "' AND SENHA = '"+this.getSENHA() + "'");
			while (resultSet.next()) {
				id = resultSet.getInt("ID");
			}
			if(id == 0) {
				resultSet = this.select(" NOME='"+ this.getNOME()+ "' AND SENHA = '"+this.getSENHA() + "'");
				while (resultSet.next()) {
					id = resultSet.getInt("ID");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.setID(id);
		return(id > 0);	
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br/>";
		saida += "<table border = 1>";
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("ID") + "</td>";
				saida += "<td>" + rs.getString("ID_NIVEL") + "</td>";
				saida += "<td>" + rs.getString("NOME") + "</td>";
				saida += "<td>" + rs.getString("FOTO") + "</td>";
				saida += "<td>" + rs.getString("SENHA") + "</td>";
				saida += "<td>" + rs.getString("EMAIL") + "</td>";
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

	public void setID(int ID) {
		this.ID = ID;
	}

	public int getID_NIVEL() {
		return ID_NIVEL;
	}

	public void setID_NIVEL(int ID_NIVEL) {
		this.ID_NIVEL = ID_NIVEL;
	}

	public String getNOME() {
		return NOME;
	}

	public void setNOME(String NOME) {
		this.NOME = NOME;
	}
	
	public String getFOTO() {
		return FOTO;
	}

	public void setFOTO(String FOTO) {
		this.FOTO = FOTO;
	}

	public String getSENHA() {
		return SENHA;
	}

	public void setSENHA(String SENHA) {
		this.SENHA = SENHA;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String EMAIL) {
		this.EMAIL = EMAIL;
	}
}
