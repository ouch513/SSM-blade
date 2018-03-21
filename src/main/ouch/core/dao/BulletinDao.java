package main.ouch.core.dao;

import main.ouch.core.domain.Bulletin;

import java.util.List;

public interface BulletinDao {

    /**
     * 查询所有公告
     */
    List<Bulletin> queryAll();

    /**
     * Id查询
     */
    Bulletin queryById(String bulletinId);

    /**
     * 添加公告
     */
    void add(Bulletin bulletin);

    /**
     * 修改公告
     */
    void update(Bulletin bulletin);

    /**
     * 删除公告
     */
    void delete(String userId);
}
