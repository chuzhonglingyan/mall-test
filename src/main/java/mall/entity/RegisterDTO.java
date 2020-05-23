package mall.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Administrator
 * @date 2020-05-23 18:45
 * @description
 */
public class RegisterDTO implements Serializable {




    private String userName;

    private String password;

    private String profileImg;

    private String email;

    private String gender;

    private Integer enableStatus;

    /**
     * 1 indicates customer
     * 2 indicates dianzhu
     * 3 indicates admin
     * */
    //1 customer 2 owner 3 admin
    private Integer userType;

    private Date createTime;

    private Date lastEditTime;



    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getEnableStatus() {
        return enableStatus;
    }

    public void setEnableStatus(Integer enableStatus) {
        this.enableStatus = enableStatus;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastEditTime() {
        return lastEditTime;
    }

    public void setLastEditTime(Date lastEditTime) {
        this.lastEditTime = lastEditTime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
