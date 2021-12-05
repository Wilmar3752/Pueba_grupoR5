--query punto A
select c.registration_state,
c.vehicle_class,
avg(l.percentage_discount) average_discount
from leads l
left join car c
on c.vehicle_registration = l.vehicle_registration
where l.issue = 'issue' --polizas emitidas
group by c.registration_state,c.vehicle_class
order by registration_state, average_discount desc

--Query punto B

select c.registration_state,
avg(CASE WHEN l.issue = 'issue' then 1 ELSE 0 END) tasa_conversion
from leads l
left join car c
on c.vehicle_registration = l.vehicle_registration
group by c.registration_state
having avg(CASE WHEN l.issue = 'issue' then 1 ELSE 0 END) < 0.3
order by tasa_conversion desc

