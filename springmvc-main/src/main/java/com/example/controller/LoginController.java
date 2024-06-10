package com.example.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.HashMap;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.example.config.Constantes;
import com.example.config.Token;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import veda.godao.DAO;
import veda.godao.utils.DAOConnexion;

@Controller
public class LoginController {
    private final DAO dao=new DAO("org.postgresql.Driver",
            "postgresql",
            "spring",
            "localhost",
            "5432",
            "postgres",
            "root",
            false,
            true, veda.godao.utils.Constantes.PSQL_ID);

    @GetMapping("/")
    public RedirectView index(){
        return new RedirectView("login.do");
    }
    @GetMapping("/login.do")
    public String login(HttpServletRequest req, ModelMap model, String message) throws Exception{
        HttpSession session=req.getSession();
        if(session.getAttribute("token")!=null){
            Token where=new Token();
            where.setToken(session.getAttribute("token").toString());
            Token change=new Token();
            change.setExpiration(LocalDateTime.now());
            change.setActive(0);
            try(Connection connex=DAOConnexion.getConnexion(dao)){
                dao.update(connex, change, where);
                connex.commit();
            }
        }
        session.removeAttribute("token");
        model.addAttribute("title", "Connexion");
        String mes="";
        if(message!=null){
            mes=URLDecoder.decode(message, StandardCharsets.UTF_8);
        }
        model.addAttribute("message", mes);
        return "login";
    }
    @PostMapping("/connexion.do")
    public RedirectView connexion(String role, String password) throws Exception{
        String message="Inexistent user or incorrect password";
        try(Connection connect=DAOConnexion.getConnexion(dao)){
            String query=String.format("select authority from genesis_user where username='%s' and password='%s'", role, password);
            HashMap<String, Object>[] result=dao.select(connect, query);
            if(result.length==1){
                String token=Base64.getEncoder().encodeToString((role+"!!"+LocalDateTime.now()).getBytes());
                LocalDateTime expiration=LocalDateTime.now().plusMinutes(Constantes.SESSION_EXPIRE);
                int authority=(int)result[0].get("authority");
                Token tokenObj=new Token();
                tokenObj.setToken(token);
                tokenObj.setAuthority(authority);
                tokenObj.setExpiration(expiration);
                tokenObj.setActive(10);
                dao.insertWithoutPrimaryKey(connect, tokenObj);
                connect.commit();
                return new RedirectView("hello.do?tokenUrl="+token);
            }
        }
        return new RedirectView("login.do?message="+URLEncoder.encode(message, StandardCharsets.UTF_8));
    }
}
