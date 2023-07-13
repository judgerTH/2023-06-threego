package com.threego.app.common.util;

public class ThreegoUtils {

	public static String getPagebar(int cpage, int limit, int totalMember, String url) {
		StringBuilder pagebar = new StringBuilder();
		
		int totalPage = (int)Math.ceil((double) totalMember / limit);
		url += "?cpage=";
		
		int pagebarSize = 5;
		int pageStart = (cpage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		int pageNo = pageStart;
		
		// 1. 이전
		if (pageNo == 1) {
			// 이전 버튼 비활성화
		} 
		else {
			pagebar.append("<a href='%s%d'>이전</a>".formatted(url, pageNo - 1));
			pagebar.append("\n");
		}
				
		// 2. 숫자
		while (pageNo <= pageEnd && pageNo <= totalPage) {
			if (pageNo == cpage) {
				// 현재페이지인 경우
				pagebar.append("<span class='cPage'>%d</span>".formatted(pageNo));
				pagebar.append("\n");
			}
			else {
				pagebar.append("<a href='%s%d'>%d</a>".formatted(url, pageNo, pageNo));
				pagebar.append("\n");
			}
			pageNo++;
		}
				
		// 3. 다음
		if (pageNo > totalPage) {
			// 마지막페이지가 이미 노출된 경우
		}
		else {
			pagebar.append("<a href='%s%d'>다음</a>".formatted(url, pageNo));
		}
				
		return pagebar.toString();
	}

}
