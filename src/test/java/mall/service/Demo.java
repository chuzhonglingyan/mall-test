package mall.service;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.junit.Test;

import javax.crypto.spec.PSource;
import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;

/**
 * @author zy
 * @create 2020-04-02-11:59
 */
public class Demo {
    private static String basePath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
    @Test
    public void test() throws IOException {
        System.out.println(basePath);
        Thumbnails.of(new File("D:\\workspace_idea\\image\\yellowdark.png"))
                .size(181, 248)
                .outputQuality(0.8f)//压缩比
                .watermark(Positions.BOTTOM_RIGHT,
                        ImageIO.read(new File(basePath + "watermark.png")),
                        0.25f)//透明度
                .toFile("D:\\workspace_idea\\image\\yellowdark_new.png");
    }
}
