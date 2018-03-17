package main.ouch.core.service.impl;

import main.ouch.core.dao.TokenDao;
import main.ouch.core.domain.Token;
import main.ouch.core.service.TokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class TokenServiceImpl implements TokenService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TokenDao tokenDao;

    @Autowired
    private Token token;

    @Override
    public Token addToken(String userId) {
        token.setUserId(userId);
        tokenDao.addToken(token);

        return token;
    }

    @Override
    public Boolean checkToken(String userId, String token) {
        Token tokenInfo = tokenDao.queryToken(userId,token);
        return false;
    }

    @Override
    public void deleteToken(String userId, String token) {
        tokenDao.deleteToken(userId,token);
    }
}
