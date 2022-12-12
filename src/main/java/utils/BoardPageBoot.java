package utils;

import java.util.Map;

public class BoardPageBoot {

	public static String pagingStr(Map<String,Object> map) {
		int totalCount = Integer.parseInt(map.get("totalCount").toString());
		int pageSize = Integer.parseInt(map.get("pageSize").toString());
		int blockPage = Integer.parseInt(map.get("blockPage").toString());
		int pageNum = Integer.parseInt(map.get("pageNum").toString());
		String reqUrl = map.get("reqUrl").toString();
		String pagingStr ="";
		
		int totalPages = (int)(Math.ceil(((double) totalCount / pageSize)));
		
		int pageTemp = (((pageNum -1) /  blockPage) * blockPage) + 1;
		  pagingStr += "<ul class='pagination justify-content-center'>";
		  
		if(pageTemp != 1) {
			pagingStr += "<li class='page-item'><a href='" + reqUrl + "?pageNum=1' class='page-link'><i class='bi bi-skip-backward-fill'></i></a></li>";
			pagingStr += "<li class='page-item'><a href='" + reqUrl + "?pageNum=" + (pageTemp -1) + "class='page-link'><i class='bi bi-skip-backward-fill'></i></a></li>";
		}
		
		int blockCount = 1;
		
		while ( blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				pagingStr += "<li class='page-item'>";
				pagingStr += "<a href='" + reqUrl + "?pageNum="+pageNum+ "' class='page-link active'>"+pageNum+"</a>";
				pagingStr += "</li>";
				
			}else {
				pagingStr += "<li class='page-item'>";
				pagingStr +=  "<a href='" + reqUrl + "?pageNum="+pageTemp+ "' class='page-link'>"+pageTemp+"</a>";
				pagingStr +=  "</li>";
			}
			pageTemp++;
			blockCount++;
			
		}
		
		if(pageTemp <= totalPages) {
			pagingStr += "<li class='page-item'>";
			pagingStr +=  "<a href='" + reqUrl + "?pageNum="+ pageTemp +"'&nbsp; class='page-link'><i class='bi bi-skip-end-fill'></i></a>";
			pagingStr +=  "</li>";
			pagingStr += "<li class='page-item'>";
			pagingStr +=  "<a href='" + reqUrl + "?pageNum="+ totalPages + "'&nbsp; class='page-link'><i class='bi bi-skip-forward-fill'></i></a>";
			pagingStr +=  "</li>";
		}
		pagingStr += "</ul>";
		return pagingStr;
		
		
		
	}
	
	
	
}
