package com.example.controller;

import com.example.model.Departement;
import com.example.model.Emp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;
import veda.godao.DAO;
import veda.godao.utils.DAOConnexion;
import java.sql.Connection;

@Controller

public class EmpController {
    private final DAO dao=new DAO("org.postgresql.Driver",
            "postgresql",
            "spring",
            "localhost",
            "5432",
            "postgres",
            "root",
            false,
            true, veda.godao.utils.Constantes.PSQL_ID);



    @PostMapping("/insertemp.do")
public RedirectView insert(String idemp,String label,String embauche,String salaire,String dept) throws Exception{
    Emp o=new Emp();
    o.setLabel(label);o.setEmbauche(java.time.LocalDate.parse(embauche));o.setSalaire(Double.parseDouble(salaire));o.setDept(new Departement(Integer.parseInt(dept)));
        try(Connection connex=DAOConnexion.getConnexion(dao)){
        dao.insertWithoutPrimaryKey(connex, o);
        connex.commit();
        return new RedirectView("tocrudemp.do");
    }
}
@GetMapping("/tocrudemp.do")
public String crudpage(ModelMap model) throws Exception{
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        Emp[] o=dao.select(connex, Emp.class);
        model.addAttribute("o", o);
        model.addAttribute("viewpage", "emp");
        model.addAttribute("title", "Emp");
        Departement[] dept=dao.select(connex, Departement.class);
model.addAttribute("depts", dept);
        return "layout/layout";
    }
}
@PostMapping("/updateemp.do")
public RedirectView update(String idemp,String label,String embauche,String salaire,String dept) throws Exception{
    Emp o=new Emp();
    o.setLabel(label);o.setEmbauche(java.time.LocalDate.parse(embauche));o.setSalaire(Double.parseDouble(salaire));o.setDept(new Departement(Integer.parseInt(dept)));
    Emp where=new Emp();
    where.setIdemp(Integer.parseInt(idemp));
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        dao.update(connex, o, where);
        connex.commit();
        return new RedirectView("tocrudemp.do");
    }
}
@PostMapping("/deleteemp.do")
public RedirectView delete(String idemp) throws Exception{
    Emp where=new Emp();
    where.setIdemp(Integer.parseInt(idemp));
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        dao.delete(connex, where);
        connex.commit();
        return new RedirectView("tocrudemp.do");
    }
}

}

