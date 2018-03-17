package main.ouch.core.domain;

import org.springframework.stereotype.Component;

@Component("token")
public class Token {
    private String userId;
    private String date;
    private String Token;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getToken() {
        return Token;
    }

    public void setToken(String token) {
        Token = token;
    }
}
