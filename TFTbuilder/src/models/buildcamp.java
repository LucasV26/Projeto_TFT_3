package models;

import java.sql.ResultSet;

import database.DBQuery;

public class buildcamp {
	private int 	ID_CAMPEAO;
	private int 	ID_BUILD;
	
	private String tableName 	= "buildcamp";
	private String fieldsName = "ID_CAMPEAO, ID_BUILD";
	private String keyField 	= "ID_CAMPEAO, ID_BUILD";
	private DBQuery dbQuery 	= new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	public buildcamp() {
		
	}
	
	public buildcamp(int iD_BUILD) {
		this.setID_BUILD(iD_BUILD);
    }
	
	public buildcamp(int iD_CAMPEAO, int iD_BUILD) {
		this.setID_CAMPEAO(iD_CAMPEAO);
		this.setID_BUILD(iD_BUILD);
    }
	
	public String toString() {
		return (
				this.getID_CAMPEAO() + " | " +
				this.getID_BUILD()
		    );
	}
	
	public String[] toArray() {
		// Concatenado "" com os valores para ter certeza que todos sejam lidos como strings
		return (
					new String [] {
						"" + this.getID_CAMPEAO(),
						"" + this.getID_BUILD()
					}
				);
	}
	
	public void save() {
		this.dbQuery.insert(this.toArray());
	}
	
	public int clean() {
		String sql = "\nDELETE FROM "+this.tableName+" ";
		sql += "\n WHERE ID_BUILD = " + this.getID_BUILD();
		System.out.print( sql );
		return ( this.dbQuery.execute(sql) );
	}
	
	public int delete() {
		String sql = "\nDELETE FROM "+this.tableName+" ";
		sql += "\n WHERE ID_BUILD = " + this.getID_BUILD() + " AND ID_CAMPEAO = " + this.getID_CAMPEAO();
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

	public int getID_BUILD() {
		return ID_BUILD;
	}

	public void setID_BUILD(int iD_BUILD) {
		ID_BUILD = iD_BUILD;
	}
}


