package com.hjhz.base.util;
/**
 * add by zhanhh on $20130809
 * 字符串处理类
 * */
public class StringUtils {

	/**
	 * 字符串转换为大写字母，如果字符串为空null,返回null
	 * */
	public static String toUpperCase(String str){
		if(str==null){
			return null;
		}else{
			return str.toUpperCase();
		}
	}
	
	/**
	 * 字符串转换为小写字母，如果字符串为空null,返回null
	 * */
	public static String toLowerCase(String str){
		if(str==null){
			return null;
		}else{
			return str.toLowerCase();
		}
	}
	
	/**
	 * 判断某字符串是否为空或长度为0或由空白符(whitespace)构成
	 * */
	public static boolean isBlank(String str){
		return StringUtils.isBlank(str);
	}
	
	/**
	 *  判断某字符串是否不为空且长度不为0且不由空白符(whitespace)构成,等于 !isBlank(String str)
	 * */
	public static boolean isNotBlank(String str){
		return StringUtils.isNotBlank(str);
	}
	
	/**
	 *  判断某字符串是否为空，为空的标准是 str==null 或 str.length()==0
	 * */
	public static boolean isEmpty(String str){
		return StringUtils.isEmpty(str);
	}
	
	/**
	 *  判断某字符串是否非空，等于 !isEmpty(String str) 
	 * */
	public static boolean isNotEmpty(String str){
		return StringUtils.isNotEmpty(str);
	}
	
	/**
	 * 去掉字符串两端的控制符(control characters, char <= 32),如果输入为 null 则返回null
	 * */
	public static String trim(String str){
		return StringUtils.trim(str);
	} 
	
	/**
	 * 去掉字符串两端的控制符(control characters, char <= 32),如果变为 null 或""，则返回 null 
	 * */
	public static String trimToNull(String str){
		return StringUtils.trimToNull(str);
	} 
	
	/**
	 * 去掉字符串两端的控制符(control characters, char <= 32),如果变为 null 或 "" ，则返回 "" 
	 * */
	public static String trimToEmpty(String str){
		return StringUtils.trimToEmpty(str);
	} 
	
	/**
	 *  返回字符串 searchStr 在字符串 str 中第一次出现的位置。
     *	如果 str 为 null 或 searchStr 为 null 则返回-1，
     *	如果 searchStr 为 "" ,且 str 为不为 null ，则返回0，
     *	如果 searchStr 不在 str 中，则返回-1
	 * */
	public static int indexOf(String str,String searchStr){
		return StringUtils.indexOf(str,searchStr);
	}
}
