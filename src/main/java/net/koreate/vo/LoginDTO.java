package net.koreate.vo;

import lombok.Data;

@Data
public class LoginDTO {

	private String umail;
	private String upw;
	private boolean userCookie;
}