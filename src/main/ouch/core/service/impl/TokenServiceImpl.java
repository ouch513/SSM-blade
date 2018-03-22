package main.ouch.core.service.impl;

import main.ouch.common.tool.TokenUtil;
import main.ouch.core.dao.TokenDao;
import main.ouch.core.domain.Token;
import main.ouch.core.service.TokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TokenServiceImpl implements TokenService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TokenDao tokenDao;

    @Autowired
    private Token token;

    @Override
    public String addToken(String userId) {
        token.setUserId(userId);
        token.setCreatedAt(TokenUtil.nowDate());
        token.setToken(TokenUtil.createToken(userId));
        tokenDao.addToken(token);

        return token.getToken();
    }

    @Override
    public Boolean checkToken(String userId, String tokenStr) {
        token.setToken(tokenStr);
        token.setUserId(userId);
        Token tokenInfo = tokenDao.queryToken(token);
        if(tokenInfo==null){
            return false;
        }else{
            return TokenUtil.checkTime(tokenInfo.getCreatedAt());
        }
    }

    @Override
    public void deleteToken(String userId, String token) {
        tokenDao.deleteToken(userId,token);
    }
}
