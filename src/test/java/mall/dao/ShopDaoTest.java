package mall.dao;

import mall.BaseTest;
import mall.entity.Area;
import mall.entity.PersonInfo;
import mall.entity.Shop;
import mall.entity.ShopCategory;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import sun.security.provider.SHA;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * @author zy
 * @create 2020-04-01-10:49
 */
public class ShopDaoTest extends BaseTest {
    @Autowired
    private ShopDao shopDao;

    @Test
    @Ignore
    public void testQueryShopListAndCount() {
//        Shop shopCondition = new Shop();
//        PersonInfo owner = new PersonInfo();
//        owner.setUserId(1L);
//        shopCondition.setOwner(owner);
//        List<Shop> shoplist = shopDao.queryShopList(shopCondition,1,5);
//        int count = shopDao.queryShopCount(shopCondition);
//        System.out.println("店铺列表大小：" + shoplist.size());
//        System.out.println("店铺数量：" + count);
//        ShopCategory sc = new ShopCategory();
//        sc.setShopCategoryId(3L);
//        shopCondition.setShopCategory(sc);
//        shoplist = shopDao.queryShopList(shopCondition,0,3);
//        count = shopDao.queryShopCount(shopCondition);
//        System.out.println("店铺列表大小：" + shoplist.size());
//        System.out.println("店铺数量：" + count);
        Shop shopCondition = new Shop();
        ShopCategory childCategory = new ShopCategory();
        ShopCategory parentCategory = new ShopCategory();
        parentCategory.setShopCategoryId(12L);
        childCategory.setParent(parentCategory);
        shopCondition.setShopCategory(childCategory);
        List<Shop> shopList = shopDao.queryShopList(shopCondition, 0, 6);
        int count = shopDao.queryShopCount(shopCondition);
        System.out.println("店铺列表的大小：" + shopList.size());
        System.out.println("店铺总数：" + count);

    }

    @Test
    public void testQueryByShopId() {
        long shopId = 38L;
        Shop shop = shopDao.queryByShopId(shopId);
        System.out.println("areaId:" + shop.getArea().getAreaId());
        System.out.println("areaName:" + shop.getArea().getAreaName());
    }
    @Test
//    @Ignore
    public void TestInsertShop() {
        Shop shop = new Shop();
        PersonInfo owner = new PersonInfo();
        Area area = new Area();
        ShopCategory shopCategory = new ShopCategory();
        owner.setUserId(1L);
        area.setAreaId(1);
        shopCategory.setShopCategoryId(1L);

        shop.setOwner(owner);
        shop.setArea(area);
        shop.setShopCategory(shopCategory);
        shop.setShopName("测试中的店铺");
        shop.setShopDesc("test");
        shop.setShopAddr("test");
        shop.setPhone("110");
        shop.setShopImg("pic");
        shop.setPriority(1);
        shop.setCreateTime(new Date());
        shop.setEnableStatus(1);
        shop.setAdvice("审核中");
        int effectNum = shopDao.insertShop(shop);
        assertEquals(1,effectNum);
    }

    @Test
    @Ignore
    public void TestUpdateShop() {
        Shop shop = new Shop();
        shop.setShopId(32L);
        shop.setShopName("中餐館");
        shop.setShopDesc("点菜一起吃");
        shop.setShopAddr("武汉市洪山区");
        shop.setPriority(8);
        shop.setLastEditTime(new Date());
        int effectNum = shopDao.updateShop(shop);
        assertEquals(1,effectNum);
    }
}
