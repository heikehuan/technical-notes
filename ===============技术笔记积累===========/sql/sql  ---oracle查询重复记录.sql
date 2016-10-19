--������ɾ����;  
drop table student;  
create table student(id number(30),name varchar2(50),sex varchar2(100))  
  
--����Լ��; Ϊ���ܲ����ظ���¼,�˱�û�н���������Լ�� �� Ψһ��Լ��;  
--alter table student add constraints pk_student primary key(id);  
  
--��������;  
insert into student values(1,'A','BOY');  
insert into student values(1,'A','BOY');  
insert into student values(2,'B','Girl');  
insert into student values(3,'C','Girl');  
insert into student values(4,'D','Girl');  
commit;  
  
--��ѯ����student������;  
select rowid,id,name,sex from student;  
  
--��ѯ�ظ���¼;(����һ)  
select id,name,sex from student where id in (select id from student group by id having count(*) > 1);  
  
--row_number()��������;(������)  
select * from student where id in (select id from (select id ,row_number() over(partition by id order by rowid) m from student) where m <> 1);  
  
--ʹ��rowid (������);  
select * from student a where a.rowid > (select min(b.rowid) from student b where b.id = a.id);  
Sql����  
--��ҳ��ѯ;(����һ)  
Sql����  
select * from(select a.*,row_number() over(order by id desc) rk from student a ) where rk<=3 and rk>=1;  
Sql����  
--��ҳ��ѯ;(������)  
Sql����  
select * from (select student.*,rownum rn from student where rownum <=3 order by id)  where rn>=1;  
 
Sql����  
--case  when  then ,��ѯ����;  
select emp.empno,emp.ename,emp.job,emp.deptno,emp.sal,  
       case deptno when 10  then'����-10'   
                   when 20 then '����-20'  
                   when 30 then '����-30'  
       else   
       '��������' end 
 from emp;  
   
 --���汨���ѯ;  
 select ename,sal,  
 case deptno when 10 then '��Ʋ�'   
             when 20 then '�о���'   
             when 30 then '���۲�'   
             else '��������' end  
             ����   
 from emp ;  
   
 --���汨���ѯ;  
select empno,ename,sal,job,case when sal>=0 and sal<=1000 then 'һ������'  
            when sal>=1001 and sal <= 2000 then  '��������'  
            when sal>=2001 and sal <=3000 then   '��������'  
            when sal>=3001 and sal <= 4000 then  '�ļ�����'  
            when sal>= 4001 and sal <= 5000 then '�弶����'  
            else   
            '��������'  
            end  
            ���ʵȼ�  
from emp;  
Sql����  
--����sum �� case..when. then .end.��ת�е�ʹ�á�  
select ename as Ա������,sum(case JOB when 'CLERK' then sal end )�Ӵ�Ա,  
              sum(case JOB when 'SALESMAN' then sal end) ����Ա,  
              sum(case JOB when 'MANAGER' then sal end)����Ա,  
              sum(case JOB when 'ANALYST' then sal end)������,  
              sum(case JOB when 'PRESIDENT' then sal end)���³�  
         from emp group by ename order by ename;  
 
Sql����  
--����sum �ۺϺ����� decode ������һ���򵥲�ѯ�� decode(����ֵ,'Ҫ�жϵ�ֵ'��ƥ���Ľ�������ûƥ��ɹ��������Ĭ��ֵ) ��  
select ename Ա������,sum(decode(JOB,'CLERK',SAL,0)) �Ӵ�Ա,  
             sum(decode(JOB,'SALESMAN',SAL,0)) ����Ա,  
             sum(decode(JOB,'MANAGER',SAL,0)) ����Ա,  
             sum(decode(JOB,'ANALYST',SAL,0))������,  
             sum(decode(JOB,'PRESIDENT',SAL,0))���³�  
         from emp group by ename order by ename;  
 
 
 
Sql����  
--�����Ӳ�ѯ;  
             select a.empno,a.mgr,a.ename,a.sal,b.empno,b.ename,b.sal from scott.emp a,scott.emp b where a.mgr=b.empno ;  
  
             --�������ӣ�  
             select a.ename,a.sal,b.ename from scott.emp a,scott.emp b where a.mgr=b.empno(+);  
               
             --�����Ӳ�ѯ��  
             select a.empno,a.ename,a.sal,b.empno,b.ename,b.sal from emp a left join emp b on(a.mgr = b.empno) order by a.empno;  
                   select * from emp order by empno;  
               
               
             select emp.*,(select deptno from dept where LOC = 'NEW YORK')�������� from emp;  
               
            --select sal from emp where emp.deptno = 30 ��������ѯ���Ľ����1600,1250,1250,2850,1500,950��  
            --Ȼ��Ա���Ĺ��� ������� �Ӳ�ѯ��ѯ���������ݡ�   
            select emp.* from emp where emp.sal > all(select sal from emp where emp.deptno = 30);  
               
            --�������:  
            1   7566    JONES   MANAGER 7839    1981-4-2    2975.00     20  
            2   7788    SCOTT   ANALYST 7566    1987-3-19   3000.00     20  
            3   7839    KING    PRESIDENT       1981-11-17  5000.00     10  
            4   7902    FORD    ANALYST 7566    1981-12-3   3000.00     20  
 
Sql����  
--Ա�����ʣ���������Ӳ�ѯ���棬�κ�һ��ֵ���Ϳ��ԡ������any���÷���  
           select emp.* from emp where emp.sal > any(select sal from emp e where e.deptno = 30);  
 
 
Sql����  
--ʹ��union��ȥ���ظ��У�������  
select emp.empno,emp.ename,emp.sal from emp where emp.sal >= 1500 union   
select emp.empno,emp.ename,emp.sal from emp where emp.sal <=3000;  
  
--ʹ��union allֱ������������ϲ�,������.  
select ename,sal,deptno from scott.emp where deptno>10 union all select ename,sal,deptno from scott.emp where deptno<30 ;  
