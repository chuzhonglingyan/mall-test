package mall.dao;

import mall.entity.Area;

import java.util.List;

/**
 * @author zy
 * @create 2020-03-29-17:25
 */
public interface AreaDao {

    /*
    * list area list
    * @return areaList
    */
    List<Area> queryArea();

}
