create or replace trigger logismos.player_master_bef_ins_upd_trg
  before insert or update on logismos.player_master
  for each row
begin

  if inserting or updating('last_name') then
  
    if :new.last_name is not null then
      :new.last_name := system.encrypt2hexstring(:new.last_name, '/home/oracle/public.key');
    end if;
  
  end if;

end player_master_bef_ins_upd_trg;
/
