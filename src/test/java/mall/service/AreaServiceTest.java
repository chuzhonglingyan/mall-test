package mall.service;

import mall.BaseTest;
import mall.entity.Area;
import mall.service.impl.AreaServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * @author zy
 * @create 2020-03-29-21:42
 */
public class AreaServiceTest extends BaseTest {
    @Autowired
    private AreaService areaService;

    @Test
    public void testGetAreaList() {
        List<Area> areaList = areaService.getAreaList();
        assertEquals(4, areaList.size());

        assertEquals("西苑", areaList.get(0).getAreaName());
    }

}
