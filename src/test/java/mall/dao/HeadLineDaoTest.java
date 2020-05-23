package mall.dao;

import mall.BaseTest;
import mall.entity.HeadLine;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * @author zy
 * @create 2020-04-16-15:57
 */
public class HeadLineDaoTest extends BaseTest {
    @Autowired HeadLineDao headLineDao;

    @Test
    public void testQueryArea() {
        List<HeadLine> headLineList = headLineDao.queryHeadLine(new HeadLine());
        assertEquals(4, headLineList.size());
    }

}
