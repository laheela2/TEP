	package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class TepUtils {
	public static final String SAVEURI = "save_current_page_uri";
	
	/**
	 * @param date
	 * @return 8월 30일 (화) 9시 00분
	 */
	public static String dateFormat(Date date){
		if(date == null){
			return null;
		}
		SimpleDateFormat f = new SimpleDateFormat("MM월 dd일 (EEE) HH시 mm분",Locale.KOREAN);
		return f.format(date);
	}
	
	/**
	 * @param start ; 모임시작일시
	 * @param end ; 모임종료일시
	 * @return 8월 30일 (화) 9시 00분 ~ 2017년 2월 22일 (수) 18시 30분
	 */
	public static String dateFormat(Date start, Date end){
		if(start == null || end == null){
			return null;
		}
		SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일 (EEE) HH시 mm분",Locale.KOREAN);
		SimpleDateFormat ef = new SimpleDateFormat("yyyy년 MM월 dd일 (EEE) HH시 mm분",Locale.KOREAN);
		return sf.format(start)+" ~ "+ef.format(end);
	}
	
	/**
	 * @param 다음의 형식을 같는 문자열  2016-09-05 00:30
	 * @return Date
	 * @throws ParseException 
	 */
	public static Date dateParse(String date) throws ParseException{
		if(date == null || date.length() <= 0){
			return null;
		}
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sf.parse(date);
	}
	
	/**
	 * @param date
	 * @return ex) 2016-09-05 00:30 
	 */
	public static String dateParseFormat(Date date){
		if(date == null){
			return null;
		}
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sf.format(date);
	}
	
	/**
	 * 받은 이름과 값으로 쿠키 생성하여 반환
	 * 기본 값 쿠키설정값 setPath : / , setMaxAge : 5분
	 * @param name : 생성할 쿠키이름
	 * @param value : 쿠키에 저장할 값
	 * @return 생성된 쿠키값 반환
	 */
	public static Cookie getCookie(String name, String value){
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge((1000*60)*5);
		return cookie;
	}
	
	/**
	 * request 객체와 저장한 쿠키이름으로 해당된 값을 구할수있다.
	 * @param request
	 * @param cookieName : 저장한 쿠키이름
	 * @return 해당 쿠키 값이 반환된다.
	 */
	public static String getCookies(HttpServletRequest request, String cookieName){
		if(request == null){
			return null;
		}
		
		for(Cookie c : request.getCookies()){
			if(c.getName().equals(cookieName)){
				return c.getValue();
			}
		}
		return null;
	}
	
	/**
	 * 기존 쿠기 삭제 : 삭제하고 싶은 쿠키 이름을 넣으면 age 0짜리 쿠키를 반환한다.
	 * @param name : 쿠키명
	 * @return age 0 짜리 Cookie 반환
	 */
	public static Cookie delCookie(String name){
		Cookie cookie = new Cookie(name, "");
		cookie.setMaxAge(0);
		return cookie;
	}
	
	/**
	 * 현재 로딩된 페이지의 URI를 가져와 session 에 저장한다.
	 * @param request
	 * @param session
	 */
	public static void savePageURI(HttpServletRequest request, Map session){
		if(request == null || session == null){
			return;
		}
		String currentURI = getUrl(request).substring("/TEP/".length());
		session.put(SAVEURI, currentURI);
	}
	
	/**
	 * 파라메터를포함한 전체 URI를 가져옴
	 * @param request
	 * @return
	 */
	private static String getUrl(HttpServletRequest request) {
		String ret_url = request.getRequestURI();

		int k = 0;

		for (Enumeration<?> e = request.getParameterNames(); e.hasMoreElements(); k++) {
			String name = (String) e.nextElement();
			String[] value = request.getParameterValues(name);

			if (k == 0)
				ret_url = ret_url + "?";
			else if (k > 0)
				ret_url = ret_url + "&";

			for (int q = 0; q < value.length; q++) {
				if (q > 0) {
					ret_url = ret_url + "&";
				}
				ret_url = ret_url + name + "=" + value[q];
			}
		}
		return ret_url;
	}
}
