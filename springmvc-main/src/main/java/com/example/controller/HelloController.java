package com.example.controller;
import java.sql.Connection;
import java.util.Base64;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;

import veda.godao.DAO;
import veda.godao.utils.Constantes;
import veda.godao.utils.DAOConnexion;

@Controller
public class HelloController {
    private final DAO dao=new DAO("org.postgresql.Driver",
            "postgresql",
            "spring",
            "localhost",
            "5432",
            "postgres",
            "root",
            false,
            true, veda.godao.utils.Constantes.PSQL_ID);

    @GetMapping("/hello.do")
    public Object crudpage(HttpServletRequest req, ModelMap model, String tokenUrl) throws Exception{
        HttpSession session=req.getSession();
        String token="";
        if(session.getAttribute("token")==null&&tokenUrl==null){
            return new RedirectView("login.do");
        }else if(session.getAttribute("token")==null){
            token=tokenUrl;
        }else{
            token=session.getAttribute("token").toString();
        }
        try(Connection connect=DAOConnexion.getConnexion(dao)){
            boolean exists=dao.exists(connect, "v_genesis_token_active", String.format("token='%s'", token));
            if(!exists){
                return new RedirectView("login.do");
            }
        }
        String tokenDecode=new String(Base64.getDecoder().decode(token));
        String username=tokenDecode.split("!!")[0];
        session.setAttribute("token", token);
        model.addAttribute("viewpage", "hello");
        model.addAttribute("title", "Welcome");
        model.addAttribute("username", username);
        return "layout/layout";
    }
}
