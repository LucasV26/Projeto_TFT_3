package models;

import java.sql.ResultSet;

import database.DBQuery;

public class sincam {
	private int 	ID_CAMPEAO;
	private int 	ID_SINERGIA;
	
	private String tableName 	= "sincam";
	private String fieldsName = "ID_CAMPEAO, ID_SINERGIA";
	private String keyField 	= "ID_CAMPEAO, ID_SINERGIA";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public sincam() {
		
	}
	
	public sincam(int iD_CAMPEAO) {
		this.setID_CAMPEAO(iD_CAMPEAO);
    }
	
	public sincam(int iD_CAMPEAO, int iD_SINERGIA) {
		this.setID_CAMPEAO(iD_CAMPEAO);
		this.setID_SINERGIA(iD_SINERGIA);
    }
	
	public String toString() {
		return (
				this.getID_CAMPEAO() + " | " +
				this.getID_SINERGIA()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID_CAMPEAO(),
						"" + this.getID_SINERGIA()
					}
				);
	}
	
	public void save() {
		this.dbQuery.insert(this.toArray());
	}
	
	public int delete() {
		String sql = "\nDELETE FROM "+this.tableName+" ";
		sql += "\n WHERE ID_CAMPEAO = " + this.getID_CAMPEAO();
		System.out.print( sql );
		return ( this.dbQuery.execute(sql) );
	}
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public ResultSet selectBy( String field, String value ) {
		ResultSet resultset = this.dbQuery.select( " "+field+"='"+value+"'");
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

	public int getID_CAMPEAO() {
		return ID_CAMPEAO;
	}

	public void setID_CAMPEAO(int iD_CAMPEAO) {
		ID_CAMPEAO = iD_CAMPEAO;
	}	

	public int getID_SINERGIA() {
		return ID_SINERGIA;
	}

	public void setID_SINERGIA(int iD_SINERGIA) {
		ID_SINERGIA = iD_SINERGIA;
	}
}