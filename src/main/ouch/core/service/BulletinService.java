package main.ouch.core.service;

import main.ouch.core.domain.Bulletin;

public interface BulletinService {

    /**
     * 查询所有公告
     */
    String getList(String userId,String token);

    /**
     * ID查询
     */
    String queryById(String userId, String token, String bulletinId);

    /**
     * 添加公告
     */
    String create(String userId,String token,Bulletin bulletin);

    /**
     * 修改公告
     */
    String update(String userId,String token,Bulletin bulletin);

    /**
     * 删除公告
     */
    String delete(String userId,String token,String bulletinId);
}
