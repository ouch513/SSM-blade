package main.ouch.core.service.impl;

import main.ouch.common.format.JsonResponse;
import main.ouch.common.tool.ValueUtil;
import main.ouch.constant.Message;
import main.ouch.core.dao.BulletinDao;
import main.ouch.core.dao.UserDao;
import main.ouch.core.domain.Bulletin;
import main.ouch.core.domain.User;
import main.ouch.core.service.BulletinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class BulletinServiceImpl implements BulletinService{

    @Autowired
    private BulletinDao bulletinDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private User user;

    @Override
    public String getList(String userId, String token) {
        List<Bulletin> bulletinList =  bulletinDao.queryAll();
        return JsonResponse.bulletinList(bulletinList);
    }

    @Override
    public String queryById(String userId, String token, String bulletinId) {
        Bulletin bulletin = bulletinDao.queryById(bulletinId);
        if(bulletin==null){
            return JsonResponse.error(Message.GET_DATA_ERROR);
        }else{
            user = userDao.queryByUserId(bulletin.getUserId());
            return JsonResponse.bulletinInfo(bulletin,user.getUsername()+"");
        }
    }

    @Override
    public String create(String userId, String token, Bulletin bulletin) {
        String id = ValueUtil.uuid();
        bulletin.setBulletinId(id);

        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        bulletin.setUpdatedAt(dateFormat.format(date));

        bulletinDao.add(bulletin);

        user = userDao.queryByUserId(bulletin.getUserId());

        return JsonResponse.bulletinInfo(bulletin,user.getUsername()+"");
    }

    @Override
    public String update(String userId, String token, Bulletin bulletin) {
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        bulletin.setUpdatedAt(dateFormat.format(date));

        bulletinDao.update(bulletin);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }

    @Override
    public String delete(String userId, String token, String bulletinId) {
        bulletinDao.delete(bulletinId);
        return JsonResponse.successInfo(Message.OPERATED_SUCCESS);
    }
}
