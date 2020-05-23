package mall.service;

import mall.entity.ShopCategory;

import java.util.List;

/**
 * @author zy
 * @create 2020-04-06-19:24
 */
public interface ShopCategoryService {
    public static final String SCLISTKEY = "shopcategorylist";
    /**
     * 根据查询条件获取ShopCategory列表
     *
     * @param shopCategoryCondition
     * @return
     */
    List<ShopCategory> getShopCategoryList(ShopCategory shopCategoryCondition);
}
