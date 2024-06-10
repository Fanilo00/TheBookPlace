package com.example.controller;
import com.example.model.Departement;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;
import veda.godao.DAO;
import veda.godao.utils.Constantes;
import veda.godao.utils.DAOConnexion;
import java.sql.Connection;

@Controller

public class DeptController {
    private final DAO dao=new DAO("org.postgresql.Driver",
            "postgresql",
            "spring",
            "localhost",
            "5432",
            "postgres",
            "root",
            false,
            true, veda.godao.utils.Constantes.PSQL_ID);


    @PostMapping("/insertdept.do")
public RedirectView insert(String iddept,String label,String numero) throws Exception{
    Departement o=new Departement();
    o.setLabel(label);o.setNumero(Integer.parseInt(numero));
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        dao.insertWithoutPrimaryKey(connex, o);
        connex.commit();
        return new RedirectView("tocruddept.do");
    }
}
@GetMapping("/tocruddept.do")
public String crudpage(ModelMap model) throws Exception{
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        Departement[] o=dao.select(connex,Departement.class);
        model.addAttribute("o", o);
        model.addAttribute("viewpage", "dept");
        model.addAttribute("title", "Departement");
        
        return "layout/layout";
    }
}
@PostMapping("/updatedept.do")
public RedirectView update(String iddept,String label,String numero) throws Exception{
    Departement o=new Departement();
    o.setLabel(label);o.setNumero(Integer.parseInt(numero));
    Departement where=new Departement();
    where.setIddept(Integer.parseInt(iddept));
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        dao.update(connex, o, where);
        connex.commit();
        return new RedirectView("tocruddept.do");
    }
}
@PostMapping("/deletedept.do")
public RedirectView delete(String iddept) throws Exception{
    Departement where=new Departement();
    where.setIddept(Integer.parseInt(iddept));
    try(Connection connex=DAOConnexion.getConnexion(dao)){
        dao.delete(connex, where);
        connex.commit();
        return new RedirectView("tocruddept.do");
    }
}

}

