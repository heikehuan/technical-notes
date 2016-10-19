package com.hjhz.base.util;
/**
 * add by zhanhh on $20130809
 * �ַ���������
 * */
public class StringUtils {

	/**
	 * �ַ���ת��Ϊ��д��ĸ������ַ���Ϊ��null,����null
	 * */
	public static String toUpperCase(String str){
		if(str==null){
			return null;
		}else{
			return str.toUpperCase();
		}
	}
	
	/**
	 * �ַ���ת��ΪСд��ĸ������ַ���Ϊ��null,����null
	 * */
	public static String toLowerCase(String str){
		if(str==null){
			return null;
		}else{
			return str.toLowerCase();
		}
	}
	
	/**
	 * �ж�ĳ�ַ����Ƿ�Ϊ�ջ򳤶�Ϊ0���ɿհ׷�(whitespace)����
	 * */
	public static boolean isBlank(String str){
		return StringUtils.isBlank(str);
	}
	
	/**
	 *  �ж�ĳ�ַ����Ƿ�Ϊ���ҳ��Ȳ�Ϊ0�Ҳ��ɿհ׷�(whitespace)����,���� !isBlank(String str)
	 * */
	public static boolean isNotBlank(String str){
		return StringUtils.isNotBlank(str);
	}
	
	/**
	 *  �ж�ĳ�ַ����Ƿ�Ϊ�գ�Ϊ�յı�׼�� str==null �� str.length()==0
	 * */
	public static boolean isEmpty(String str){
		return StringUtils.isEmpty(str);
	}
	
	/**
	 *  �ж�ĳ�ַ����Ƿ�ǿգ����� !isEmpty(String str) 
	 * */
	public static boolean isNotEmpty(String str){
		return StringUtils.isNotEmpty(str);
	}
	
	/**
	 * ȥ���ַ������˵Ŀ��Ʒ�(control characters, char <= 32),�������Ϊ null �򷵻�null
	 * */
	public static String trim(String str){
		return StringUtils.trim(str);
	} 
	
	/**
	 * ȥ���ַ������˵Ŀ��Ʒ�(control characters, char <= 32),�����Ϊ null ��""���򷵻� null 
	 * */
	public static String trimToNull(String str){
		return StringUtils.trimToNull(str);
	} 
	
	/**
	 * ȥ���ַ������˵Ŀ��Ʒ�(control characters, char <= 32),�����Ϊ null �� "" ���򷵻� "" 
	 * */
	public static String trimToEmpty(String str){
		return StringUtils.trimToEmpty(str);
	} 
	
	/**
	 *  �����ַ��� searchStr ���ַ��� str �е�һ�γ��ֵ�λ�á�
     *	��� str Ϊ null �� searchStr Ϊ null �򷵻�-1��
     *	��� searchStr Ϊ "" ,�� str Ϊ��Ϊ null ���򷵻�0��
     *	��� searchStr ���� str �У��򷵻�-1
	 * */
	public static int indexOf(String str,String searchStr){
		return StringUtils.indexOf(str,searchStr);
	}
}
