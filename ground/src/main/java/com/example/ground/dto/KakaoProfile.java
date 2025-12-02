package com.example.ground.dto;

import lombok.Data;

@Data
public class KakaoProfile {
	private Long id;
	private String connected_at;
	private Properties properties;
	private KakaoAccount kakao_account;

	@Data
	public static class KakaoAccount {
		private Boolean profile_nickname_needs_agreement;
		private Profile profile;
	}

	@Data
	public static class Profile {
		private String nickname;
		private Boolean is_default_nickname;
	}

	@Data
	public static class Properties {
		private String nickname;
	}
}
