package main.ouch.core.dao;

import main.ouch.core.domain.Token;

public interface TokenDao {

    /**
     * 创建 Token
     */
    void addToken(Token token);

    /**
     * 查询 Token
     */
    Token queryToken(String userId, String token);

    /**
     * 删除 Token
     */
    void deleteToken(String userId, String token);
}
