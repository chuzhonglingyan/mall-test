package mall.service;

import mall.BaseTest;
import mall.dto.ImageHolder;
import mall.dto.ShopExecution;
import mall.entity.Area;
import mall.entity.PersonInfo;
import mall.entity.Shop;
import mall.entity.ShopCategory;
import mall.enums.ShopStateEnum;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.util.Date;
import java.util.List;

/**
 * @author zy
 * @create 2020-04-01-23:26
 */

public class ShopServiceTest extends BaseTest {
    @Autowired
    private ShopService shopService;

    @Test
    @Ignore
    public void testGetShopList() {
        Shop shopCondition = new Shop();
        ShopCategory sc = new ShopCategory();
        sc.setShopCategoryId(3L);
        shopCondition.setShopCategory(sc);
        ShopExecution se = shopService.getShopList(shopCondition, 3, 2);
        List<Shop> shopList = se.getShopList();
        int count = se.getCount();
        System.out.println("店铺列表大小：" + shopList.size());
        System.out.println("店铺数量：" + count);
    }

    @Test
    @Ignore
    public void testModifyShop() throws FileNotFoundException {
        Shop shop = new Shop();
        shop.setShopId(42L);
        shop.setShopName("修改后的店铺名字");
        shop.setLastEditTime(new Date());
        File file = new File("D:\\workspace_idea\\image\\dabaidaya.jpg");
        FileInputStream ins = new FileInputStream(file);
        ImageHolder imageHolder = new ImageHolder("dabaidaya.png", ins);
        ShopExecution shopExecution = shopService.modifyShop(shop, imageHolder);
        System.out.println("new shopImage location:" + shopExecution.getShop().getShopImg());
    }

    @Test
    @Ignore
    public void testAddShop() throws IOException {
        Shop shop = new Shop();
        PersonInfo owner = new PersonInfo();
        Area area = new Area();
        ShopCategory shopCategory = new ShopCategory();
        owner.setUserId(1L);
        area.setAreaId(2);
        shopCategory.setShopCategoryId(1L);
        shop.setOwner(owner);
        shop.setArea(area);
        shop.setShopCategory(shopCategory);
        shop.setShopName("测试店铺1");
        shop.setShopDesc("test1");
        shop.setShopAddr("test1");
        shop.setPhone("test1");
        shop.setCreateTime(new Date());
        shop.setEnableStatus(ShopStateEnum.CHECK.getState());
        shop.setAdvice("Check");
        File shopImg = new File("D:\\workspace_idea\\image\\yellowdark.png");
        InputStream ins = new FileInputStream(shopImg);
        ImageHolder imageHolder = new ImageHolder("yellowdark.png", ins);
        ShopExecution se = shopService.addShop(shop, imageHolder);
        Assert.assertEquals(ShopStateEnum.CHECK.getState(), se.getState());
    }
}
