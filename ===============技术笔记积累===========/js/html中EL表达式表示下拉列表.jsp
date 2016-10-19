 <!-- begin: create 詹欢欢 $ 2011-08-05   增加“投诉类型”字段，该字段取值为：投诉，咨询，建议，需求 -->
         <tr>
         	<td height="32" align="center" bgcolor="#EEF1F4">
        	 投诉类型：
      		</td>
			 <td colspan="3" bgcolor="#EEF1F4">	
			 <select name="compType" id="compType">
          	 <c:forEach items="${compType}" var="item"> 
			 <option value="${item.standCode}" <c:if test="${SuitInputFrom.compType==item.standCode}">selected</c:if>>${item.displayValue}</option>			
			 </c:forEach>
          </select>
			</td>
      </tr>


action 中
//获取操作类型
//		-- create by 詹欢欢 $2012-5-8 增加"操作类型"LIST
        List compType = knowledgeBaseLogManagementService.getCompType();
        request.setAttribute("operateType", compType);




	  	/*begin: add by 詹欢欢：和数据库的操作，从数据库中取得投诉类型数据(客户端增加投诉类型数据)
	 * @see com.cthq.compman.dao.ISuitInputDAO#getCompType(java.lang.String, java.lang.String)
	 */
	public List getCompType() {
		List list = new ArrayList();
		Map map = new HashMap();
		SqlParse sqlparse = QueryParse.getInstance();
		String sql = sqlparse.parseSQL("listCompType", map);
		////System.out.println(sql);
	    ICommonBean cb = (ICommonBean) select(sql);
	    if (cb != null){
	        if(cb.getRows()!=0){
	          for (int i = 0; i < cb.getRows(); i++) {
	          	PbValueVO vo = getPbValueInfo(cb,i);
	            list.add(vo);
	          }
	        }else{
	        	PbValueVO vo = new PbValueVO();
	        	list.add(vo);
	        }
	      }
		return list;
	}
	
	public PbValueVO getPbValueInfo(ICommonBean cb,int row){
		PbValueVO vo = new PbValueVO();
		vo.setStandCode(cb.getString(row,"STAND_CODE"));
		vo.setDisplayValue(cb.getString(row,"DISPLAY_VALUE"));
		return vo;
	}
	
	public ICommonBean queryBySql(String sql){
		return select(sql);
	}