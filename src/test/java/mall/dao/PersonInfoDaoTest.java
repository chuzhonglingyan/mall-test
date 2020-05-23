package mall.dao;

import static org.junit.Assert.assertEquals;

import java.util.Date;

import mall.util.SnowIdUtils;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import mall.BaseTest;
import mall.entity.PersonInfo;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PersonInfoDaoTest extends BaseTest {
	@Autowired
	private PersonInfoDao personInfoDao;

	@Test
	public void testAInsertPersonInfo() throws Exception {
		// 设置新增的用户信息
		PersonInfo personInfo = new PersonInfo();
		personInfo.setUserId(SnowIdUtils.uniqueLong());
		personInfo.setName("我爱你");
		personInfo.setGender("女");
		personInfo.setUserType(1);
		personInfo.setProfileImg("");
		personInfo.setCreateTime(new Date());
		personInfo.setLastEditTime(new Date());
		personInfo.setEnableStatus(1);
		int effectedNum = personInfoDao.insertPersonInfo(personInfo);
		assertEquals(1, effectedNum);
	}

	@Test
	public void testBQueryPersonInfoById() {
		long userId = 1;
		// 查询Id为1的用户信息
		PersonInfo person = personInfoDao.queryPersonInfoById(userId);
		System.out.println(person.getName());
	}

}
