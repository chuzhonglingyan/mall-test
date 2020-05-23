package mall.enums;

public enum LocalAuthStateEnum {
	LOGINFAIL(-1, "密码或帐号输入有误"), SUCCESS(0, "操作成功"), NULL_AUTH_INFO(-1006,
			"注册信息为空"), ONLY_ONE_ACCOUNT(-1007,"最多只能绑定一个本地帐号"),
	ACCOUNT_HAS_EXIT(-1008,"该账号已经存在"),PWD_HAS_ERR(-1009,"密码不能为空")
	,USERNAME_HAS_ERR(-1010,"用户名不能为空,最大32位")
	,GENDER_HAS_ERR(-1011,"性别只能是男或者女"),EMAIL_HAS_ERR(-1012,"邮箱不能为空");

	private int state;

	private String stateInfo;

	private LocalAuthStateEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}

	public int getState() {
		return state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static LocalAuthStateEnum stateOf(int index) {
		for (LocalAuthStateEnum state : values()) {
			if (state.getState() == index) {
				return state;
			}
		}
		return null;
	}

}
