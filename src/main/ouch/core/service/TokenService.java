package main.ouch.core.service;

import main.ouch.core.domain.Token;

public interface TokenService {

    /**
     * 创建 Token
     */
    String addToken(String userId);

    /**
     * 检验 Token
     */
    Boolean checkToken(String userId, String token);

    /**
     * 删除 Token
     */
    void deleteToken(String userId, String token);

}
