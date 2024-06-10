package com.example.model;
import veda.godao.annotations.Column;
import veda.godao.annotations.Table;
import veda.godao.annotations.PrimaryKey;

@Table("emp")

public class Emp {
    @PrimaryKey
@Column("idemp")
private Integer idemp;
public Integer getIdemp(){ return idemp; }
public void setIdemp(Integer o){ idemp=o; }
@Column("label")
private String label;
public String getLabel(){ return label; }
public void setLabel(String o){ label=o; }
@Column("embauche")
private java.time.LocalDate embauche;
public java.time.LocalDate getEmbauche(){ return embauche; }
public void setEmbauche(java.time.LocalDate o){ embauche=o; }
@Column("salaire")
private Double salaire;
public Double getSalaire(){ return salaire; }
public void setSalaire(Double o){ salaire=o; }
@veda.godao.annotations.ForeignKey(recursive=true)
@Column("iddeptemp")
private Departement dept;
public Departement getDept(){ return dept; }

    public Emp(){}
public Emp(Integer o){ idemp=o; }

    public void setDept(Departement dept) {
        this.dept = dept;
    }
}

