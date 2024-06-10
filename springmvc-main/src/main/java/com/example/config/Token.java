package com.example.config;

import java.time.LocalDateTime;

import veda.godao.annotations.Column;
import veda.godao.annotations.PrimaryKey;
import veda.godao.annotations.Table;

@Table("genesis_token")
public class Token {
    @PrimaryKey
    @Column("id")
    private Integer id;

    @Column("token")
    private String token;
    @Column("authority")
    private Integer authority;
    @Column("expiration")
    private LocalDateTime expiration;
    @Column("active")
    private Integer active;
    public Integer getActive() {
        return active;
    }
    public void setActive(Integer active) {
        this.active = active;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public Integer getAuthority() {
        return authority;
    }
    public void setAuthority(Integer authority) {
        this.authority = authority;
    }
    public LocalDateTime getExpiration() {
        return expiration;
    }
    public void setExpiration(LocalDateTime expiration) {
        this.expiration = expiration;
    }
    
}
