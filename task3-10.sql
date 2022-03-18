3) select * from medical_inst.address a
right join medical_inst.contact b
on a.contact_id = b.id;

4) delete from medical_inst.contact a
using medical_inst.contact b
where a.ctid < b.ctid
and a.phone_number = b.phone_number
and a.email = b.email
and a.profile_link = b.profile_link;

5) select * from medical_inst.contact
where id <= (select count(*)/2 from medical_inst.contact);

6) select * from medical_inst.person_data a
left join (medical_inst.person_data b
		   left join medical_inst.medical_card c
		   on b.medical_card_id = c.id)
on a.parent_id = b.id
where c.med_status is null;

7) create view medical_inst.test as
select a.id, city, index, email from medical_inst.address a
right join medical_inst.contact b
on a.contact_id = b.id;

8) create or replace function medical_inst.count_contacts()
	returns table
		(
			total bigint
		)
	language plpgsql
as
$$
begin
	return query (
		select count(*) from medical_inst.contact
	);
end;

9) create or replace function medical_inst.my_insert(_id bigint, _phone character varying(32), _email character varying(128), _profile text)
	returns void
	language plpgsql
as
$$
begin
		insert into medical_inst.contact (id, phone_number, email, profile_link)
		values (_id, _phone, _email, _profile);
end;
$$;

10) create or replace function medical_inst.test()
returns trigger
language plpgsql
as
$$
begin
	update medical_inst.contact set profile_link = 'done'
	where id = (select count(*) from medical_inst.contact);
return new;
end;
$$;

create trigger my_trigger
after insert
on medical_inst.contact
for each statement
execute procedure medical_inst.test();