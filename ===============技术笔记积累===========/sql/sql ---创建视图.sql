create or replace view customer_group_user_view as
select
       c.customer_id,
       c.mobile_user_name,
       c.mobile,
       c.email,
       c.create_user_id,
       c.organization_id as customer_org_id,
       c.create_time,
       c.mobile_remark,
       u.user_id,
       u.user_name,
       g.group_id,
       g.group_name,
       g.organization_id
  from customer_group cg
  left join group_info g on g.group_id = cg.group_id
  left join customer c on cg.customer_id = c.customer_id
  left join user_info u on g.user_id = u.user_id

 ;