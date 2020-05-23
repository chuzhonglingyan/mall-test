package mall.service.impl;

import mall.dao.LocalAuthDao;
import mall.dao.PersonInfoDao;
import mall.dto.LocalAuthExecution;
import mall.entity.LocalAuth;
import mall.entity.PersonInfo;
import mall.enums.LocalAuthStateEnum;
import mall.exceptions.LocalAuthOperationException;
import mall.service.LocalAuthService;
import mall.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;

@Service
public class LocalAuthServiceImpl implements LocalAuthService {

    @Autowired
    private LocalAuthDao localAuthDao;

    @Autowired
    private PersonInfoDao personInfoDao;

    @Override
    public LocalAuth getLocalAuthByUsernameAndPwd(String username, String password) {
        return localAuthDao.queryLocalByUserNameAndPwd(username, MD5.getMd5(password));
    }

    @Override
    public LocalAuth getLocalAuthByUsername(String username) {
        return localAuthDao.queryLocalByUserName(username);
    }


    @Override
    public LocalAuth getLocalAuthByUserId(long userId) {
        return localAuthDao.queryLocalByUserId(userId);
    }

    @Override
    @Transactional
    public LocalAuthExecution register(LocalAuth localAuth) throws LocalAuthOperationException {
        // 空值判断，传入的localAuth 帐号密码，用户信息特别是userId不能为空，否则直接返回错误
        if (localAuth == null ||localAuth.getPersonInfo() == null) {
            return new LocalAuthExecution(LocalAuthStateEnum.NULL_AUTH_INFO);
        }
        if (StringUtils.isEmpty(localAuth.getUsername())||localAuth.getUsername().length()>30) {
            return new LocalAuthExecution(LocalAuthStateEnum.USERNAME_HAS_ERR);
        }
        if (StringUtils.isEmpty(localAuth.getPassword())) {
            return new LocalAuthExecution(LocalAuthStateEnum.PWD_HAS_ERR);
        }
        if (localAuth.getPassword().length()<6||localAuth.getPassword().length()>12) {
            return new LocalAuthExecution(LocalAuthStateEnum.PWD_HAS_ERR);
        }
        // 设置新增的用户信息
        PersonInfo personInfo = localAuth.getPersonInfo();
        String gender=personInfo.getGender();
        if (StringUtils.isEmpty(personInfo.getEmail())) {
            return new LocalAuthExecution(LocalAuthStateEnum.EMAIL_HAS_ERR);
        }
        if (!("男".equals(gender)||"女".equals(gender))) {
            return new LocalAuthExecution(LocalAuthStateEnum.GENDER_HAS_ERR);
        }
        // 查询此用户是否已绑定过平台帐号
        LocalAuth tempAuth = getLocalAuthByUsername(localAuth.getUsername());
        if (tempAuth != null) {
            // 如果绑定过则直接退出，以保证平台帐号的唯一性
            return new LocalAuthExecution(LocalAuthStateEnum.ACCOUNT_HAS_EXIT);
        }
        try {
            // 如果之前没有绑定过平台帐号，则创建一个平台帐号与该用户绑定
            localAuth.setCreateTime(new Date());
            localAuth.setLastEditTime(new Date());
            // 对密码进行MD5加密
            localAuth.setPassword(MD5.getMd5(localAuth.getPassword()));

            int effectedNum = localAuthDao.insertLocalAuth(localAuth);
            // 判断创建是否成功
            if (effectedNum <= 0) {
                throw new LocalAuthOperationException("帐号创建失败");
            } else {
                personInfoDao.insertPersonInfo(personInfo);
                return new LocalAuthExecution(LocalAuthStateEnum.SUCCESS, localAuth);
            }
        } catch (Exception e) {
            throw new LocalAuthOperationException("insertLocalAuth error: " + e.getMessage());
        }
    }

    @Override
    @Transactional
    public LocalAuthExecution bindLocalAuth(LocalAuth localAuth) throws LocalAuthOperationException {
        // 空值判断，传入的localAuth 帐号密码，用户信息特别是userId不能为空，否则直接返回错误
        if (localAuth == null || localAuth.getPassword() == null || localAuth.getUsername() == null
                || localAuth.getPersonInfo() == null || localAuth.getPersonInfo().getUserId() == null) {
            return new LocalAuthExecution(LocalAuthStateEnum.NULL_AUTH_INFO);
        }
        // 查询此用户是否已绑定过平台帐号
        LocalAuth tempAuth = localAuthDao.queryLocalByUserId(localAuth.getPersonInfo().getUserId());
        if (tempAuth != null) {
            // 如果绑定过则直接退出，以保证平台帐号的唯一性
            return new LocalAuthExecution(LocalAuthStateEnum.ONLY_ONE_ACCOUNT);
        }
        try {
            // 如果之前没有绑定过平台帐号，则创建一个平台帐号与该用户绑定
            localAuth.setCreateTime(new Date());
            localAuth.setLastEditTime(new Date());
            // 对密码进行MD5加密
            localAuth.setPassword(MD5.getMd5(localAuth.getPassword()));
            int effectedNum = localAuthDao.insertLocalAuth(localAuth);
            // 判断创建是否成功
            if (effectedNum <= 0) {
                throw new LocalAuthOperationException("帐号绑定失败");
            } else {
                return new LocalAuthExecution(LocalAuthStateEnum.SUCCESS, localAuth);
            }
        } catch (Exception e) {
            throw new LocalAuthOperationException("insertLocalAuth error: " + e.getMessage());
        }
    }

    @Override
    @Transactional
    public LocalAuthExecution modifyLocalAuth(Long userId, String userName, String password, String newPassword)
            throws LocalAuthOperationException {
        // 非空判断，判断传入的用户Id,帐号,新旧密码是否为空，新旧密码是否相同，若不满足条件则返回错误信息
        if (userId != null && userName != null && password != null && newPassword != null
                && !password.equals(newPassword)) {
            try {
                // 更新密码，并对新密码进行MD5加密
                int effectedNum = localAuthDao.updateLocalAuth(userId, userName, MD5.getMd5(password),
                        MD5.getMd5(newPassword), new Date());
                // 判断更新是否成功
                if (effectedNum <= 0) {
                    throw new LocalAuthOperationException("更新密码失败");
                }
                return new LocalAuthExecution(LocalAuthStateEnum.SUCCESS);
            } catch (Exception e) {
                throw new LocalAuthOperationException("更新密码失败:" + e.toString());
            }
        } else {
            return new LocalAuthExecution(LocalAuthStateEnum.NULL_AUTH_INFO);
        }
    }

}
