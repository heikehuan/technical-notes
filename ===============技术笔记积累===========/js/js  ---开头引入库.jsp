<%@ page contentType="text/html; charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.hjhz.sms.data.dto.UserDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.hjhz.sms.data.dto.ResourceDto" %>
<%@ page import="java.util.*" %>
<%@page import="java.util.*, org.jbpm.api.*,org.jbpm.api.task.*" %>
<%@ page import="com.hjhz.sms.util.RequestParam" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String styleKey = RequestParam.CheckParam((String)session.getAttribute("platstylekey"),"");
%>
<script language='javascript' src='<%=request.getContextPath()%>/script/prototype.js'></script>