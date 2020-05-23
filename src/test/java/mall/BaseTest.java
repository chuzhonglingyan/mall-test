package mall;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author zy
 * @create 2020-03-29-19:47
 */


/*
 *@RunWith就是一个运行器,配置spring和junit整合，JUnit启动时加载springIOC容器
 */
@RunWith(SpringJUnit4ClassRunner.class) //告诉spring用SpringJUnit4ClassRunner 来跑单元测试

//在这个测试环境下加载这个类的时候要加载这些文件
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"})
public class BaseTest {

}
