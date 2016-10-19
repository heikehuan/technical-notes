--建立和删除表;  
drop table student;  
create table student(id number(30),name varchar2(50),sex varchar2(100))  
  
--建立约束; 为了能插入重复记录,此表没有建立月主键约束 或 唯一键约束;  
--alter table student add constraints pk_student primary key(id);  
  
--插入数据;  
insert into student values(1,'A','BOY');  
insert into student values(1,'A','BOY');  
insert into student values(2,'B','Girl');  
insert into student values(3,'C','Girl');  
insert into student values(4,'D','Girl');  
commit;  
  
--查询所有student表数据;  
select rowid,id,name,sex from student;  
  
--查询重复记录;(方法一)  
select id,name,sex from student where id in (select id from student group by id having count(*) > 1);  
  
--row_number()分析函数;(方法二)  
select * from student where id in (select id from (select id ,row_number() over(partition by id order by rowid) m from student) where m <> 1);  
  
--使用rowid (方法三);  
select * from student a where a.rowid > (select min(b.rowid) from student b where b.id = a.id);  
Sql代码  
--分页查询;(方法一)  
Sql代码  
select * from(select a.*,row_number() over(order by id desc) rk from student a ) where rk<=3 and rk>=1;  
Sql代码  
--分页查询;(方法二)  
Sql代码  
select * from (select student.*,rownum rn from student where rownum <=3 order by id)  where rn>=1;  
 
Sql代码  
--case  when  then ,查询报表;  
select emp.empno,emp.ename,emp.job,emp.deptno,emp.sal,  
       case deptno when 10  then'部门-10'   
                   when 20 then '部门-20'  
                   when 30 then '部门-30'  
       else   
       '其他部门' end 
 from emp;  
   
 --交叉报表查询;  
 select ename,sal,  
 case deptno when 10 then '会计部'   
             when 20 then '研究部'   
             when 30 then '销售部'   
             else '其他部门' end  
             部门   
 from emp ;  
   
 --交叉报表查询;  
select empno,ename,sal,job,case when sal>=0 and sal<=1000 then '一级工资'  
            when sal>=1001 and sal <= 2000 then  '二级工资'  
            when sal>=2001 and sal <=3000 then   '三级工资'  
            when sal>=3001 and sal <= 4000 then  '四级工资'  
            when sal>= 4001 and sal <= 5000 then '五级工资'  
            else   
            '其他工资'  
            end  
            工资等级  
from emp;  
Sql代码  
--利用sum 和 case..when. then .end.行转列的使用。  
select ename as 员工姓名,sum(case JOB when 'CLERK' then sal end )接待员,  
              sum(case JOB when 'SALESMAN' then sal end) 推销员,  
              sum(case JOB when 'MANAGER' then sal end)管理员,  
              sum(case JOB when 'ANALYST' then sal end)分析家,  
              sum(case JOB when 'PRESIDENT' then sal end)董事长  
         from emp group by ename order by ename;  
 
Sql代码  
--利用sum 聚合函数与 decode 函数做一个简单查询， decode(输入值,'要判断的值'，匹配后的结果，如果没匹配成功，则输出默认值) ；  
select ename 员工姓名,sum(decode(JOB,'CLERK',SAL,0)) 接待员,  
             sum(decode(JOB,'SALESMAN',SAL,0)) 推销员,  
             sum(decode(JOB,'MANAGER',SAL,0)) 管理员,  
             sum(decode(JOB,'ANALYST',SAL,0))分析家,  
             sum(decode(JOB,'PRESIDENT',SAL,0))董事长  
         from emp group by ename order by ename;  
 
 
 
Sql代码  
--自连接查询;  
             select a.empno,a.mgr,a.ename,a.sal,b.empno,b.ename,b.sal from scott.emp a,scott.emp b where a.mgr=b.empno ;  
  
             --做外连接；  
             select a.ename,a.sal,b.ename from scott.emp a,scott.emp b where a.mgr=b.empno(+);  
               
             --自连接查询；  
             select a.empno,a.ename,a.sal,b.empno,b.ename,b.sal from emp a left join emp b on(a.mgr = b.empno) order by a.empno;  
                   select * from emp order by empno;  
               
               
             select emp.*,(select deptno from dept where LOC = 'NEW YORK')新增的列 from emp;  
               
            --select sal from emp where emp.deptno = 30 这条语句查询出的结果，1600,1250,1250,2850,1500,950。  
            --然后，员工的工资 必须大于 子查询查询出来的数据。   
            select emp.* from emp where emp.sal > all(select sal from emp where emp.deptno = 30);  
               
            --结果如下:  
            1   7566    JONES   MANAGER 7839    1981-4-2    2975.00     20  
            2   7788    SCOTT   ANALYST 7566    1987-3-19   3000.00     20  
            3   7839    KING    PRESIDENT       1981-11-17  5000.00     10  
            4   7902    FORD    ANALYST 7566    1981-12-3   3000.00     20  
 
Sql代码  
--员工工资，必须大于子查询里面，任何一个值，就可以。这就是any的用法；  
           select emp.* from emp where emp.sal > any(select sal from emp e where e.deptno = 30);  
 
 
Sql代码  
--使用union，去除重复行，且排序。  
select emp.empno,emp.ename,emp.sal from emp where emp.sal >= 1500 union   
select emp.empno,emp.ename,emp.sal from emp where emp.sal <=3000;  
  
--使用union all直接两个结果集合并,不排序.  
select ename,sal,deptno from scott.emp where deptno>10 union all select ename,sal,deptno from scott.emp where deptno<30 ;  
