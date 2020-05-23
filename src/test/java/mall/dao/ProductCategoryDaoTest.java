package mall.dao;

import mall.BaseTest;
import mall.entity.ProductCategory;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;


/**
 * @author zy
 * @create 2020-04-12-13:43
 */

@FixMethodOrder(MethodSorters.NAME_ASCENDING) //便于回环测试，按照名字执行
public class ProductCategoryDaoTest extends BaseTest {
    @Autowired
    private ProductCategoryDao productCategoryDao;

    @Test
    @Ignore
    public void testBQueryByShopId() {
        List<ProductCategory> productCategoryList = productCategoryDao.queryProductCategoryList(46L);
        System.out.println("商品类别个数:" + productCategoryList.size());
        for (ProductCategory e : productCategoryList) {
            System.out.println("商品名：" + e.getProductCategoryName());
        }
    }

    @Test
    @Ignore
    public void testABatchInsertProductCategory(){
        ProductCategory productCategory = new ProductCategory();
        productCategory.setProductCategoryName("商品类别3");
        productCategory.setPriority(3);
        productCategory.setCreateTime(new Date());
        productCategory.setShopId(46L);
        ProductCategory productCategory2 = new ProductCategory();
        productCategory2.setProductCategoryName("商品类别4");
        productCategory2.setPriority(4);
        productCategory2.setCreateTime(new Date());
        productCategory2.setShopId(46L);
        List<ProductCategory> productCategoryList = new ArrayList<ProductCategory>();
        productCategoryList.add(productCategory);
        productCategoryList.add(productCategory2);
        int effectedNum = productCategoryDao.batchInsertProductCategory(productCategoryList);
        assertEquals(2, effectedNum);
    }

    @Test
    @Ignore
    public void testCDeleteProductCategory() throws Exception {
        long shopId = 46L;
        List<ProductCategory> productCategoryList = productCategoryDao.queryProductCategoryList(shopId);
        for (ProductCategory pc : productCategoryList) {
            if ("商品类别3".equals(pc.getProductCategoryName()) || "商品类别4".equals(pc.getProductCategoryName())) {
                int effectedNum = productCategoryDao.deleteProductCategory(pc.getProductCategoryId(),
                        shopId);
                assertEquals(1, effectedNum);
            }
        }
    }
}
