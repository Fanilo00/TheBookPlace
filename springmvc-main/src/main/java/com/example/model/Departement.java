package com.example.model;
import veda.godao.annotations.Column;
import veda.godao.annotations.Table;
import veda.godao.annotations.PrimaryKey;

@Table("dept")

public class Departement {
    @PrimaryKey
@Column("iddept")
private Integer iddept;
public Integer getIddept(){ return iddept; }
public void setIddept(Integer o){ iddept=o; }
@Column("label")
private String label;
public String getLabel(){ return label; }
public void setLabel(String o){ label=o; }
@Column("numero")
private Integer numero;
public Integer getNumero(){ return numero; }
public void setNumero(Integer o){ numero=o; }

    public Departement(){}
public Departement(Integer o){ iddept=o; }

}

