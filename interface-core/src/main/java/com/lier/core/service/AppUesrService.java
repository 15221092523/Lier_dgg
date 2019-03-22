package com.lier.core.service;


/**
 * ClassName: HouseUserService
 * Description:
 * Date: 2019-3-22
 *
 * @author mao
 * @version 1.0
 */
public class AppUesrService extends BaseService<AppUser>{


    int deleteById(Integer id);

    AppUser selectById(Integer id);

    int updateById(AppUser record);

    List<AppUser> findByUid(Integer uid);

    void deleteByUid(Integer uid);

    ListResponse<AppUser> findByUid(Integer uid, Integer page, Integer pageSize);


}
