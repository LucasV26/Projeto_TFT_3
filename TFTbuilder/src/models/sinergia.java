package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class sinergia {
	private int 	ID;
	private String 	NOME;
    private String  FOTO;
    private String  DESCRIP;
    private String  MARCA_DESCRIP;
    private int     MARCA;
    private int     QTD_MK1;
    private int     QTD_MK2;
    private int     QTD_MK3;
    private int     QTD_MK4;
    private String  TIPO;
	
	private String tableName 	= "sinergia";
	private String fieldsName = "ID, NOME, FOTO, DESCRIP, MARCA_DESCRIP, MARCA, QTD_MK1, QTD_MK2, QTD_MK3, QTD_MK4, TIPO";
	private String keyField 	= "ID";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public sinergia() {
		
	}
	
	public sinergia(int ID) {
		this.setID(ID);
    }
	
	public sinergia(String tIPO) {
		this.setTIPO(tIPO);
    }
	
	public sinergia(int ID, String NOME, String FOTO, String DESCRIP, String MARCA_DESCRIP, int MARCA, int QTD_MK1, int QTD_MK2, int QTD_MK3, int QTD_MK4, String TIPO) {
		this.setID(ID);
        this.setNOME(NOME);
        this.setFOTO(FOTO);
        this.setDESCRIP(DESCRIP);
        this.setMARCA_DESCRIP(MARCA_DESCRIP);
        this.setMARCA(MARCA);
        this.setQTD_MK1(QTD_MK1);
        this.setQTD_MK2(QTD_MK2);
        this.setQTD_MK3(QTD_MK3);
        this.setQTD_MK4(QTD_MK4);
        this.setTIPO(TIPO);
    }
	
	public String toString() {
		return (
				this.getID() + " | " +
				this.getNOME() + " | " +
				this.getFOTO() + " | " +
				this.getDESCRIP() + " | " +
				this.getMARCA_DESCRIP() + " | " +
                this.getMARCA() + " | " +
                this.getQTD_MK1() + " | " +
                this.getQTD_MK2() + " | " +
                this.getQTD_MK3() + " | " +
                this.getQTD_MK4() + " | " +
                this.getTIPO()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID(),
                        "" + this.getNOME(),
                        "" + this.getFOTO(),
                        "" + this.getDESCRIP(),
                        "" + this.getMARCA_DESCRIP(),
                        "" + this.getMARCA(),
                        "" + this.getQTD_MK1(),
                        "" + this.getQTD_MK2(),
                        "" + this.getQTD_MK3(),
                        "" + this.getQTD_MK4(),
                        "" + this.getTIPO()
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
	
	public ResultSet selectJoin( String campos, String join, String where ) {
		ResultSet resultset = this.dbQuery.selectJoin(campos, join, where);
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
	
	public void searchSynergy() {
		try {
			ResultSet resultSet = this.select(" ID = " + this.getID());
			while (resultSet.next()) {
                this.setNOME(resultSet.getString("NOME"));
                this.setFOTO(resultSet.getString("FOTO"));
                this.setDESCRIP(resultSet.getString("DESCRIP"));
                this.setMARCA_DESCRIP(resultSet.getString("MARCA_DESCRIP"));
                this.setMARCA(resultSet.getInt("MARCA"));
                this.setQTD_MK1(resultSet.getInt("QTD_MK1"));
                this.setQTD_MK2(resultSet.getInt("QTD_MK2"));
                this.setQTD_MK3(resultSet.getInt("QTD_MK3"));
                this.setQTD_MK4(resultSet.getInt("QTD_MK4"));
                this.setTIPO(resultSet.getString("TIPO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getID() {
		return ID;
	}

	public void setID(int ID) {
		this.ID = ID;
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

	public String getDESCRIP() {
		return DESCRIP;
	}

	public void setDESCRIP(String DESCRIP) {
		this.DESCRIP = DESCRIP;
	}

    public String getMARCA_DESCRIP() {
		return MARCA_DESCRIP;
	}

	public void setMARCA_DESCRIP(String MARCA_DESCRIP) {
		this.MARCA_DESCRIP = MARCA_DESCRIP;
	}

    public int getMARCA() {
		return MARCA;
	}

	public void setMARCA(int MARCA) {
		this.MARCA = MARCA;
	}

    public int getQTD_MK1() {
		return QTD_MK1;
	}

	public void setQTD_MK1(int QTD_MK1) {
		this.QTD_MK1 = QTD_MK1;
	}

    public int getQTD_MK2() {
		return QTD_MK2;
	}

	public void setQTD_MK2(int QTD_MK2) {
		this.QTD_MK2 = QTD_MK2;
	}

    public int getQTD_MK3() {
		return QTD_MK3;
	}

	public void setQTD_MK3(int QTD_MK3) {
		this.QTD_MK3 = QTD_MK3;
	}

    public int getQTD_MK4() {
		return QTD_MK4;
	}

	public void setQTD_MK4(int QTD_MK4) {
		this.QTD_MK4 = QTD_MK4;
	}

    public String getTIPO() {
		return TIPO;
	}

	public void setTIPO(String TIPO) {
		this.TIPO = TIPO;
	}
}
