package mall.util;

import javafx.scene.control.Separator;
import jdk.nashorn.internal.runtime.SharedPropertyMap;
import mall.entity.Shop;

/**
 * @author zy
 * @create 2020-04-01-20:12
 */
public class PathUtil {
    private static String seperator = System.getProperty("file.separator");

    /*
     * return image rootpath
     */
    public static String getImgBasePath() {
        String os = System.getProperty("os.name");
        String basePath = "";
        if (os.toLowerCase().startsWith("win")) {
            basePath = "D:/workspace_idea/image";
        } else {
            basePath = "/root/images";
        }
        basePath = basePath.replace("/", seperator);
        return basePath;
    }

    /*
     * @return image subpath
     */
    public static String getShopImagePath(long shopId) {
        String imagePath = "/upload/images/item/shop/" + shopId + "/";
        return imagePath.replace("/", seperator);
    }
}









