package mall.dao;

import mall.BaseTest;
import mall.entity.ShopCategory;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * @author zy
 * @create 2020-04-06-18:56
 */
public class ShopCategoryDaoTest extends BaseTest {
    @Autowired
    private ShopCategoryDao shopCategoryDao;

    @Test
//    @Ignore
    public void TestQueryShopCategory() {
        List<ShopCategory> shopCategorylist = shopCategoryDao.queryShopCategory(null);
        System.out.println(shopCategorylist.size());

    }
}
