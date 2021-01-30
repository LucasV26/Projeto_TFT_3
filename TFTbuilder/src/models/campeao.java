package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class campeao {
	private int 	ID;
	private String 	NOME;
    private String  FOTO;
    private String  HABILIDADE;
    private String  HABILIDADE_FOTO;
    private String  HABILIDADE_DESCRIP;
    private String  HABILIDADE_NVL;
    private int     CUSTO;
	
	private String tableName 	= "campeao";
	private String fieldsName = "ID, NOME, FOTO, HABILIDADE, HABILIDADE_FOTO, HABILIDADE_DESCRIP, HABILIDADE_NVL, CUSTO";
	private String keyField 	= "ID";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public campeao() {
		
	}
	
	public campeao(int ID) {
		this.setID(ID);
    }
	
	public campeao(int ID, String NOME, String FOTO, String HABILIDADE, String HABILIDADE_FOTO, String HABILIDADE_DESCRIP, String HABILIDADE_NVL, int CUSTO) {
		this.setID(ID);
        this.setNOME(NOME);
        this.setFOTO(FOTO);
        this.setHABILIDADE(HABILIDADE);
        this.setHABILIDADE_FOTO(HABILIDADE_FOTO);
        this.setHABILIDADE_DESCRIP(HABILIDADE_DESCRIP);
        this.setHABILIDADE_NVL(HABILIDADE_NVL);
        this.setCUSTO(CUSTO);
    }
	
	public String toString() {
		return (
				this.getID() + " | " +
				this.getNOME() + " | " +
				this.getFOTO() + " | " +
				this.getHABILIDADE() + " | " +
                this.getHABILIDADE_FOTO() + " | " +
                this.getHABILIDADE_DESCRIP() + " | " +
                this.getHABILIDADE_NVL() + " | " +
                this.getCUSTO()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID(),
                        "" + this.getNOME(),
                        "" + this.getFOTO(),
                		"" + this.getHABILIDADE(),
                		"" + this.getHABILIDADE_FOTO(),
                		"" + this.getHABILIDADE_DESCRIP(),
                		"" + this.getHABILIDADE_NVL(),
                		"" + this.getCUSTO()
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
	
	public int selectLastID() {
		ResultSet resultset = this.dbQuery.selectLastID();
		
		try {
			if(resultset.next()) {
				return(resultset.getInt("ID"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return 0;
	}
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public ResultSet selectJoin( String campos, String join, String where ) {
		ResultSet resultset = this.dbQuery.selectJoin(campos, join, where);
		return(resultset);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public void searchChamp() {
		try {
			ResultSet resultSet = this.select(" ID = " + this.getID());
			while (resultSet.next()) {
                this.setNOME(resultSet.getString("NOME"));
                this.setFOTO(resultSet.getString("FOTO"));
                this.setHABILIDADE(resultSet.getString("HABILIDADE"));
                this.setHABILIDADE_FOTO(resultSet.getString("HABILIDADE_FOTO"));
                this.setHABILIDADE_DESCRIP(resultSet.getString("HABILIDADE_DESCRIP"));
                this.setHABILIDADE_NVL(resultSet.getString("HABILIDADE_NVL"));
                this.setCUSTO(Integer.parseInt(resultSet.getString("CUSTO")));
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

	public String getNOME() {
		return NOME;
	}

	public void setNOME(String nOME) {
		NOME = nOME;
	}

	public String getFOTO() {
		return FOTO;
	}

	public void setFOTO(String fOTO) {
		FOTO = fOTO;
	}

	public String getHABILIDADE() {
		return HABILIDADE;
	}

	public void setHABILIDADE(String hABILIDADE) {
		HABILIDADE = hABILIDADE;
	}

	public String getHABILIDADE_FOTO() {
		return HABILIDADE_FOTO;
	}

	public void setHABILIDADE_FOTO(String hABILIDADE_FOTO) {
		HABILIDADE_FOTO = hABILIDADE_FOTO;
	}

	public String getHABILIDADE_DESCRIP() {
		return HABILIDADE_DESCRIP;
	}

	public void setHABILIDADE_DESCRIP(String hABILIDADE_DESCRIP) {
		HABILIDADE_DESCRIP = hABILIDADE_DESCRIP;
	}

	public String getHABILIDADE_NVL() {
		return HABILIDADE_NVL;
	}

	public void setHABILIDADE_NVL(String hABILIDADE_NVL) {
		HABILIDADE_NVL = hABILIDADE_NVL;
	}

	public int getCUSTO() {
		return CUSTO;
	}

	public void setCUSTO(int cUSTO) {
		CUSTO = cUSTO;
	}
	
	
}

