create or replace package startouch.main is

  TT_BET            CONSTANT INT := 1; -- STARTOUCH
  TT_DROP_PLAQUES   CONSTANT INT := 2; -- STARTOUCH
  TT_CHIPS_GIVEN    CONSTANT INT := 3; -- STARTOUCH
  TT_WIN            CONSTANT INT := 4; -- STARTOUCH
  TT_PLAQUES_OUT    CONSTANT INT := 5; -- CAGETS
  TT_PLAQUES_IN     CONSTANT INT := 6; -- CAGETS
  TT_CASH_OUT       CONSTANT INT := 7; -- CAGETS
  TT_CHIPS_DEPOSIT  CONSTANT INT := 8; -- CAGETS
  TT_CHIPS_WITHDRAW CONSTANT INT := 9; -- CAGETS
  TT_CHIPS_BUY      CONSTANT INT := 10; -- CAGETS
  TT_CHIPS_IN       CONSTANT INT := 11; -- STARTOUCH
  TT_CHIPS_OUT      CONSTANT INT := 12; -- STARTOUCH
  TT_DROP_CASH      CONSTANT INT := 13; -- STARTOUCH
  TT_ROLLING_BET    CONSTANT INT := 18; -- STARTOUCH
  TT_BACCARAT_BB    CONSTANT INT := 21; -- STARTOUCH
  TT_BACCARAT_PB    CONSTANT INT := 22; -- STARTOUCH
  TT_BACCARAT_T     CONSTANT INT := 23; -- STARTOUCH
  TT_BACCARAT_BPB   CONSTANT INT := 24; -- STARTOUCH
  TT_BACCARAT_PPB   CONSTANT INT := 25; -- STARTOUCH
  TT_ROLLING_RETURN CONSTANT INT := 26; -- STARTOUCH

  ivUnknownPlayerID int;

  procedure save_player_expenses(a_unique_player_id in varchar2,
                                 a_user_id          in varchar2,
                                 a_dealer_id        in varchar2);

  procedure save_player_transactions(a_unique_player_id in varchar2,
                                     a_ptable_type      in varchar2,
                                     a_pfactor          in number,
                                     a_phands           in number,
                                     a_avgbet           in number,
                                     a_start_time       in date,
                                     a_player_link      in number,
                                     a_table_link       in number,
                                     a_pit_code         in varchar2,
                                     a_game_id          in varchar2,
                                     a_user_id          in varchar2,
                                     a_dealer_id        in varchar2,
                                     a_tournament_id    in number,
                                     a_end_time         in out date);

  procedure save_player_anal_transactions(a_unique_player_id in varchar2,
                                          a_ptable_type      in varchar2,
                                          a_pfactor          in number,
                                          a_phands           in number,
                                          a_avgbet           in number,
                                          a_start_time       in date,
                                          a_player_link      in number,
                                          a_table_link       in number,
                                          a_pit_code         in varchar2,
                                          a_game_id          in varchar2,
                                          a_user_id          in varchar2,
                                          a_dealer_id        in varchar2,
                                          a_tournament_id    in number,
                                          a_end_time         in out date);

  procedure update_float_difference(a_table_link in number,
                                    a_key        in startouch.float_difference.denom_key%type,
                                    a_value      in startouch.float_difference.denom_value%type,
                                    a_game_date  in date);

  procedure update_float_difference(a_table_link in number,
                                    a_key        in startouch.float_difference.denom_key%type,
                                    a_value      in startouch.float_difference.denom_value%type);

  procedure float_report(a_table_link in number, ret_val out sys_refcursor);

  procedure float_report_detail(a_table_link in number,
                                ret_val      out sys_refcursor);

  procedure member_report(a_table_link  in number,
                          a_member_link in number,
                          ret_val       out sys_refcursor);

  procedure member_report_for_table(a_table_link  in number,
                                    a_member_link in number,
                                    ret_val       out sys_refcursor);

  procedure trak_details(a_table_link  in number,
                         a_member_link in number,
                         ret_val       out sys_refcursor);

  function isNowPlaying(aCustomerID int) return int;

  procedure table_analysis(a_table_link in number,
                           ret_val      out sys_refcursor);

  procedure casino_analysis(ret_val out sys_refcursor);

  procedure update_and_save_guest_trans(a_unique_player_id in string,
                                        a_player_link_id   in number,
                                        a_user_id          in varchar2,
                                        a_dealer_id        in varchar2);

  procedure save_player_guest_trans(a_unique_player_id in varchar2,
                                    a_user_id          in varchar2,
                                    a_dealer_id        in varchar2);

  procedure save_table_guest_trans(a_table_link in number,
                                   a_user_id    in varchar2,
                                   a_dealer_id  in varchar2);

  procedure clear_player_trans(a_unique_player_id in string);

  procedure update_player_trans(a_unique_player_id in string,
                                a_game_id          in string);

  function getUnknownPlayerID return int;

  procedure clear_all_trans;

  procedure get_table_alerts(aTableLink in integer,
                             retVal     out sys_refcursor);

  procedure get_all_table_alerts(retVal out sys_refcursor);

  function fixDateTo(aDateFrom date, aDateTo date) return date;

  function has_actual_transactions(a_unique_player_id in varchar2) return int;

  function is_time_based(a_table_link int) return int;

  function get_guardian_user_id(a_login_name in varchar2) return number;

  function is_user_authenticated(a_user_id  in number,
                                 a_app_name in varchar2,
                                 a_auth_key in varchar2) return number;

  function is_user_authenticated(a_login_name in varchar2,
                                 a_app_name   in varchar2,
                                 a_auth_key   in varchar2) return number;

  procedure add_denomination_tracking(a_table_link          in number,
                                      a_key                 in startouch.denomination_tracking.denom_key%type,
                                      a_value               in startouch.denomination_tracking.denom_value%type,
                                      a_unique_player_id    in startouch.denomination_tracking.unique_player_id%type,
                                      a_player_id           in startouch.denomination_tracking.player_id%type,
                                      a_transaction_type_id in startouch.denomination_tracking.transaction_type_id%type,
                                      a_game_id             in startouch.denomination_tracking.game_id%type,
                                      a_tracking_id         in startouch.denomination_tracking.tracking_id%type,
                                      a_gamedate            in date,
                                      a_user_id             in guardian.user_master.user_id%type);

  procedure add_denomination_tracking(a_table_link          in number,
                                      a_key                 in startouch.denomination_tracking.denom_key%type,
                                      a_value               in startouch.denomination_tracking.denom_value%type,
                                      a_unique_player_id    in startouch.denomination_tracking.unique_player_id%type,
                                      a_player_id           in startouch.denomination_tracking.player_id%type,
                                      a_transaction_type_id in startouch.denomination_tracking.transaction_type_id%type,
                                      a_game_id             in startouch.denomination_tracking.game_id%type,
                                      a_tracking_id         in startouch.denomination_tracking.tracking_id%type,
                                      a_gamedate            in date);

  procedure add_denomination_tracking(a_table_link          in number,
                                      a_key                 in startouch.denomination_tracking.denom_key%type,
                                      a_value               in startouch.denomination_tracking.denom_value%type,
                                      a_unique_player_id    in startouch.denomination_tracking.unique_player_id%type,
                                      a_player_id           in startouch.denomination_tracking.player_id%type,
                                      a_transaction_type_id in startouch.denomination_tracking.transaction_type_id%type,
                                      a_game_id             in startouch.denomination_tracking.game_id%type,
                                      a_tracking_id         in startouch.denomination_tracking.tracking_id%type);

  procedure next_sequence_id_sp(a_table_name in varchar2,
                                a_increment  in int,
                                a_next_id    out number);

  procedure get_denomination_tracking(a_player_id          in startouch.denomination_tracking.player_id%type,
                                      a_game_date_from     in startouch.denomination_tracking.game_date%type,
                                      a_game_date_to       in startouch.denomination_tracking.game_date%type,
                                      a_denomination_types in int,
                                      table_output         out sys_refcursor);

  procedure players_ex_sp(a_player_id             in logismos.player_master.link_id%type,
                          a_first_name            in logismos.player_master.first_name%type,
                          a_last_name             in logismos.player_master.last_name%type,
                          a_fathers_name          in logismos.player_master.fathers_name%type,
                          a_card_number           in logismos.player_master.card_number%type,
                          a_id_type               in logismos.player_master.id_type%type,
                          a_id_number             in logismos.player_master.id_number%type,
                          a_birth_date            in logismos.player_master.birth_date%type,
                          a_country_code          in logismos.player_master.country_code%type,
                          a_use_yesterday_players in int,
                          ret_val                 out sys_refcursor);

  function setDateYear(a_date date, a_year varchar2 := '2000') return date;

  function setDateYear(a_date date, a_year int := 2000) return date;

  function clearDateYear(a_date date) return date;

  function getTableGameDate(a_table_id in int, a_date in date) return date;

  function getJunketOperator(a_game_date date, a_player_id int) return int;

  procedure get_junket_and_operator(a_player_id int,
                                    a_ret_val   out sys_refcursor);

  function hasVisitAfterDate(a_customer_id int, a_after date) return number;
  function isTrackedAfterDate(a_customer_id int, a_after date) return number;
  function isTrackedToday(a_customer_id int) return number;
  function isCheckedOut(a_customer_id int) return number;

  procedure players_sp(table_output      out sys_refcursor,
                       a_first_name      in logismos.player_master.first_name%type,
                       a_last_name       in logismos.player_master.last_name%type,
                       a_card_number     in logismos.player_master.card_number%type,
                       a_membership_type in logismos.player_master.membership_type%type,
                       a_sex             in logismos.player_master.sex%type,
                       a_days_elapsed    in integer);

  procedure initTableRequest(pTransName      in string,
                             pTableID        in int,
                             pRqstCode       out int,
                             a_denominations out sys_refcursor);

  procedure doTableRequest(pTransName  in string,
                           pTableID    in int,
                           pRqstCode   in int,
                           pRqstTotal  in float,
                           pRqstNoGame in string,
                           pUserID     in string,
                           pAuthID1    in string,
                           pAuthID2    in string,
                           pCompName   in string);

  procedure get_fill_denominations(a_tranfer_type   in int,
                                   a_transaction_id in int,
                                   a_denominations  out sys_refcursor);

  procedure update_now_playing_position(a_position_x       in startouch.now_playing.position_x%type,
                                        a_position_y       in startouch.now_playing.position_y%type,
                                        a_unique_player_id in startouch.now_playing.unique_player_id%type,
                                        a_affected_rows    out int);

  procedure get_authorizers(a_auth_area in varchar2,
                            ret_val     out sys_refcursor);

  procedure undo_float_transactions(a_unique_player_id in startouch.denomination_tracking.unique_player_id%type,
                                    a_game_id          in startouch.denomination_tracking.game_id%type);

  procedure get_open_transfers(a_table_link in starcash.tables.table_link%type,
                               a_ret_val    out sys_refcursor);

  procedure summerDayLightSaving(a_unique_player_id in startouch.denomination_tracking.unique_player_id%type);
  procedure winterDayLightSaving(a_unique_player_id in startouch.denomination_tracking.unique_player_id%type);

  procedure insert_bet(a_pit_code         in varchar2,
                       a_table_link       in number,
                       a_customer_id      in number,
                       a_game_id          in varchar2,
                       a_unique_player_id in varchar2,
                       a_amount           in number,
                       a_promos_amount    in number,
                       a_entered_by       in varchar2,
                       a_denominations    in varchar2,
                       a_game_date        in date,
                       a_tournament_id    in number);

  procedure insert_rolling_bet(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_promos_amount    in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number);

  procedure insert_wins(a_pit_code         in varchar2,
                        a_table_link       in number,
                        a_customer_id      in number,
                        a_game_id          in varchar2,
                        a_unique_player_id in varchar2,
                        a_amount           in number,
                        a_promos_amount    in number,
                        a_entered_by       in varchar2,
                        a_denominations    in varchar2,
                        a_game_date        in date,
                        a_tournament_id    in number);

  procedure insert_chipsin(a_pit_code         in varchar2,
                           a_table_link       in number,
                           a_customer_id      in number,
                           a_game_id          in varchar2,
                           a_unique_player_id in varchar2,
                           a_amount           in number,
                           a_promos_amount    in number,
                           a_entered_by       in varchar2,
                           a_denominations    in varchar2,
                           a_game_date        in date,
                           a_tournament_id    in number);

  procedure insert_chipsout(a_pit_code         in varchar2,
                            a_table_link       in number,
                            a_customer_id      in number,
                            a_game_id          in varchar2,
                            a_unique_player_id in varchar2,
                            a_amount           in number,
                            a_promos_amount    in number,
                            a_entered_by       in varchar2,
                            a_denominations    in varchar2,
                            a_game_date        in date,
                            a_tournament_id    in number);

  procedure insert_drop(a_pit_code         in varchar2,
                        a_table_link       in number,
                        a_customer_id      in number,
                        a_game_id          in varchar2,
                        a_unique_player_id in varchar2,
                        a_amount           in number,
                        a_entered_by       in varchar2,
                        a_denominations    in varchar2,
                        a_game_date        in date,
                        a_tournament_id    in number);

  procedure insert_drop_plaques(a_pit_code         in varchar2,
                                a_table_link       in number,
                                a_customer_id      in number,
                                a_game_id          in varchar2,
                                a_unique_player_id in varchar2,
                                a_amount           in number,
                                a_entered_by       in varchar2,
                                a_denominations    in varchar2,
                                a_game_date        in date,
                                a_tournament_id    in number);

  procedure insert_chips_given(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number);

  procedure insert_baccarat_bb(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_promos_amount    in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number);

  procedure insert_baccarat_pb(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_promos_amount    in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number);

  procedure insert_baccarat_t(a_pit_code         in varchar2,
                              a_table_link       in number,
                              a_customer_id      in number,
                              a_game_id          in varchar2,
                              a_unique_player_id in varchar2,
                              a_amount           in number,
                              a_promos_amount    in number,
                              a_entered_by       in varchar2,
                              a_denominations    in varchar2,
                              a_game_date        in date,
                              a_tournament_id    in number);

  procedure insert_baccarat_bpb(a_pit_code         in varchar2,
                                a_table_link       in number,
                                a_customer_id      in number,
                                a_game_id          in varchar2,
                                a_unique_player_id in varchar2,
                                a_amount           in number,
                                a_promos_amount    in number,
                                a_entered_by       in varchar2,
                                a_denominations    in varchar2,
                                a_game_date        in date,
                                a_tournament_id    in number);

  procedure insert_baccarat_ppb(a_pit_code         in varchar2,
                                a_table_link       in number,
                                a_customer_id      in number,
                                a_game_id          in varchar2,
                                a_unique_player_id in varchar2,
                                a_amount           in number,
                                a_promos_amount    in number,
                                a_entered_by       in varchar2,
                                a_denominations    in varchar2,
                                a_game_date        in date,
                                a_tournament_id    in number);

  procedure insert_rolling_return(a_pit_code         in varchar2,
                                  a_table_link       in number,
                                  a_customer_id      in number,
                                  a_game_id          in varchar2,
                                  a_unique_player_id in varchar2,
                                  a_amount           in number,
                                  a_promos_amount    in number,
                                  a_entered_by       in varchar2,
                                  a_denominations    in varchar2,
                                  a_game_date        in date,
                                  a_tournament_id    in number);

  procedure get_undoable_actions(a_user_id in varchar2,
                                 a_ret_val out sys_refcursor);

  function isUndoActionCommited(a_undo_transaction_id in int,
                                a_transaction_type_id in int) return int;

  procedure removeFromUndoBuffer(a_undo_transaction_id in int,
                                 a_transaction_type_id in int,
                                 a_user_id             string);

  function splitInt(a_list varchar2, a_delimiter varchar2 := ',')
    return int_table
    pipelined;

  function getCustomerChipsBuy(a_customer_id int,
                               a_from_date   date,
                               a_to_date     date) return number;

  function lastTransactionDate(a_player_id int, a_offset int := 0)
    return date;

  function sort_value(a_player_id         int,
                      a_unkwnow_player_id int,
                      a_sort_type         int,
                      a_fist_name         string,
                      a_last_name         string) return string;

  procedure find_players(a_first_name      in logismos.player_master.first_name%type,
                         a_last_name       in logismos.player_master.last_name%type,
                         a_card_number     in logismos.player_master.card_number%type,
                         a_membership_type in logismos.player_master.membership_type%type,
                         a_sex             in logismos.player_master.sex%type,
                         a_special_query   in integer,
                         a_age_cluster     in varchar2,
                         table_output      out sys_refcursor);

  -- overwrite for applications not being aware of the a_age_cluster param
  procedure find_players(a_first_name      in logismos.player_master.first_name%type,
                         a_last_name       in logismos.player_master.last_name%type,
                         a_card_number     in logismos.player_master.card_number%type,
                         a_membership_type in logismos.player_master.membership_type%type,
                         a_sex             in logismos.player_master.sex%type,
                         a_special_query   in integer,
                         table_output      out sys_refcursor);

  function getTableAverageBet(a_customer_id int,
                              a_table_id    int,
                              a_from_date   date,
                              a_to_date     date) return number;

  function demo(aTableLink in integer) return sys_refcursor;

  procedure create_or_update_alarm(a_table_id in startouch.alarm.table_id%type,
                                   a_user_id  in startouch.alarm.user_id%type);

  procedure cancel_alarm(a_table_id in startouch.alarm.table_id%type,
                         a_user_id  in startouch.alarm.user_id%type);

  procedure get_alarms(ret_val out sys_refcursor);

  procedure remove_baccarat_transactions(a_instance_id in varchar2);

  procedure tournament_add_player(a_action_id in number,
                                  a_player_id in number,
                                  a_user_id   in number,
                                  a_gamedate  in date);

  procedure get_basic_rolling_report(a_player_id     in number,
                                     a_table_id      in number,
                                     a_tournament_id in number,
                                     ret_val         out sys_refcursor);

  procedure member_report_for_gd_tour(a_table_link  in number,
                                      a_member_link in number,
                                      a_tournament  in number,
                                      ret_val       out sys_refcursor);

  procedure member_report_for_tour(a_table_link  in number,
                                   a_member_link in number,
                                   a_tournament  in number,
                                   ret_val       out sys_refcursor);

  procedure rolling_roll(a_player_id   in number,
                         a_campaign_id in number,
                         ret_val       out sys_refcursor);

end main;
/
create or replace package body startouch.main is

  /*
  * Αποθήκευση των κινήσεων που αφορούν τα expenses στο προσωρινό ή οριστικό trak.
  */
  procedure save_player_expenses(a_unique_player_id in varchar2,
                                 a_user_id          in varchar2,
                                 a_dealer_id        in varchar2) is
    dummy int;
  begin
  
    for expense in (select ex.*,
                           ex.qty * et.def_amount as amount,
                           et.exp_group
                      from startouch.expense ex
                      join logismos.trkexp_types et
                        on et.code = ex.trkexp_types_code
                     where ex.unique_player_id = a_unique_player_id) loop
    
      if expense.player_master_link_id = startouch.main.ivUnknownPlayerID then
      
        insert into startouch.delayed_expenses
          (pmemberid,
           pexpensegroup,
           pexpensetype,
           pgamedate,
           pamount,
           pcomment,
           unique_player_id,
           table_link_id)
        values
          (expense.player_master_link_id,
           expense.exp_group,
           expense.trkexp_types_code,
           api.getGameDate(expense.entered_at),
           expense.amount,
           null,
           a_unique_player_id,
           expense.tables_table_link);
      
      else
      
        begin
          starapi.pcg_trak.Expense(expense.player_master_link_id,
                                   expense.trkexp_types_code,
                                   api.getGameDate(expense.entered_at),
                                   expense.amount,
                                   null,
                                   upper(a_user_id),
                                   dummy);
          /*exception
          when starapi.pcg_trak.upd_slot_db_multivenue then
            null;
          when starapi.pcg_trak.updating_slot_db_error then
            null;*/
        end;
      
      end if;
    
    end loop;
  
    delete from startouch.expense
     where expense.unique_player_id = a_unique_player_id;
  
  end save_player_expenses;

  /*
  * Αποθήκευση των transaction στο προσωρινό ή οριστικό trak.
  */
  procedure save_player_transactions(a_unique_player_id in varchar2,
                                     a_ptable_type      in varchar2,
                                     a_pfactor          in number,
                                     a_phands           in number,
                                     a_avgbet           in number,
                                     a_start_time       in date,
                                     a_player_link      in number,
                                     a_table_link       in number,
                                     a_pit_code         in varchar2,
                                     a_game_id          in varchar2,
                                     a_user_id          in varchar2,
                                     a_dealer_id        in varchar2,
                                     a_tournament_id    in number,
                                     a_end_time         in out date) is
  begin
   startouch.main.save_player_anal_transactions(a_unique_player_id,
                                                 a_ptable_type,
                                                 a_pfactor,
                                                 a_phands,
                                                 a_avgbet,
                                                 a_start_time,
                                                 a_player_link,
                                                 a_table_link,
                                                 a_pit_code,
                                                 a_game_id,
                                                 upper(a_user_id),
                                                 upper(a_dealer_id),
                                                 a_tournament_id,
                                                 a_end_time);
  
    -- Τα expenses αποθηκεύονται χωριστά.
    startouch.main.save_player_expenses(a_unique_player_id,
                                        upper(a_user_id),
                                        upper(a_dealer_id));
  
  end;

  /*
  * Αποθήκευση των transaction ενός παίκτη για ένα game_id (ένα γύρο παιχνιδιού) στο προσωρινό ή οριστικό trak.
  */
  -------------------------------------------------------------------------------------------------------
  procedure save_player_anal_transactions(a_unique_player_id in varchar2,
                                          a_ptable_type      in varchar2,
                                          a_pfactor          in number,
                                          a_phands           in number,
                                          a_avgbet           in number,
                                          a_start_time       in date,
                                          a_player_link      in number,
                                          a_table_link       in number,
                                          a_pit_code         in varchar2,
                                          a_game_id          in varchar2,
                                          a_user_id          in varchar2,
                                          a_dealer_id        in varchar2,
                                          a_tournament_id    in number,
                                          a_end_time         in out date) is
    lvHands            int;
    lvNextID           int;
    lvTrackingID       int;
    lvIsTimeBasedTable int := startouch.main.is_time_based(a_table_link);
  begin
  
    if a_ptable_type is not null then
      lvHands := a_phands;
    else
      lvHands := 1;
    end if;
  
    -- these params are only known when update is pressed
    update startouch.undo_buffer
       set avg_bet      = a_avgbet,
           p_table_type = a_ptable_type,
           p_hands      = lvHands,
           p_factor     = a_pfactor
     where unique_player_id = a_unique_player_id
       and ((transaction_type_id = TT_BET and exists
            (select 0 from startouch.bet t where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_DROP_CASH and exists
            (select 0 from startouch.drops t where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_DROP_PLAQUES and exists
            (select 0
                from startouch.drop_plaqs t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_CHIPS_GIVEN and exists
            (select 0
                from startouch.chips_given t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_WIN and exists
            (select 0 from startouch.wins t where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_CHIPS_IN and exists
            (select 0 from startouch.chipsin t where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_CHIPS_OUT and exists
            (select 0 from startouch.cashout t where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_ROLLING_BET and exists
            (select 0
                from startouch.rolling_bet t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_BACCARAT_BB and exists
            (select 0
                from startouch.baccarat_bb t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_BACCARAT_PB and exists
            (select 0
                from startouch.baccarat_pb t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_BACCARAT_T and exists
            (select 0
                from startouch.baccarat_t t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_BACCARAT_BPB and exists
            (select 0
                from startouch.baccarat_bpb t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_BACCARAT_PPB and exists
            (select 0
                from startouch.baccarat_ppb t
               where t.id = undo_buffer.id)) or
           (transaction_type_id = TT_ROLLING_RETURN and exists
            (select 0
                from startouch.rolling_return t
               where t.id = undo_buffer.id)));
  
    -- if in time based mode and no transaction exist we create a dummy transaction (bet).
    if startouch.main.has_actual_transactions(a_unique_player_id) = 0 and
       lvIsTimeBasedTable = 1 then
    
      select startouch.seq_bet.nextval into lvNextID from dual;
    
      insert into startouch.bet
        (id,
         casino_pits_pit_code,
         tables_table_link,
         player_master_link_id,
         value,
         promos_value,
         entered_by,
         game_id,
         unique_player_id,
         entered_at,
         game_date)
      values
        (lvNextID,
         a_pit_code,
         a_table_link,
         a_player_link,
         0,
         0,
         upper(a_user_id),
         a_game_id,
         a_unique_player_id,
         sysdate,
         api.getTableGameDate(a_table_link));
    
    end if;
  
    if a_end_time is null then
      a_end_time := sysdate;
    end if;
  
    if startouch.main.has_actual_transactions(a_unique_player_id) = 1 then
    
      for trans in (select game_date,
                           sum(deal_bet) as deal_bet,
                           sum(deal_drops) as deal_drops,
                           sum(deal_drop_plaqs) as deal_drop_plaqs,
                           sum(deal_chipsin) as deal_chipsin,
                           sum(deal_cashout) as deal_cashout,
                           sum(deal_chips_given) as deal_chips_given,
                           sum(deal_winns) as deal_winns,
                           sum(promo_chips_bet) as promo_chips_bet,
                           sum(promo_chips_given) as promo_chips_given,
                           sum(rolling_bet) as rolling_bet,
                           sum(rolling_return) as rolling_return
                    
                      from (select game_date,
                                   nvl(sum(t.value), 0) as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   nvl(sum(t.promos_value), 0) as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.bet t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   nvl(sum(t.value), 0) as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.drops t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   nvl(sum(t.value), 0) as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.drop_plaqs t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   nvl(sum(t.value), 0) as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   nvl(sum(t.promos_value), 0) as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.chipsin t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   nvl(sum(t.value), 0) as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   nvl(sum(t.promos_value), 0) as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.cashout t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   nvl(sum(t.value), 0) as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.chips_given t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   nvl(sum(t.value), 0) as deal_winns,
                                   0 as promo_chips_bet,
                                   nvl(sum(t.promos_value), 0) as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.wins t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   nvl(sum(t.value), 0) as rolling_bet,
                                   0 as rolling_return
                              from startouch.rolling_bet t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   nvl(sum(t.value), 0) as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.baccarat_bb t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   nvl(sum(t.value), 0) as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.baccarat_pb t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   nvl(sum(t.value), 0) as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.baccarat_t t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   nvl(sum(t.value), 0) as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.baccarat_bpb t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   nvl(sum(t.value), 0) as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   0 as rolling_return
                              from startouch.baccarat_ppb t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date
                            
                            union all
                            
                            select game_date,
                                   0 as deal_bet,
                                   0 as deal_drops,
                                   0 as deal_drop_plaqs,
                                   0 as deal_chipsin,
                                   0 as deal_cashout,
                                   0 as deal_chips_given,
                                   0 as deal_winns,
                                   0 as promo_chips_bet,
                                   0 as promo_chips_given,
                                   0 as rolling_bet,
                                   nvl(sum(t.value), 0) as rolling_return
                              from startouch.rolling_return t
                             where t.unique_player_id = a_unique_player_id
                             group by game_date)
                     group by game_date) loop
      
        if a_player_link = startouch.main.ivUnknownPlayerID then
        
          next_sequence_id_sp('TRACKING_TMP', -1, lvTrackingID);
        
          update startouch.denomination_tracking
             set tracking_id = lvTrackingID
           where unique_player_id = a_unique_player_id
             and table_link = a_table_link
             and tracking_id is null;
        
          insert into startouch.delayed_table_entry
            (pmemberid,
             psource,
             ptabletype,
             ptableid,
             phands,
             pfactor,
             pgamedate,
             pstarttime,
             pendtime,
             pavgbet,
             pbet,
             pdrop,
             pcashout,
             pcashchips,
             pcomment,
             pChipsGiven,
             pDropPlaques,
             pWin,
             unique_player_id,
             record_type,
             tracking_id,
             promo_chips_bet,
             promo_chips_given,
             prollbuy,
             prollreturn,
             tournament_id)
          values
            (a_player_link,
             'PT',
             a_ptable_type,
             a_table_link,
             lvHands,
             a_pfactor,
             trans.game_date,
             a_start_time,
             startouch.main.fixDateTo(a_start_time, a_end_time),
             a_avgbet,
             trans.deal_bet,
             trans.deal_drops,
             trans.deal_cashout,
             trans.deal_chipsin,
             null,
             trans.deal_chips_given,
             trans.deal_drop_plaqs,
             trans.deal_winns,
             a_unique_player_id,
             2,
             lvTrackingID,
             trans.promo_chips_bet,
             trans.promo_chips_given,
             trans.rolling_bet,
             trans.rolling_return,
             a_tournament_id);
        
        else
        
          begin
            startouch.api.TableEntry(a_player_link,
                                     'PT',
                                     a_ptable_type,
                                     a_table_link,
                                     lvHands,
                                     a_pfactor,
                                     trans.game_date,
                                     a_start_time,
                                     startouch.main.fixDateTo(a_start_time,
                                                              a_end_time),
                                     a_avgbet,
                                     trans.deal_bet,
                                     trans.deal_drops,
                                     trans.deal_cashout,
                                     trans.deal_chipsin,
                                     null,
                                     trans.deal_chips_given,
                                     trans.deal_drop_plaqs,
                                     trans.deal_winns,
                                     trans.promo_chips_bet,
                                     trans.promo_chips_given,
                                     trans.rolling_bet,
                                     trans.rolling_return,
                                     upper(a_user_id),
                                     upper(a_dealer_id),
                                     a_tournament_id,
                                     lvTrackingID);
          
            update startouch.denomination_tracking
               set tracking_id = lvTrackingID
             where unique_player_id = a_unique_player_id
               and table_link = a_table_link
               and tracking_id is null;
          
            /* exception
            when starapi.pcg_trak.upd_slot_db_multivenue then
              null;
            when starapi.pcg_trak.updating_slot_db_error then
              null;*/
          end;
        
        end if;
      
        delete from startouch.bet
         where unique_player_id = a_unique_player_id;
        delete from startouch.drops
         where unique_player_id = a_unique_player_id;
        delete from startouch.chipsin
         where unique_player_id = a_unique_player_id;
        delete from startouch.cashout
         where unique_player_id = a_unique_player_id;
        delete from startouch.chips_given
         where unique_player_id = a_unique_player_id;
        delete from startouch.drop_plaqs
         where unique_player_id = a_unique_player_id;
        delete from startouch.wins
         where unique_player_id = a_unique_player_id;
        delete from startouch.rolling_bet
         where unique_player_id = a_unique_player_id;
        delete from startouch.baccarat_bb
         where unique_player_id = a_unique_player_id;
        delete from startouch.baccarat_pb
         where unique_player_id = a_unique_player_id;
        delete from startouch.baccarat_t
         where unique_player_id = a_unique_player_id;
        delete from startouch.baccarat_bpb
         where unique_player_id = a_unique_player_id;
        delete from startouch.baccarat_ppb
         where unique_player_id = a_unique_player_id;
        delete from startouch.rolling_return
         where unique_player_id = a_unique_player_id;
      
      end loop;
    
    end if;
  
  end save_player_anal_transactions;

  -------------------------------------------------------------------------------------------------------
  procedure update_float_difference(a_table_link in number,
                                    a_key        in startouch.float_difference.denom_key%type,
                                    a_value      in startouch.float_difference.denom_value%type,
                                    a_game_date  in date) as
  begin
  
    update startouch.float_difference
       set denom_value = denom_value + a_value, entered_at = sysdate
     where game_date = a_game_date
       and table_link = a_table_link
       and denom_key = a_key;
  
    if SQL%ROWCOUNT < 1 then
      insert into startouch.float_difference
        (table_link, denom_key, denom_value, entered_at, game_date)
      values
        (a_table_link, a_key, a_value, sysdate, a_game_date);
    end if;
  
  end update_float_difference;

  -------------------------------------------------------------------------------------------------------
  procedure update_float_difference(a_table_link in number,
                                    a_key        in startouch.float_difference.denom_key%type,
                                    a_value      in startouch.float_difference.denom_value%type) as
  begin
  
    update_float_difference(a_table_link,
                            a_key,
                            a_value,
                            api.getTableGameDate(a_table_link));
  
  end update_float_difference;

  -------------------------------------------------------------------------------------------------------
  procedure float_report(a_table_link in number, ret_val out sys_refcursor) as
    COPEN          constant string(200) := 'OPEN';
    CFILLS_CREDITS constant string(200) := 'FILLS CREDITS';
    CFLOAT_DIFF    constant string(200) := 'FLOAT DIFF';
  
    COPEN_IDX          constant number(1) := 1;
    CFILLS_CREDITS_IDX constant number(1) := 2;
    CFLOAT_DIFF_IDX    constant number(1) := 3;
  begin
  
    open ret_val for
      select t.*, denoms.description2, denoms.value as denom_value
        from (
              /*
              Το union με τα μηδενικά values γίνεται ώστε να εξασφαλήσω ότι στο παραγόμενο dataset
              θα υπάρχουν τα value_type [CFILLS_CREDITS και COPEN] σε περίπτωση που το union που ακολουθεί
              και επιστρέφει τιμές απο το tracking δεν επιστρέψει τιμές.
                      */
              select fd.denom_key,
                      fd.denom_value  as denom_count,
                      CFLOAT_DIFF     as value_type,
                      CFLOAT_DIFF_IDX as idx
                from startouch.float_difference fd
               where game_date = api.getTableGameDate(a_table_link)
                 and fd.table_link = a_table_link
              
              union
              
              select fd.denom_key, 0, CFILLS_CREDITS, CFILLS_CREDITS_IDX
                from startouch.float_difference fd
               where game_date = api.getTableGameDate(a_table_link)
                 and fd.table_link = a_table_link
              union
              select fd.denom_key, 0, COPEN, COPEN_IDX
                from startouch.float_difference fd
               where game_date = api.getTableGameDate(a_table_link)
                 and fd.table_link = a_table_link
              union
              select denom_code, qty_of_denom, COPEN, COPEN_IDX
                from starcash.open_floats_den
               where open_code =
                     (select open_code
                        from starcash.open_floats
                       where table_link = a_table_link
                         and game_date = api.getTableGameDate(a_table_link)
                         and canceled = 'N')
                 and qty_of_denom <> 0
              
              union
              
              select denom_code,
                      sum(qty_of_denom),
                      CFILLS_CREDITS,
                      CFILLS_CREDITS_IDX
                from starcash.fills_den
               where fill_code in
                     (select fill_code
                        from starcash.fills
                       where table_link = a_table_link
                         and game_date = api.getTableGameDate(a_table_link)
                         and canceled = 'N')
                 and qty_of_denom <> 0
               group by denom_code
              
              union
              
              select chips_exchange_den.denom_code,
                      sum(-chips_exchange_den.in_qty_of_denom),
                      CFILLS_CREDITS,
                      CFILLS_CREDITS_IDX
                from starcash.chips_exchange_den chips_exchange_den
               where chips_exchange_den.chips_exchange_code in
                     (select chips_exchange.chips_exchange_code
                        from starcash.chips_exchange chips_exchange
                       where chips_exchange.table_link = a_table_link
                         and chips_exchange.game_date =
                             api.getTableGameDate(a_table_link)
                         and chips_exchange.canceled = 'N')
                 and chips_exchange_den.in_qty_of_denom <> 0
               group by chips_exchange_den.denom_code
              
              union
              
              select chips_exchange_den.denom_code,
                      sum(chips_exchange_den.out_qty_of_denom),
                      CFILLS_CREDITS,
                      CFILLS_CREDITS_IDX
                from starcash.chips_exchange_den chips_exchange_den
               where chips_exchange_den.chips_exchange_code in
                     (select chips_exchange.chips_exchange_code
                        from starcash.chips_exchange chips_exchange
                       where chips_exchange.table_link = a_table_link
                         and chips_exchange.game_date =
                             api.getTableGameDate(a_table_link)
                         and chips_exchange.canceled = 'N')
                 and chips_exchange_den.out_qty_of_denom <> 0
               group by chips_exchange_den.denom_code
              
              ) t
        join starcash.denoms denoms
          on denoms.denom_code = t.denom_key
      
      ;
  
  end float_report;

  -------------------------------------------------------------------------------------------------------
  procedure float_report_detail(a_table_link in number,
                                ret_val      out sys_refcursor) as
  begin
  
    open ret_val for
      SELECT "LOGISMOS"."TRAK_TABLES"."PLAY_TIME" AS "PLAY_TIME",
             "LOGISMOS"."TRAK_TABLES"."DROP" AS "DROP",
             "LOGISMOS"."TRAK_TABLES"."DROP_PLAQUES" AS "DROP_PLAQUES",
             "LOGISMOS"."TRAK_TABLES"."CASH_CHIPS" AS "CHIPS_IN",
             "LOGISMOS"."TRAK_TABLES"."CASH_OUT" AS "CHIPS_OUT",
             "LOGISMOS"."TRAK_TABLES"."THEORET_DROP" AS "THEORET_BET",
             "LOGISMOS"."TRAK_TABLES"."THEORET_LOSS" AS "THEORET_LOSS",
             "LOGISMOS"."TRAK_TABLES"."ACTUAL_LOSS" AS "TABLE_WIN_A",
             cast(DECODE(("LOGISMOS"."TRAK_TABLES"."DROP" +
                         "LOGISMOS"."TRAK_TABLES"."DROP_PLAQUES"),
                         0,
                         0,
                         "LOGISMOS"."TRAK_TABLES"."ACTUAL_LOSS" /
                         ("LOGISMOS"."TRAK_TABLES"."DROP" +
                         "LOGISMOS"."TRAK_TABLES"."DROP_PLAQUES")) as
                  number(10, 3)) * 100 AS "HOLD_A",
             "LOGISMOS"."TRAK_TABLES"."BET" AS "BET",
             "LOGISMOS"."TRAK_TABLES"."WIN" AS "WIN",
             "LOGISMOS"."TRAK_TABLES"."ACT_LOSS_BETWIN" AS "TABLE_WIN_B",
             cast(DECODE(("LOGISMOS"."TRAK_TABLES"."DROP" +
                         "LOGISMOS"."TRAK_TABLES"."DROP_PLAQUES"),
                         0,
                         0,
                         "LOGISMOS"."TRAK_TABLES"."ACT_LOSS_BETWIN" /
                         ("LOGISMOS"."TRAK_TABLES"."DROP" +
                         "LOGISMOS"."TRAK_TABLES"."DROP_PLAQUES")) as
                  number(10, 3)) * 100 AS "HOLD_B",
             "LOGISMOS"."TRAK_TABLES"."CHIPS_GIVEN" as "CHIPS_GIVEN"
        FROM "LOGISMOS"."TRAK_TABLES"
       WHERE "LOGISMOS"."TRAK_TABLES"."TABLE_LINK" = a_table_link
         AND "LOGISMOS"."TRAK_TABLES"."GAMEDATE" =
             api.getTableGameDate(a_table_link);
  
  end float_report_detail;

  /*
  * member_report for gamedate
  */
  procedure member_report(a_table_link  in number,
                          a_member_link in number,
                          ret_val       out sys_refcursor) as
    lvGamedate date := startouch.api.getTableGameDate(a_table_link);
  begin
  
    open ret_val for
    
      select t.*,
             startouch.mis.getLGA1Value(null, a_member_link, lvGamedate) as lg_a1,
             startouch.mis.getLGA2Value(null, a_member_link, lvGamedate) as lg_a2,
             startouch.mis.getLGA1Hint as lg_a1_hint,
             startouch.mis.getLGA2Hint as lg_a2_hint,
             startouch.mis.getLGBValue(null, a_member_link, lvGamedate) as lg_b,
             startouch.mis.getLGBHint as lg_b_hint,
             startouch.mis.getLGTheoBetValue(null,
                                             a_member_link,
                                             lvGamedate) as theoret_bet,
             startouch.mis.getLGTheoBetHint as theoret_bet_hint,
             startouch.mis.getLGTheoLossValue(null,
                                              a_member_link,
                                              lvGamedate) as theoret_loss,
             startouch.mis.getLGTheoLossHint as theoret_loss_hint,
             startouch.main.getCustomerChipsBuy(a_member_link,
                                                lvGamedate,
                                                lvGamedate) as chips_buy_cage
        from (select nvl(sum(trak_stats.play_time), 0) as play_time,
                     nvl(sum(trak_stats."DROP"), 0) AS "DROP",
                     nvl(sum(trak_stats.drop_plaques), 0) as drop_plaques,
                     nvl(sum(trak_stats.cash_chips), 0) as chips_in,
                     nvl(sum(trak_stats.cash_out), 0) as cash_out,
                     nvl(sum(trak_stats.actual_loss), 0) as actual_loss_a,
                     nvl(sum(trak_stats.bet), 0) as actual_bet,
                     nvl(sum(trak_stats.win), 0) as win,
                     nvl(sum(trak_stats.act_loss_betwin), 0) as actual_loss_b,
                     nvl(sum(trak_stats.cash_out_cage), 0) as cash_out_cage,
                     nvl(sum(trak_stats.chips_hold_a), 0) as chips_hold_a,
                     nvl(sum(trak_stats.chips_hold_b), 0) as chips_hold_b,
                     nvl(sum(trak_stats.chips_given), 0) as chips_given,
                     nvl(sum(trak_stats.roll_buy), 0) as roll_buy,
                     nvl(sum(trak_stats.roll_return), 0) as roll_return,
                     
                     nvl(sum(nvl(trak_stats.plaques_out_cage, 0) +
                             nvl(trak_stats.plaques_b_out_cage, 0)),
                         0) as plaques_out_cage,
                     
                     nvl(sum(nvl(trak_stats.plaques_in_cage, 0) +
                             nvl(trak_stats.plaques_b_in_cage, 0)),
                         0) as plaques_in_cage,
                     
                     /*nvl(sum(trak_stats.plaques_hold), 0) as plaques_hold,*/
                     
                     nvl(sum(nvl(trak_stats.plaques_out_cage, 0) +
                             nvl(trak_stats.plaques_b_out_cage, 0) -
                             nvl(trak_stats.plaques_in_cage, 0) -
                             nvl(trak_stats.plaques_b_in_cage, 0)),
                         0) as plaques_hold
              
                from logismos.trak_stats trak_stats
               where trak_stats.memb_linkid = a_member_link
                 and trak_stats.gamedate = lvGamedate) t;
  
  exception
    when no_data_found then
      null;
  end member_report;

  /*
  * member_report for gamedate & table
  */
  procedure member_report_for_table(a_table_link  in number,
                                    a_member_link in number,
                                    ret_val       out sys_refcursor) as
    lvGamedate date := startouch.api.getTableGameDate(a_table_link);
  begin
  
    open ret_val for
    
      select t.*,
             startouch.mis.getLGA1Value(a_table_link,
                                        a_member_link,
                                        lvGamedate) as lg_a1,
             startouch.mis.getLGA2Value(a_table_link,
                                        a_member_link,
                                        lvGamedate) as lg_a2,
             startouch.mis.getLGA1Hint as lg_a1_hint,
             startouch.mis.getLGA2Hint as lg_a2_hint,
             startouch.mis.getLGBValue(a_table_link,
                                       a_member_link,
                                       lvGamedate) as lg_b,
             startouch.mis.getLGBHint as lg_b_hint,
             startouch.mis.getLGTheoBetValue(a_table_link,
                                             a_member_link,
                                             lvGamedate) as theoret_bet,
             startouch.mis.getLGTheoBetHint as theoret_bet_hint,
             startouch.mis.getLGTheoLossValue(a_table_link,
                                              a_member_link,
                                              lvGamedate) as theoret_loss,
             startouch.mis.getLGTheoLossHint as theoret_loss_hint
        from (select nvl(sum(trak_tables_memb.play_time), 0) as play_time,
                     nvl(sum(trak_tables_memb."DROP"), 0) as "DROP",
                     nvl(sum(trak_tables_memb.drop_plaques), 0) as drop_plaques,
                     nvl(sum(trak_tables_memb.chips_given), 0) as chips_given,
                     nvl(sum(trak_tables_memb.cash_chips), 0) as chips_in,
                     nvl(sum(trak_tables_memb.cash_out), 0) as cash_out,
                     nvl(sum(trak_tables_memb.actual_loss), 0) as actual_loss_a,
                     nvl(sum(trak_tables_memb.theoret_drop), 0) as theoret_bet,
                     nvl(sum(trak_tables_memb.theoret_loss), 0) as theoret_loss,
                     nvl(sum(trak_tables_memb.bet), 0) as actual_bet,
                     nvl(sum(trak_tables_memb.win), 0) as win,
                     nvl(sum(trak_tables_memb.act_loss_betwin), 0) as actual_loss_b
                from logismos.trak_tables_memb trak_tables_memb
               where trak_tables_memb.table_link = a_table_link
                 and trak_tables_memb.memb_linkid = a_member_link
                 and trak_tables_memb.gamedate = lvGamedate) t;
  
  exception
    when no_data_found then
      null;
  end member_report_for_table;

  -------------------------------------------------------------------------------------------------------
  procedure trak_details(a_table_link  in number,
                         a_member_link in number,
                         ret_val       out sys_refcursor) as
    lvGameDate date := api.getTableGameDate(a_table_link);
  begin
  
    open ret_val for
    
      select trim(to_char(trak_detail.start_time, 'HH24')) as time_hour,
             trim(to_char(trak_detail.start_time, 'HH24:MI')) as start_time,
             trim(to_char(trak_detail.end_time, 'HH24:MI')) as end_time,
             trak_detail."DROP" as "DROP",
             trak_detail.drop_plaques as drop_plaques,
             trak_detail.chips_given as chips_given,
             trak_detail.cash_chips as chips_in,
             trak_detail.cash_out as chips_out,
             trak_detail.bet as bet,
             trak_detail.win as win,
             trak_detail.theoret_drop as theo_bet,
             trak_detail.hands_played,
             trak_detail.avg_bet as avg_bet,
             /*round(decode(trak_detail.hands_played,
                    null,
                    0,
                    0,
                    0,
                    trak_detail.theoret_drop /
                    trak_detail.hands_played),
             2) as avg_bet,*/
             user_master.last_name || ' ' || user_master.first_name as user_name
        from logismos.trak_detail trak_detail
        join guardian.user_master user_master
          on upper(user_master.user_id) = upper(trak_detail.user_id)
       where trak_detail.gamedate = lvGameDate
         and trak_detail.memb_linkid = a_member_link
         and trak_detail.entry_src = 'PT'
         and trak_detail.table_link = a_table_link
       order by trak_detail.actualdate desc;
  
  end trak_details;

  -------------------------------------------------------------------------------------------------------
  function isNowPlaying(aCustomerID int) return int is
    lvHowMany int;
  begin
  
    select count(0)
      into lvHowMany
      from startouch.now_playing now_playing
     where now_playing.player_master_link_id = aCustomerID;
  
    if lvHowMany > 0 then
      return 1;
    else
      return 0;
    end if;
  
  end isNowPlaying;

  -------------------------------------------------------------------------------------------------------
  procedure table_analysis(a_table_link in number,
                           ret_val      out sys_refcursor) as
    lvGameDate date := startouch.api.getTableGameDate(a_table_link);
  begin
  
    open ret_val for
      select value_records.*,
             player_master.last_name,
             player_master.first_name,
             player_photo.photo,
             isNowPlaying(value_records.memb_linkid) as now_playing
      
        from (select trak_tables_memb.memb_linkid,
                     trak_tables_memb."DROP" as "DROP",
                     trak_tables_memb.drop_plaques as drop_plaques,
                     trak_tables_memb.chips_given as chips_given,
                     trak_tables_memb.chips_in as chips_in,
                     trak_tables_memb.chips_out as chips_out,
                     trak_tables_memb.bet as bet,
                     trak_tables_memb.win as win,
                     trak_tables_memb.play_time as play_time,
                     trak_tables_memb.actual_loss_a as actual_loss_a,
                     trak_tables_memb.actual_loss_b as actual_loss_b,
                     trak_tables_memb.theoret_bet as theoret_bet,
                     trak_tables_memb.theoret_loss as theoret_loss,
                     trak_tables_memb.hands_played as hands_played,
                     round(trak_tables_memb.avg_bet, 2) as avg_bet
              
                from (select trak_tables_memb.memb_linkid as memb_linkid,
                             nvl(sum(trak_tables_memb."DROP"), 0) as "DROP",
                             nvl(sum(trak_tables_memb.drop_plaques), 0) as drop_plaques,
                             nvl(sum(trak_tables_memb.chips_given), 0) as chips_given,
                             nvl(sum(trak_tables_memb.cash_chips), 0) as chips_in,
                             nvl(sum(trak_tables_memb.cash_out), 0) as chips_out,
                             nvl(sum(trak_tables_memb.bet), 0) as bet,
                             nvl(sum(trak_tables_memb.win), 0) as win,
                             nvl(sum(trak_tables_memb.play_time), 0) as play_time,
                             nvl(sum(trak_tables_memb.actual_loss), 0) as actual_loss_a,
                             nvl(sum(trak_tables_memb.theoret_drop), 0) as theoret_bet,
                             nvl(sum(trak_tables_memb.theoret_loss), 0) as theoret_loss,
                             nvl(sum(trak_tables_memb.act_loss_betwin), 0) as actual_loss_b,
                             nvl(sum(trak_tables_memb.hands_played), 0) as hands_played,
                             -- nvl(avg(trak_tables_memb.avg_bet), 0) as avg_bet
                             round(decode(sum(trak_tables_memb.hands_played),
                                          null,
                                          0,
                                          0,
                                          0,
                                          sum(trak_tables_memb.theoret_drop) /
                                          sum(trak_tables_memb.hands_played)),
                                   2) as avg_bet
                        from logismos.trak_tables_memb trak_tables_memb
                       where trak_tables_memb.gamedate = lvGameDate
                         and trak_tables_memb.table_link = a_table_link
                       group by trak_tables_memb.memb_linkid) trak_tables_memb
              
              ) value_records
      
        join logismos.player_master player_master
          on player_master.link_id = value_records.memb_linkid
        left join logismos.player_photo player_photo
          on player_photo.link_id = player_master.link_id
      
       order by player_master.last_name asc, player_master.first_name asc;
  
  end table_analysis;

  -------------------------------------------------------------------------------------------------------
  procedure casino_analysis(ret_val out sys_refcursor) as
  begin
  
    open ret_val for
      select value_records.*,
             player_master.last_name,
             player_master.first_name,
             
             case
               when player_photo.photo is null then
                (select configuration.default_player_photo
                   from startouch.configuration configuration)
               else
                player_photo.photo
             end as photo,
             
             isNowPlaying(value_records.memb_linkid) as now_playing,
             startouch.api.isBarred(value_records.memb_linkid) as barred,
             membership_types.description as membership_type_descr
      
        from (select trak_tables_memb.memb_linkid,
                     trak_tables_memb.pit_descr,
                     trak_tables_memb.area_descr,
                     trak_tables_memb.table_descr,
                     trak_tables_memb."DROP" as "DROP",
                     trak_tables_memb.drop_plaques as drop_plaques,
                     trak_tables_memb.chips_given as chips_given,
                     trak_tables_memb.chips_in as chips_in,
                     trak_tables_memb.chips_out as chips_out,
                     trak_tables_memb.bet as bet,
                     trak_tables_memb.win as win,
                     trak_tables_memb.play_time as play_time,
                     trak_tables_memb.actual_loss_a as actual_loss_a,
                     trak_tables_memb.actual_loss_b as actual_loss_b,
                     trak_tables_memb.theoret_bet as theoret_bet,
                     trak_tables_memb.theoret_loss as theoret_loss,
                     round(trak_tables_memb.avg_bet, 2) as avg_bet
              
                from (select trak_tables_memb.memb_linkid as memb_linkid,
                             casino_pits.description as pit_descr,
                             casino_areas.description as area_descr,
                             trak_tables_memb.ch_type ||
                             trak_tables_memb.ch_tblno as table_descr,
                             nvl(sum(trak_tables_memb."DROP"), 0) as "DROP",
                             nvl(sum(trak_tables_memb.drop_plaques), 0) as drop_plaques,
                             nvl(sum(trak_tables_memb.chips_given), 0) as chips_given,
                             nvl(sum(trak_tables_memb.cash_chips), 0) as chips_in,
                             nvl(sum(trak_tables_memb.cash_out), 0) as chips_out,
                             nvl(sum(trak_tables_memb.bet), 0) as bet,
                             nvl(sum(trak_tables_memb.win), 0) as win,
                             nvl(sum(trak_tables_memb.play_time), 0) as play_time,
                             nvl(sum(trak_tables_memb.actual_loss), 0) as actual_loss_a,
                             nvl(sum(trak_tables_memb.theoret_drop), 0) as theoret_bet,
                             nvl(sum(trak_tables_memb.theoret_loss), 0) as theoret_loss,
                             nvl(sum(trak_tables_memb.act_loss_betwin), 0) as actual_loss_b,
                             nvl(avg(trak_tables_memb.avg_bet), 0) as avg_bet
                        from logismos.trak_tables_memb trak_tables_memb
                        join starcash.tables tbls
                          on tbls.table_link = trak_tables_memb.table_link
                        join starcash.casino_pits casino_pits
                          on casino_pits.pit_code = trak_tables_memb.ch_pit
                        join starcash.casino_areas casino_areas
                          on casino_areas.area_code =
                             trak_tables_memb.ch_area
                       where trak_tables_memb.gamedate =
                             startouch.api.getGameDate(sysdate)
                       group by trak_tables_memb.memb_linkid,
                                casino_pits.description,
                                casino_areas.description,
                                trak_tables_memb.ch_type ||
                                trak_tables_memb.ch_tblno) trak_tables_memb
              
              ) value_records
      
        join logismos.player_master player_master
          on player_master.link_id = value_records.memb_linkid
        left join logismos.player_photo player_photo
          on player_photo.link_id = player_master.link_id
        left join logismos.membership_types membership_types
          on membership_types.code = player_master.membership_type
      
       order by player_master.last_name asc, player_master.first_name asc;
  
  end casino_analysis;

  /*
  * change unknown player id in all transactions with a_player_link_id (temporary and delayed tracking)
  * calls save_player_guest_trans, saves and clears delayed tracking
  */
  procedure update_and_save_guest_trans(a_unique_player_id in string,
                                        a_player_link_id   in number,
                                        a_user_id          in varchar2,
                                        a_dealer_id        in varchar2) as
  begin
  
    update startouch.bet
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.cashout
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.chipsin
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.chips_given
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.drops
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.drop_plaqs
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.expense
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.wins
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.rolling_bet
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.baccarat_bb
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.baccarat_pb
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.baccarat_t
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.baccarat_bpb
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.baccarat_ppb
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.rolling_return
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.now_playing
       set player_master_link_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.delayed_table_entry
       set pmemberid = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.delayed_expenses
       set pmemberid = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.alerts
       set player_id = a_player_link_id
     where player_unique_id = a_unique_player_id;
  
    update startouch.denomination_tracking
       set player_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    update startouch.undo_buffer
       set player_id = a_player_link_id
     where unique_player_id = a_unique_player_id;
  
    startouch.main.save_player_guest_trans(a_unique_player_id,
                                           upper(a_user_id),
                                           upper(a_dealer_id));
  
  end update_and_save_guest_trans;

  -- saves and clears transactions in delayed tracking
  procedure save_player_guest_trans(a_unique_player_id in varchar2,
                                    a_user_id          in varchar2,
                                    a_dealer_id        in varchar2) as
    dummy        int;
    lvTrackingID int;
  begin
  
    for player in (select *
                     from startouch.delayed_table_entry dte
                    where dte.unique_player_id = a_unique_player_id) loop
    
      begin
        startouch.api.TableEntry(player.pmemberid,
                                 player.psource,
                                 player.ptabletype,
                                 player.ptableid,
                                 player.phands,
                                 player.pfactor,
                                 player.pgamedate,
                                 player.pstarttime,
                                 player.pendtime,
                                 player.pavgbet,
                                 player.pbet,
                                 player.pdrop,
                                 player.pcashout,
                                 player.pcashchips,
                                 player.pcomment,
                                 player.pChipsGiven,
                                 player.pDropPlaques,
                                 player.pWin,
                                 player.promo_chips_bet,
                                 player.promo_chips_given,
                                 player.prollbuy,
                                 player.prollreturn,
                                 upper(a_user_id),
                                 upper(a_dealer_id),
                                 player.tournament_id,
                                 lvTrackingID);
      
        update startouch.denomination_tracking
           set tracking_id = lvTrackingID
         where tracking_id = player.tracking_id;
      
        /*exception
        when starapi.pcg_trak.upd_slot_db_multivenue then
          null;
        when starapi.pcg_trak.updating_slot_db_error then
          null;*/
      end;
    
    end loop;
  
    delete from startouch.delayed_table_entry
     where unique_player_id = a_unique_player_id;
  
    for expense in (select *
                      from startouch.delayed_expenses
                     where unique_player_id = a_unique_player_id) loop
    
      begin
        starapi.pcg_trak.Expense(expense.pmemberid,
                                 expense.pexpensetype,
                                 expense.pgamedate,
                                 expense.pamount,
                                 expense.pcomment,
                                 upper(a_user_id),
                                 dummy);
      
        /*exception
        when starapi.pcg_trak.upd_slot_db_multivenue then
          null;
        when starapi.pcg_trak.updating_slot_db_error then
          null;*/
      end;
    
    end loop;
  
    delete from startouch.delayed_expenses
     where unique_player_id = a_unique_player_id;
  
  end save_player_guest_trans;

  /*
  * Η ΡΟΥΤΙΝΑ ΑΦΟΡΑ ΤΡΑΠΕΖΙ
  *
  * Αποθηκεύει το προσωρινό trak ενός τραπεζιού στο οριστικό.
  * Οι κινήσεις των παικτών που δεν έχουν ταυτοποιηθεί θα "πέσουν" στον παίκτη 'Unknown'.
  * Καλείται στο κλείσιμο του τραπεζιού που γενικά συμβαίνει με το κλείσιμο της εφαρμογής.
  */
  procedure save_table_guest_trans(a_table_link in number,
                                   a_user_id    in varchar2,
                                   a_dealer_id  in varchar2) as
    dummy        int;
    lvTrackingID int;
  begin
  
    for player in (select *
                     from startouch.delayed_table_entry dte
                    where dte.ptableid = a_table_link) loop
    
      begin
        startouch.api.TableEntry(player.pmemberid,
                                 player.psource,
                                 player.ptabletype,
                                 player.ptableid,
                                 player.phands,
                                 player.pfactor,
                                 player.pgamedate,
                                 player.pstarttime,
                                 player.pendtime,
                                 player.pavgbet,
                                 player.pbet,
                                 player.pdrop,
                                 player.pcashout,
                                 player.pcashchips,
                                 player.pcomment,
                                 player.pChipsGiven,
                                 player.pDropPlaques,
                                 player.pWin,
                                 player.promo_chips_bet,
                                 player.promo_chips_given,
                                 player.prollbuy,
                                 player.prollreturn,
                                 upper(a_user_id),
                                 upper(a_dealer_id),
                                 player.tournament_id,
                                 lvTrackingID);
      
        update startouch.denomination_tracking
           set tracking_id = lvTrackingID
         where tracking_id = player.tracking_id;
      
        /*exception
        when starapi.pcg_trak.upd_slot_db_multivenue then
          null;
        when starapi.pcg_trak.updating_slot_db_error then
          null;*/
      end;
    
    end loop;
  
    delete from startouch.delayed_table_entry
     where ptableid = a_table_link;
  
    for expense in (select *
                      from startouch.delayed_expenses
                     where table_link_id = a_table_link) loop
    
      begin
        starapi.pcg_trak.Expense(expense.pmemberid,
                                 expense.pexpensetype,
                                 expense.pgamedate,
                                 expense.pamount,
                                 expense.pcomment,
                                 upper(a_user_id),
                                 dummy);
      
        /*exception
        when starapi.pcg_trak.upd_slot_db_multivenue then
          null;
        when starapi.pcg_trak.updating_slot_db_error then
          null;*/
      end;
    
    end loop;
  
    delete from startouch.delayed_expenses
     where table_link_id = a_table_link;
  
  end save_table_guest_trans;

  -------------------------------------------------------------------------------------------------------
  procedure clear_player_trans(a_unique_player_id in string) as
  begin
  
    delete startouch.bet where unique_player_id = a_unique_player_id;
    delete startouch.cashout where unique_player_id = a_unique_player_id;
    delete startouch.chipsin where unique_player_id = a_unique_player_id;
    delete startouch.chips_given
     where unique_player_id = a_unique_player_id;
    delete startouch.drops where unique_player_id = a_unique_player_id;
    delete startouch.drop_plaqs
     where unique_player_id = a_unique_player_id;
    delete startouch.expense where unique_player_id = a_unique_player_id;
    delete startouch.wins where unique_player_id = a_unique_player_id;
    delete from startouch.delayed_expenses
     where unique_player_id = a_unique_player_id;
    delete from startouch.delayed_table_entry
     where unique_player_id = a_unique_player_id;
    delete from startouch.rolling_bet
     where unique_player_id = a_unique_player_id;
    delete from startouch.baccarat_bb
     where unique_player_id = a_unique_player_id;
    delete from startouch.baccarat_pb
     where unique_player_id = a_unique_player_id;
    delete from startouch.baccarat_t
     where unique_player_id = a_unique_player_id;
    delete from startouch.baccarat_bpb
     where unique_player_id = a_unique_player_id;
    delete from startouch.baccarat_ppb
     where unique_player_id = a_unique_player_id;
    delete from startouch.rolling_return
     where unique_player_id = a_unique_player_id;
  
  end clear_player_trans;

  /*
  * Χρησιμοποιείται κατά το recovery του startouch για να συγχρονίσει τους πελάτες με το νέο game id της εφαρμογής.
  * Δεν είναι πλέον απαραίτητη η χρήση αυτής της procedure γιατί κατά την αποθήκευση των transaction δεν λαμβάνεται
  * υπόψη το game_id. Όσα transaction βρεθούν για τον συγκεκριμένο παίκτη (unique_instance_id) θα περάσουν στο tracking.
  */
  procedure update_player_trans(a_unique_player_id in string,
                                a_game_id          in string) as
  begin
  
    update startouch.bet
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.cashout
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.chipsin
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.chips_given
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.drops
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.drop_plaqs
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.expense
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.wins
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.rolling_bet
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.baccarat_bb
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.baccarat_pb
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.baccarat_t
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.baccarat_bpb
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.baccarat_ppb
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
    update startouch.rolling_return
       set game_id = a_game_id
     where unique_player_id = a_unique_player_id;
  
  end;

  /*
  * Επιστρέφει το id που έχει δοθεί στον unknown player στο configuration ή -1 αν δεν έχει οριστεί.
  */
  function getUnknownPlayerID return int is
    retVal int;
  begin
  
    select c.unkown_player_id into retVal from startouch.configuration c;
  
    return retVal;
  
  exception
    when NO_DATA_FOUND then
      return - 1;
  end getUnknownPlayerID;

  /*
  * Διαγράφει τα δεδομένα όλων των πινάκων του startouch.
  */
  procedure clear_all_trans is
  begin
  
    delete from startouch.bet;
    delete from startouch.cashout;
    delete from startouch.chipsin;
    delete from startouch.chips_given;
    delete from startouch.delayed_expenses;
    delete from startouch.delayed_table_entry;
    delete from startouch.drops;
    delete from startouch.drop_plaqs;
    delete from startouch.expense;
    delete from startouch.float_difference;
    delete from startouch.now_playing;
    delete from startouch.wins;
    delete from startouch.rolling_bet;
    delete from startouch.baccarat_bb;
    delete from startouch.baccarat_pb;
    delete from startouch.baccarat_t;
    delete from startouch.baccarat_bpb;
    delete from startouch.baccarat_ppb;
    delete from startouch.rolling_return;
  
  end clear_all_trans;

  /*
  * Διορθώνει την ημερομηνία αν έχουμε ξεπεράσει την μια ημέρα.
  * Αν aDateTo - aDateFrom > 1 επιστρέφει aDateFrom + 0.1 αλλιώς επιστρέφει aDateTo.
  */
  function fixDateTo(aDateFrom date, aDateTo date) return date is
    retVal date := aDateTo;
  begin
  
    if aDateTo - aDateFrom > 1 then
      retVal := aDateFrom + .1;
    end if;
  
    return retVal;
  
  end;

  -------------------------------------------------------------------------------------------------------
  procedure get_table_alerts(aTableLink in integer,
                             retVal     out sys_refcursor) is
    lvGameDate date := sysdate - 1;
  begin
  
    open retVal for
      select alerts.id,
             alerts.action_type,
             alerts.table_id,
             alerts.player_id,
             player_master.last_name || ' ' || player_master.first_name as player_name,
             alerts.player_unique_id,
             alerts.entered_at,
             alerts.value,
             alerts.entered_by,
             alerts.acknowledged_by,
             alerts.acknowledged_at,
             tbls.table_type || '/' || tbls.table_no as table_name
        from startouch.alerts alerts
        join starcash.tables tbls
          on tbls.table_link = alerts.table_id
        join logismos.player_master player_master
          on player_master.link_id = alerts.player_id
       where alerts.table_id = aTableLink
         and alerts.entered_at > lvGameDate
       order by alerts.id desc;
  
  end get_table_alerts;

  -------------------------------------------------------------------------------------------------------
  procedure get_all_table_alerts(retVal out sys_refcursor) is
    lvFromDate date := sysdate - 1;
  begin
  
    open retVal for
      select alerts.id,
             alerts.action_type,
             alerts.table_id,
             alerts.player_id,
             player_master.last_name || ' ' || player_master.first_name as player_name,
             alerts.player_unique_id,
             alerts.entered_at,
             alerts.value,
             alerts.entered_by,
             alerts.acknowledged_by,
             alerts.acknowledged_at,
             tbls.table_type || '/' || tbls.table_no as table_name
        from startouch.alerts alerts
        join starcash.tables tbls
          on tbls.table_link = alerts.table_id
        join logismos.player_master player_master
          on player_master.link_id = alerts.player_id
       where alerts.entered_at > lvFromDate;
  
  end get_all_table_alerts;

  -------------------------------------------------------------------------------------------------------
  function has_actual_transactions(a_unique_player_id in varchar2) return int is
    retVal int;
  begin
  
    select case
             when exists
              (select 0
                     from startouch.bet t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.drops t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.chipsin t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.cashout t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.wins t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.chips_given t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.drop_plaqs t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.rolling_bet t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.rolling_return t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.baccarat_bb t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.baccarat_pb t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.baccarat_t t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.baccarat_bpb t
                    where t.unique_player_id = a_unique_player_id) or exists
              (select 0
                     from startouch.baccarat_ppb t
                    where t.unique_player_id = a_unique_player_id) then
             
              1
             else
              0
           end
      into retVal
      from dual;
  
    return retVal;
  
  end has_actual_transactions;

  -------------------------------------------------------------------------------------------------------
  function is_time_based(a_table_link int) return int is
    retVal int;
  begin
  
    select case
             when nvl(t.time_based, 0) <> 0 then
              1
             else
              0
           end
      into retVal
      from starcash.tables t
     where t.table_link = a_table_link;
  
    return retVal;
  
  end is_time_based;

  ------------------------------------------------------------------------------------------------------
  function get_guardian_user_id(a_login_name in varchar2) return number is
    ret_val number;
  begin
  
    select user_master.user_link
      into ret_val
      from guardian.user_master user_master
     where upper(user_master.user_id) = upper(a_login_name);
  
    return ret_val;
  
  exception
    when no_data_found then
      return - 1;
    
  end get_guardian_user_id;

  -------------------------------------------------------------------------------------------------------
  function is_user_authenticated(a_user_id  in number,
                                 a_app_name in varchar2,
                                 a_auth_key in varchar2) return number is
    ret_val number;
  begin
  
    select count(0)
      into ret_val
      from guardian.tasks_users tu
     where tu.app_name = a_app_name
       and tu.task_name in (a_auth_key)
       and tu.task_privileges = 15
       and tu.user_link = a_user_id;
  
    if ret_val = 0 then
    
      select count(0)
        into ret_val
        from guardian.tasks_groups tg
        join guardian.group_master gm
          on gm.group_link = tg.group_link
        join guardian.users_groups ug
          on ug.group_link = tg.group_link
       where tg.app_name = a_app_name
         and tg.task_name in (a_auth_key)
         and tg.task_privileges = 15
         and ug.user_link = a_user_id;
    
    end if;
  
    if ret_val <> 0 then
      ret_val := a_user_id;
    else
      ret_val := -1;
    end if;
  
    return ret_val;
  
  end is_user_authenticated;

  -------------------------------------------------------------------------------------------------------
  function is_user_authenticated(a_login_name in varchar2,
                                 a_app_name   in varchar2,
                                 a_auth_key   in varchar2) return number is
  begin
    return is_user_authenticated(get_guardian_user_id(upper(a_login_name)),
                                 a_app_name,
                                 a_auth_key);
  end;

  -------------------------------------------------------------------------------------------------------
  procedure add_denomination_tracking(a_table_link          in number,
                                      a_key                 in startouch.denomination_tracking.denom_key%type,
                                      a_value               in startouch.denomination_tracking.denom_value%type,
                                      a_unique_player_id    in startouch.denomination_tracking.unique_player_id%type,
                                      a_player_id           in startouch.denomination_tracking.player_id%type,
                                      a_transaction_type_id in startouch.denomination_tracking.transaction_type_id%type,
                                      a_game_id             in startouch.denomination_tracking.game_id%type,
                                      a_tracking_id         in startouch.denomination_tracking.tracking_id%type,
                                      a_gamedate            in date,
                                      a_user_id             in guardian.user_master.user_id%type) as
    lvGameDate date;
    lvUserID   number;
  begin
  
    begin
      select t.user_link
        into lvUserID
        from guardian.user_master t
       where upper(t.user_id) = upper(a_user_id);
    exception
      when others then
        if abs(SQLCODE) = 1403 then
          null;
        end if;
    end;
  
    if a_gamedate is not null then
      lvGameDate := a_gamedate;
    elsif a_table_link >= 0 then
      lvGameDate := api.getTableGameDate(a_table_link);
    else
      lvGameDate := api.GetGameDate(sysdate);
    end if;
  
    -- no need to use a_table_link in where statement because a_unique_player_id is guaranteed to be unique across tables
    update startouch.denomination_tracking
       set denom_value = denom_value + a_value, entered_at = sysdate
     where game_date = lvGameDate
       and denom_key = a_key
       and unique_player_id = a_unique_player_id
       and transaction_type_id = a_transaction_type_id
       and nvl(user_id, -1) = nvl(lvUserID, -1);
  
    if SQL%ROWCOUNT < 1 then
      insert into startouch.denomination_tracking
        (table_link,
         denom_key,
         denom_value,
         entered_at,
         game_date,
         unique_player_id,
         player_id,
         transaction_type_id,
         game_id,
         user_id)
      values
        (a_table_link,
         a_key,
         a_value,
         sysdate,
         lvGameDate,
         a_unique_player_id,
         a_player_id,
         a_transaction_type_id,
         a_game_id,
         lvUserID);
    
      if a_tracking_id is not null then
      
        update startouch.denomination_tracking
           set tracking_id = a_tracking_id
         where unique_player_id = a_unique_player_id;
      
      end if;
    
    end if;
  
  end add_denomination_tracking;

  -------------------------------------------------------------------------------------------------------
  procedure add_denomination_tracking(a_table_link          in number,
                                      a_key                 in startouch.denomination_tracking.denom_key%type,
                                      a_value               in startouch.denomination_tracking.denom_value%type,
                                      a_unique_player_id    in startouch.denomination_tracking.unique_player_id%type,
                                      a_player_id           in startouch.denomination_tracking.player_id%type,
                                      a_transaction_type_id in startouch.denomination_tracking.transaction_type_id%type,
                                      a_game_id             in startouch.denomination_tracking.game_id%type,
                                      a_tracking_id         in startouch.denomination_tracking.tracking_id%type,
                                      a_gamedate            in date) as
  begin
  
    startouch.main.add_denomination_tracking(a_table_link,
                                             a_key,
                                             a_value,
                                             a_unique_player_id,
                                             a_player_id,
                                             a_transaction_type_id,
                                             a_game_id,
                                             a_tracking_id,
                                             a_gamedate,
                                             null);
  
  end add_denomination_tracking;

  -------------------------------------------------------------------------------------------------------
  procedure add_denomination_tracking(a_table_link          in number,
                                      a_key                 in startouch.denomination_tracking.denom_key%type,
                                      a_value               in startouch.denomination_tracking.denom_value%type,
                                      a_unique_player_id    in startouch.denomination_tracking.unique_player_id%type,
                                      a_player_id           in startouch.denomination_tracking.player_id%type,
                                      a_transaction_type_id in startouch.denomination_tracking.transaction_type_id%type,
                                      a_game_id             in startouch.denomination_tracking.game_id%type,
                                      a_tracking_id         in startouch.denomination_tracking.tracking_id%type) as
  begin
  
    startouch.main.add_denomination_tracking(a_table_link,
                                             a_key,
                                             a_value,
                                             a_unique_player_id,
                                             a_player_id,
                                             a_transaction_type_id,
                                             a_game_id,
                                             a_tracking_id,
                                             null,
                                             null);
  
  end add_denomination_tracking;

  -------------------------------------------------------------------------------------------------------
  procedure next_sequence_id_sp(a_table_name in varchar2,
                                a_increment  in int,
                                a_next_id    out number) is
  begin
  
    --lock table startouch.sequence in exclusive mode;
  
    update startouch.sequence
       set next_id = next_id
     where table_name = 'RECORD_LOCK';
  
    update startouch.sequence
       set next_id = next_id + a_increment
     where table_name = a_table_name;
  
    if SQL%ROWCOUNT < 1 then
    
      insert into startouch.sequence
        (table_name, next_id)
        select a_table_name, a_increment from dual;
    
    end if;
  
    select next_id
      into a_next_id
      from startouch.sequence
     where table_name = a_table_name;
  
  end next_sequence_id_sp;

  /*
  * a_denomination_types == 1 -> transaction_type 1..7
  * a_denomination_types == 2 -> transaction_type 8..9
  */
  -------------------------------------------------------------------------------------------------------
  procedure get_denomination_tracking(a_player_id          in startouch.denomination_tracking.player_id%type,
                                      a_game_date_from     in startouch.denomination_tracking.game_date%type,
                                      a_game_date_to       in startouch.denomination_tracking.game_date%type,
                                      a_denomination_types in int,
                                      table_output         out sys_refcursor) is
  begin
  
    open table_output for
      select transaction_type.description      as tt_descr,
             transaction_type.column_order     as tt_column_order,
             denomination_tracking.denom_key,
             denoms.description2               as denom_key_ext,
             denomination_tracking.denom_value,
             denoms.value                      as denom_value_ext,
             denoms.currency_code,
             denomination_tracking.game_id
        from startouch.denomination_tracking denomination_tracking
        join startouch.transaction_type transaction_type
          on transaction_type.id =
             denomination_tracking.transaction_type_id
        join starcash.denoms denoms
          on denoms.denom_code = denomination_tracking.denom_key
       where denomination_tracking.player_id = a_player_id
         and denomination_tracking.game_date between a_game_date_from and
             a_game_date_to
         and ((a_denomination_types = 1 and
             denomination_tracking.transaction_type_id not in (8, 9)) or
             (a_denomination_types = 2 and
             denomination_tracking.transaction_type_id in (8, 9)));
  
  end get_denomination_tracking;

  -------------------------------------------------------------------------------------------------------
  procedure players_ex_sp(a_player_id             in logismos.player_master.link_id%type,
                          a_first_name            in logismos.player_master.first_name%type,
                          a_last_name             in logismos.player_master.last_name%type,
                          a_fathers_name          in logismos.player_master.fathers_name%type,
                          a_card_number           in logismos.player_master.card_number%type,
                          a_id_type               in logismos.player_master.id_type%type,
                          a_id_number             in logismos.player_master.id_number%type,
                          a_birth_date            in logismos.player_master.birth_date%type,
                          a_country_code          in logismos.player_master.country_code%type,
                          a_use_yesterday_players in int,
                          ret_val                 out sys_refcursor) is
    lvYesterday date;
    tmpPlayerID int;
  begin
  
    if (a_use_yesterday_players = 1) then
    
      lvYesterday := api.getGameDate(sysdate) - 1;
    
      delete startouch.tmp_table1;
    
      insert into startouch.tmp_table1
        (id)
        select distinct player_detail.link_id
          from logismos.player_detail player_detail
         where player_detail.trans_date >= lvYesterday
           and player_detail.description_code in
               (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74);
    
      open ret_val for
        select pm.link_id,
               pm.first_name,
               pm.last_name,
               pm.fathers_name,
               pm.card_number,
               pm.country_code,
               pm.birth_date,
               pm.id_type,
               pm.id_number,
               pm.inactive,
               nvl(player_photo.photo, configuration.default_player_photo) as photo,
               api.isBarred(pm.link_id) as barred,
               countries.country,
               startouch.getLTDCredit(pm.link_id) as ltd_credit,
               startouch.getLTDDiscount(pm.link_id) as ltd_discount
          from logismos.player_master pm
          join startouch.tmp_table1 t1
            on t1.id = pm.link_id
          left join logismos.player_photo player_photo
            on player_photo.link_id = pm.link_id
          left join logismos.countries countries
            on countries.code = pm.country_code
         cross join startouch.configuration configuration
         where pm.card_number is not null
           and upper(nvl(pm.inactive, 'N')) = 'N'
           and (a_last_name is null or
               upper(pm.last_name) like upper(a_last_name) || '%')
           and (a_first_name is null or
               upper(pm.first_name) like upper(a_first_name) || '%')
           and (a_card_number is null or pm.card_number = a_card_number or
               exists (select 0
                         from logismos.player_addcards ac
                        where ac.link_id = pm.link_id
                          and ac.add_status = 'A'
                          and ac.add_card = a_card_number))
           and (a_player_id is null or pm.link_id = a_player_id)
           and (a_fathers_name is null or
               upper(pm.fathers_name) like upper(a_fathers_name) || '%')
           and (a_id_type is null or pm.id_type = a_id_type)
           and (a_id_number is null or pm.id_number = a_id_number)
           and (a_birth_date is null or
               trunc(pm.birth_date) = trunc(a_birth_date))
           and (a_country_code is null or pm.country_code = a_country_code)
         order by (select max(player_detail.trans_date)
                     from logismos.player_detail player_detail
                    where player_detail.link_id = pm.link_id) desc;
    
      return;
    
    end if;
  
    -- card number
    if a_card_number is not null then
    
      begin
        select pm.link_id
          into tmpPlayerID
          from logismos.player_master pm
         where pm.card_number = a_card_number
           and (pm.inactive = 'N' or pm.inactive is null);
      exception
        when no_data_found then
          tmpPlayerID := null;
      end;
    
      if tmpPlayerID is null then
        begin
          select ac.link_id
            into tmpPlayerID
            from logismos.player_addcards ac
           where ac.add_card = a_card_number
             and ac.add_status = 'A';
        exception
          when no_data_found then
            tmpPlayerID := null;
        end;
      end if;
    
      open ret_val for
        select *
          from (select pm.link_id,
                       pm.first_name,
                       pm.last_name,
                       pm.fathers_name,
                       pm.card_number,
                       pm.country_code,
                       pm.birth_date,
                       pm.id_type,
                       pm.id_number,
                       pm.inactive,
                       nvl(player_photo.photo,
                           configuration.default_player_photo) as photo,
                       api.isBarred(pm.link_id) as barred,
                       countries.country,
                       startouch.getLTDCredit(pm.link_id) as ltd_credit,
                       startouch.getLTDDiscount(pm.link_id) as ltd_discount
                  from logismos.player_master pm
                  left join logismos.player_photo player_photo
                    on player_photo.link_id = pm.link_id
                  left join logismos.countries countries
                    on countries.code = pm.country_code
                 cross join startouch.configuration configuration
                 where pm.link_id = tmpPlayerID)
         where (a_last_name is null or
               upper(last_name) like upper(a_last_name) || '%')
           and (a_first_name is null or
               upper(first_name) like upper(a_first_name) || '%')
           and (a_player_id is null or link_id = a_player_id)
           and (a_fathers_name is null or
               upper(fathers_name) like upper(a_fathers_name) || '%')
           and (a_id_type is null or id_type = a_id_type)
           and (a_id_number is null or id_number = a_id_number)
           and (a_birth_date is null or
               trunc(birth_date) = trunc(a_birth_date))
           and (a_country_code is null or country_code = a_country_code);
    
      return;
    
    end if;
  
    -- last name
    if a_last_name is not null then
    
      open ret_val for
        select *
          from (select pm.link_id,
                       pm.first_name,
                       pm.last_name,
                       pm.fathers_name,
                       pm.card_number,
                       pm.country_code,
                       pm.birth_date,
                       pm.id_type,
                       pm.id_number,
                       pm.inactive,
                       nvl(player_photo.photo,
                           configuration.default_player_photo) as photo,
                       api.isBarred(pm.link_id) as barred,
                       countries.country,
                       startouch.getLTDCredit(pm.link_id) as ltd_credit,
                       startouch.getLTDDiscount(pm.link_id) as ltd_discount
                  from logismos.player_master pm
                  left join logismos.player_photo player_photo
                    on player_photo.link_id = pm.link_id
                  left join logismos.countries countries
                    on countries.code = pm.country_code
                 cross join startouch.configuration configuration
                 where upper(pm.last_name) like upper(a_last_name) || '%')
         where card_number is not null
           and upper(nvl(inactive, 'N')) = 'N'
           and (a_first_name is null or
               upper(first_name) like upper(a_first_name) || '%')
           and (a_card_number is null or card_number = a_card_number or
               exists (select 0
                         from logismos.player_addcards ac
                        where ac.link_id = link_id
                          and ac.add_status = 'A'
                          and ac.add_card = a_card_number))
           and (a_player_id is null or link_id = a_player_id)
           and (a_fathers_name is null or
               upper(fathers_name) like upper(a_fathers_name) || '%')
           and (a_id_type is null or id_type = a_id_type)
           and (a_id_number is null or id_number = a_id_number)
           and (a_birth_date is null or
               trunc(birth_date) = trunc(a_birth_date))
           and (a_country_code is null or country_code = a_country_code);
    
      return;
    
    end if;
  
    if a_player_id is null and a_first_name is null and
       a_fathers_name is null and a_id_type is null and a_id_number is null and
       a_birth_date is null and a_country_code is null then
    
      raise_application_error(-20100, 'Empty filter!');
    
    end if;
  
    open ret_val for
      select pm.link_id,
             pm.first_name,
             pm.last_name,
             pm.fathers_name,
             pm.card_number,
             pm.country_code,
             pm.birth_date,
             pm.id_type,
             pm.id_number,
             pm.inactive,
             nvl(player_photo.photo, configuration.default_player_photo) as photo,
             api.isBarred(pm.link_id) as barred,
             countries.country,
             startouch.getLTDCredit(pm.link_id) as ltd_credit,
             startouch.getLTDDiscount(pm.link_id) as ltd_discount
        from logismos.player_master pm
        left join logismos.player_photo player_photo
          on player_photo.link_id = pm.link_id
        left join logismos.countries countries
          on countries.code = pm.country_code
       cross join startouch.configuration configuration
       where pm.card_number is not null
         and upper(nvl(pm.inactive, 'N')) = 'N'
         and (a_last_name is null or
             upper(pm.last_name) like upper(a_last_name) || '%')
         and (a_first_name is null or
             upper(pm.first_name) like upper(a_first_name) || '%')
         and (a_card_number is null or pm.card_number = a_card_number or
             exists (select 0
                       from logismos.player_addcards ac
                      where ac.link_id = pm.link_id
                        and ac.add_status = 'A'
                        and ac.add_card = a_card_number))
         and (a_player_id is null or pm.link_id = a_player_id)
         and (a_fathers_name is null or
             upper(pm.fathers_name) like upper(a_fathers_name) || '%')
         and (a_id_type is null or pm.id_type = a_id_type)
         and (a_id_number is null or pm.id_number = a_id_number)
         and (a_birth_date is null or
             trunc(pm.birth_date) = trunc(a_birth_date))
         and (a_country_code is null or pm.country_code = a_country_code);
  
  end players_ex_sp;

  /*
  * Αλλάζει το έτος της ημερομηνίας σε a_year
  */
  function setDateYear(a_date date, a_year varchar2) return date is
  begin
  
    if a_date is null then
      return null;
    else
      return to_date(to_char(a_date, 'DDMM') || a_year, 'DDMMYYYY');
    end if;
  
  end setDateYear;

  /*
  * Αλλάζει το έτος της ημερομηνίας σε a_year
  */
  -------------------------------------------------------------------------------------------------------
  function setDateYear(a_date date, a_year int) return date is
  begin
    return setDateYear(a_date, to_char(a_year));
  end setDateYear;

  /*
  * Αλλάζει το έτος της ημερομηνίας σε 2000
  */
  -------------------------------------------------------------------------------------------------------
  function clearDateYear(a_date date) return date is
  begin
    return setDateYear(a_date, '2000');
  end clearDateYear;

  -------------------------------------------------------------------------------------------------------
  function getTableGameDate(a_table_id in int, a_date in date) return date is
  begin
  
    return api.GetTableGameDate(a_table_id);
  
  end GetTableGameDate;

  -------------------------------------------------------------------------------------------------------
  function getJunketOperator(a_game_date date, a_player_id int) return int is
    retVal number;
  begin
  
    select t.oper_code
      into retVal
      from (select o.oper_code
              from logismos.tour_operators o
              join logismos.junkets j
                on j.oper_code = o.oper_code
              join logismos.junket_detail jd
                on jd.junk_code = j.junk_code
              join logismos.player_detail pd
                on pd.trans_number = jd.trans_number
             where pd.link_id = a_player_id
               and pd.gamedate = a_game_date
               and pd.description_code in
                   (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74)
             order by pd.trans_number desc) t
     where rownum = 1;
  
    return retVal;
  
  exception
    when no_data_found then
      return null;
  end getJunketOperator;

  -------------------------------------------------------------------------------------------------------
  procedure get_junket_and_operator(a_player_id int,
                                    a_ret_val   out sys_refcursor) is
  begin
  
    open a_ret_val for
      select t.junk_code, t.junk_descr, t.oper_code, t.oper_name
        from (select j.junk_code, j.junk_descr, o.oper_code, o.oper_name
                from logismos.tour_operators o
                join logismos.junkets j
                  on j.oper_code = o.oper_code
                join logismos.junket_detail jd
                  on jd.junk_code = j.junk_code
                join logismos.player_detail pd
                  on pd.trans_number = jd.trans_number
               where pd.link_id = a_player_id
                 and pd.gamedate = api.getGameDate(sysdate)
                 and pd.description_code in
                     (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74)
               order by pd.trans_number desc) t
       where rownum = 1;
  
  end get_junket_and_operator;

  -------------------------------------------------------------------------------------------------------
  function hasVisitAfterDate(a_customer_id int, a_after date) return number is
    retVal number;
  begin
  
    select count(0)
      into retVal
      from logismos.player_master player_master
      join logismos.player_detail player_detail
        on player_detail.link_id = player_master.link_id
     where player_master.link_id = a_customer_id
       and player_detail.description_code in
           (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74, 93)
       and player_detail.gamedate >= api.getGameDate(a_after);
  
    return case when retVal > 0 then 1 else 0 end;
  
  end hasVisitAfterDate;

  -------------------------------------------------------------------------------------------------------
  function isTrackedAfterDate(a_customer_id int, a_after date) return number is
    retVal number;
  begin
  
    select (select count(0)
              from logismos.trak_stats trak_stats
             where trak_stats.memb_linkid = a_customer_id
               and trak_stats.gamedate >= api.getGameDate(a_after)) +
           (select count(0)
              from logismos.trak_stats_sl trak_stats_sl
             where trak_stats_sl.memb_linkid = a_customer_id
               and trak_stats_sl.gamedate >= api.getGameDate(a_after))
      into retVal
      from dual;
  
    return case when retVal > 0 then 1 else 0 end;
  
  end isTrackedAfterDate;

  -------------------------------------------------------------------------------------------------------
  function isCheckedOut(a_customer_id int) return number is
    lv_checkout_id string(4000);
    retVal         number;
  begin
  
    select t.checkout_id
      into lv_checkout_id
      from startouch.configuration t;
  
    select count(0)
      into retVal
      from logismos.player_detail player_detail
     where player_detail.link_id = a_customer_id
       and player_detail.gamedate = api.getGameDate(sysdate)
       and player_detail.description_code in
           (select * from table(splitInt(nvl(lv_checkout_id, ''))));
  
    return case when retVal > 0 then 1 else 0 end;
  
  end isCheckedOut;

  -------------------------------------------------------------------------------------------------------
  function isTrackedToday(a_customer_id int) return number is
  begin
  
    return isTrackedAfterDate(a_customer_id, sysdate);
  
  end isTrackedToday;

  -- following index must be present for optimal performance
  -- CREATE INDEX LOGISMOS.CASE_INSENSITIVE_IDX ON LOGISMOS.PLAYER_MASTER (UPPER(LAST_NAME), CARD_NUMBER, INACTIVE);
  -------------------------------------------------------------------------------------------------------
  procedure players_sp(table_output      out sys_refcursor,
                       a_first_name      in logismos.player_master.first_name%type,
                       a_last_name       in logismos.player_master.last_name%type,
                       a_card_number     in logismos.player_master.card_number%type,
                       a_membership_type in logismos.player_master.membership_type%type,
                       a_sex             in logismos.player_master.sex%type,
                       a_days_elapsed    in integer) is
    lvStartDate       date := sysdate - 77777;
    lvLimitedDataSet  boolean := false;
    lvRowNum          number;
    lvSortDate        number := null;
    lvUnkwnowPlayerID number;
    lvNowGameDate     date := api.getGameDate(sysdate);
  begin
  
    begin
      select configuration.unkown_player_id
        into lvUnkwnowPlayerID
        from startouch.configuration configuration;
    exception
      when no_data_found then
        lvUnkwnowPlayerID := -1;
    end;
  
    if (a_days_elapsed >= 0) then
      lvStartDate := api.getGameDate(sysdate) - a_days_elapsed;
    end if;
  
    delete startouch.tmp_table1;
  
    if a_days_elapsed >= 0 and a_card_number is not null then
    
      insert into startouch.tmp_table1
        (id)
        select player_master.link_id
          from logismos.player_master player_master
         where player_master.card_number = a_card_number
           and (player_master.inactive = 'N' or
               player_master.inactive is null)
           and hasVisitAfterDate(player_master.link_id, lvStartDate) = 1;
    
      select count(0) into lvRowNum from startouch.tmp_table1;
    
      if (lvRowNum = 0) then
        insert into startouch.tmp_table1
          (id)
          select distinct player_addcards.link_id
            from logismos.player_addcards player_addcards
            join logismos.player_master player_master
              on player_master.link_id = player_addcards.link_id
           where player_addcards.add_card = a_card_number
             and player_addcards.add_status = 'A'
             and (player_master.inactive = 'N' or
                 player_master.inactive is null)
             and hasVisitAfterDate(player_addcards.link_id, lvStartDate) = 1;
      
      end if;
    
      lvLimitedDataSet := true;
    
    elsif a_days_elapsed = -2 and a_card_number is not null then
    
      insert into startouch.tmp_table1
        (id)
        select player_master.link_id
          from logismos.player_master player_master
         where player_master.card_number = a_card_number
           and (player_master.inactive = 'N' or
               player_master.inactive is null)
           and isTrackedToday(player_master.link_id) = 1;
    
      select count(0) into lvRowNum from startouch.tmp_table1;
    
      if (lvRowNum = 0) then
        insert into startouch.tmp_table1
          (id)
          select distinct player_addcards.link_id
            from logismos.player_addcards player_addcards
            join logismos.player_master player_master
              on player_master.link_id = player_addcards.link_id
           where player_addcards.add_card = a_card_number
             and player_addcards.add_status = 'A'
             and (player_master.inactive = 'N' or
                 player_master.inactive is null)
             and isTrackedToday(player_addcards.link_id) = 1;
      
      end if;
    
      lvLimitedDataSet := true;
    
    elsif a_card_number is not null then
    
      insert into startouch.tmp_table1
        (id)
        select player_master.link_id
          from logismos.player_master player_master
         where player_master.card_number = a_card_number
           and (player_master.inactive = 'N' or
               player_master.inactive is null);
    
      select count(0) into lvRowNum from startouch.tmp_table1;
    
      if (lvRowNum = 0) then
        insert into startouch.tmp_table1
          (id)
          select distinct logismos.player_addcards.link_id
            from logismos.player_addcards
           where logismos.player_addcards.add_card = a_card_number
             and logismos.player_addcards.add_status = 'A';
      end if;
    
      lvLimitedDataSet := true;
    
    elsif a_days_elapsed >= 0 then
    
      insert into startouch.tmp_table1
        (id)
        select distinct pd.link_id
          from logismos.player_detail pd
          join logismos.player_master pm
            on pm.link_id = pd.link_id
         where pd.trans_date >= lvStartDate
           and pm.card_number is not null
           and (pm.inactive = 'N' or pm.inactive is null)
           and pd.description_code in
               (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74, 93);
    
      lvLimitedDataSet := true;
      lvSortDate       := 1;
    
    elsif a_days_elapsed = -2 then
    
      insert into startouch.tmp_table1
        (id)
        select player_master.link_id
          from logismos.player_master player_master
          join logismos.trak_stats trak_stats
            on trak_stats.memb_linkid = player_master.link_id
         where trak_stats.gamedate >= lvNowGameDate
           and (player_master.inactive = 'N' or
               player_master.inactive is null)
        union
        select player_master.link_id
          from logismos.player_master player_master
          join logismos.trak_stats_sl trak_stats_sl
            on trak_stats_sl.memb_linkid = player_master.link_id
         where trak_stats_sl.gamedate >= lvNowGameDate
           and (player_master.inactive = 'N' or
               player_master.inactive is null);
    
      lvLimitedDataSet := true;
      lvSortDate       := 1;
    
    elsif a_last_name is not null then
    
      insert into startouch.tmp_table1
        (id)
        select pm.link_id
          from logismos.player_master pm
         where upper(pm.last_name) like upper(a_last_name) || '%'
           and pm.card_number is not null
           and (pm.inactive = 'N' or pm.inactive is null);
    
      lvLimitedDataSet := true;
    
    end if;
  
    if a_days_elapsed = 0 then
    
      delete startouch.tmp_table1 where isCheckedOut(id) = 1;
    
    end if;
  
    if lvLimitedDataSet then
    
      open table_output for
        select t2.*
          from (select pm.link_id,
                       pm.first_name,
                       pm.last_name,
                       pm.card_number,
                       nvl(pph.photo, ssph.default_player_photo) as photo,
                       null as membership_type_descr,
                       0 as barred
                  from logismos.player_master pm
                  left join logismos.player_photo pph
                    on pph.link_id = pm.link_id
                 cross join startouch.configuration ssph
                 where pm.link_id =
                       (select t.unkown_player_id
                          from startouch.configuration t)
                
                union all
                
                select pm.link_id,
                       pm.first_name,
                       pm.last_name,
                       pm.card_number,
                       nvl(pph.photo, ssph.default_player_photo) as photo,
                       membership_types.description as membership_type_descr,
                       api.isBarred(pm.link_id) as barred
                  from startouch.tmp_table1 tmp_table1
                  join logismos.player_master pm
                    on pm.link_id = tmp_table1.id
                  left join logismos.membership_types membership_types
                    on membership_types.code = pm.membership_type
                  left join logismos.player_photo pph
                    on pph.link_id = pm.link_id
                 cross join startouch.configuration ssph
                 where pm.card_number is not null
                   and nvl(pm.inactive, 'N') <> 'Y'
                   and (a_membership_type is null or
                       pm.membership_type = a_membership_type)
                   and (a_sex is null or pm.sex = a_sex)
                   and (a_first_name is null or
                       upper(pm.first_name) like upper(a_first_name) || '%')
                   and (a_last_name is null or
                       upper(pm.last_name) like upper(a_last_name) || '%')) t2
         where rownum <=
               (select nvl(t.row_limit, 100) from startouch.configuration t)
         order by case
                    when lvSortDate is not null then
                     case
                       when t2.link_id = lvUnkwnowPlayerID then
                        sysdate + 1
                       else
                        (select max(player_detail.trans_date)
                           from logismos.player_detail player_detail
                          where player_detail.link_id = t2.link_id
                            and player_detail.description_code in (10,
                                                                   11,
                                                                   21,
                                                                   22,
                                                                   23,
                                                                   41,
                                                                   42,
                                                                   43,
                                                                   71,
                                                                   72,
                                                                   73,
                                                                   74,
                                                                   93))
                     end
                    else
                     null
                  end desc;
    
    else
    
      if a_membership_type is not null or a_sex is not null or
         a_first_name is not null then
      
        open table_output for
          select *
            from (select pm.link_id,
                         pm.first_name,
                         pm.last_name,
                         pm.card_number,
                         nvl(pph.photo, ssph.default_player_photo) as photo,
                         null as membership_type_descr,
                         0 as barred
                    from logismos.player_master pm
                    left join logismos.player_photo pph
                      on pph.link_id = pm.link_id
                   cross join startouch.configuration ssph
                   where pm.link_id =
                         (select t.unkown_player_id
                            from startouch.configuration t)
                  
                  union all
                  
                  select pm.link_id,
                         pm.first_name,
                         pm.last_name,
                         pm.card_number,
                         nvl(pph.photo, ssph.default_player_photo) as photo,
                         membership_types.description as membership_type_descr,
                         api.isBarred(pm.link_id) as barred
                    from logismos.player_master pm
                    left join logismos.membership_types membership_types
                      on membership_types.code = pm.membership_type
                    left join logismos.player_photo pph
                      on pph.link_id = pm.link_id
                   cross join startouch.configuration ssph
                   where pm.card_number is not null
                     and nvl(pm.inactive, 'N') <> 'Y'
                     and (a_membership_type is null or
                         pm.membership_type = a_membership_type)
                     and (a_sex is null or pm.sex = a_sex)
                     and (a_first_name is null or upper(pm.first_name) like
                         upper(a_first_name) || '%'))
           where rownum <= (select nvl(t.row_limit, 100)
                              from startouch.configuration t);
      
      else
      
        open table_output for
          select pm.link_id,
                 pm.first_name,
                 pm.last_name,
                 pm.card_number,
                 nvl(pph.photo, ssph.default_player_photo) as photo,
                 null as membership_type_descr,
                 'N' as barred
            from logismos.player_master pm
            left join logismos.player_photo pph
              on pph.link_id = pm.link_id
           cross join startouch.configuration ssph
           where pm.link_id =
                 (select t.unkown_player_id from startouch.configuration t);
      
      end if;
    
    end if;
  
  end players_sp;

  -------------------------------------------------------------------------------------------------------
  procedure initTableRequest(pTransName      in string,
                             pTableID        in int,
                             pRqstCode       out int,
                             a_denominations out sys_refcursor) is
  begin
  
    starapi.pcg_trak.InitTableRequest(pTransName, pTableID, pRqstCode);
  
    open a_denominations for
      select request_monitor_temp.rqst_code,
             request_monitor_temp.denom_code,
             request_monitor_temp.denom_qty_1st,
             request_monitor_temp.denom_qty_2nd,
             request_monitor_temp.denom_value,
             request_monitor_temp.denom_descr1,
             request_monitor_temp.denom_descr2
        from starcash.request_monitor_temp request_monitor_temp
        left join starcash.denoms denoms
          on denoms.denom_code = request_monitor_temp.denom_code
        left join startouch.tmp_currency_order tmp_currency_order
          on tmp_currency_order.currency_code = denoms.currency_code
       where request_monitor_temp.rqst_code = pRqstCode
       order by nvl(tmp_currency_order.sort_order, 1),
                denoms.currency_code,
                request_monitor_temp.denom_value desc;
  
  end initTableRequest;

  -------------------------------------------------------------------------------------------------------
  procedure doTableRequest(pTransName  in string,
                           pTableID    in int,
                           pRqstCode   in int,
                           pRqstTotal  in float,
                           pRqstNoGame in string,
                           pUserID     in string,
                           pAuthID1    in string,
                           pAuthID2    in string,
                           pCompName   in string) is
  begin
  
    starapi.pcg_trak.DoTableRequest(pTransName,
                                    pTableID,
                                    pRqstCode,
                                    pRqstTotal,
                                    pRqstNoGame,
                                    upper(pUserID),
                                    pAuthID1,
                                    pAuthID2,
                                    pCompName);
  
  end doTableRequest;

  /*
  ttOpenfloat = 1,
  ttFillCredit = 2,
  ttChipExchange = 3,
  ttClosingChipFill = 4,
  ttClosingChipCredit = 5
  */
  -------------------------------------------------------------------------------------------------------
  procedure get_fill_denominations(a_tranfer_type   in int,
                                   a_transaction_id in int,
                                   a_denominations  out sys_refcursor) is
  begin
  
    if a_tranfer_type = 1 then
      -- ttFill
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1     as denom_descr,
               d.value            as denom_value,
               t.qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.fills_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 2 then
      -- ttCredit
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1 as denom_descr,
               d.value as denom_value,
               t.qty_of_denom * -1 as qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.fills_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 3 then
      -- ttClosingChipFill
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1     as denom_descr,
               d.value            as denom_value,
               t.qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.chip_fills_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 4 then
      -- ttClosingChipCredit
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1     as denom_descr,
               d.value            as denom_value,
               t.qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.chip_credits_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 5 then
      -- ttChipExchangeFill
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1         as denom_descr,
               d.value                as denom_value,
               t.out_qty_of_denom     as qty_of_denom,
               t.rfid_out_transfer_id as rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_out_start_qty   as rfid_start_qty,
               t.rfid_out_end_qty     as rfid_end_qty,
               t.rfid_out_cancel_qty  as rfid_cancel_qty,
               t.rfid_currency
          from starcash.chips_exchange_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 6 then
      -- ttChipExchangeCredit
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1        as denom_descr,
               d.value               as denom_value,
               t.in_qty_of_denom     as qty_of_denom,
               t.rfid_in_transfer_id as rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_in_start_qty   as rfid_start_qty,
               t.rfid_in_end_qty     as rfid_end_qty,
               t.rfid_in_cancel_qty  as rfid_cancel_qty,
               t.rfid_currency
          from starcash.chips_exchange_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 7 then
      -- ttRejectedCredit
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1 as denom_descr,
               d.value as denom_value,
               t.qty_of_denom * -1 as qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.fills_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 8 then
      -- ttRejectChipClosingCredit
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1     as denom_descr,
               d.value            as denom_value,
               t.qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.chip_credits_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    elsif a_tranfer_type = 9 then
      -- ttRejectedChipExchangeCredit
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1        as denom_descr,
               d.value               as denom_value,
               t.in_qty_of_denom     as qty_of_denom,
               t.rfid_in_transfer_id as rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_in_start_qty   as rfid_start_qty,
               t.rfid_in_end_qty     as rfid_end_qty,
               t.rfid_in_cancel_qty  as rfid_cancel_qty,
               t.rfid_currency
          from starcash.chips_exchange_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
          left join startouch.tmp_currency_order tmp_currency_order
            on tmp_currency_order.currency_code = d.currency_code
         where t.trans_code = a_transaction_id
         order by nvl(tmp_currency_order.sort_order, 1),
                  d.currency_code,
                  d.value desc;
    
    else
      -- for visual studio designer
    
      open a_denominations for
        select t.trans_code,
               t.denom_code,
               d.description1     as denom_descr,
               d.value            as denom_value,
               t.qty_of_denom,
               t.rfid_transfer_id,
               t.rfid_chipset,
               t.rfid_denom,
               t.rfid_start_qty,
               t.rfid_end_qty,
               t.rfid_cancel_qty,
               t.rfid_currency
          from starcash.open_floats_den_rfid t
          join starcash.denoms d
            on d.denom_code = t.denom_code
         where 1 <> 1;
    
    end if;
  
  end get_fill_denominations;

  -------------------------------------------------------------------------------------------------------
  procedure update_now_playing_position(a_position_x       in startouch.now_playing.position_x%type,
                                        a_position_y       in startouch.now_playing.position_y%type,
                                        a_unique_player_id in startouch.now_playing.unique_player_id%type,
                                        a_affected_rows    out int) is
  begin
  
    update startouch.now_playing
       set position_x = a_position_x, position_y = a_position_y
     where unique_player_id = a_unique_player_id;
  
    a_affected_rows := sql%rowcount;
  
  end;

  -------------------------------------------------------------------------------------------------------
  procedure get_authorizers(a_auth_area in varchar2,
                            ret_val     out sys_refcursor) is
  begin
  
    open ret_val for
      select user_master.user_link,
             user_master.user_id,
             user_master.last_name,
             user_master.first_name
        from guardian.user_master user_master
       where exists (select 0
                from guardian.auth_supervs auth_supervs
               where auth_supervs.auth_area = a_auth_area
                 and upper(auth_supervs.user_id) =
                     upper(user_master.user_id));
  
  end get_authorizers;

  -------------------------------------------------------------------------------------------------------
  procedure undo_float_transactions(a_unique_player_id in startouch.denomination_tracking.unique_player_id%type,
                                    a_game_id          in startouch.denomination_tracking.game_id%type) is
  begin
  
    for rec in (select t.table_link, t.denom_key, t.denom_value
                  from startouch.denomination_tracking t
                 where t.unique_player_id = a_unique_player_id
                   and t.tracking_id is null) loop
    
      startouch.main.update_float_difference(rec.table_link,
                                             rec.denom_key,
                                             rec.denom_value);
    
    end loop;
  
    delete startouch.denomination_tracking
     where unique_player_id = a_unique_player_id
       and tracking_id is null;
  
  end undo_float_transactions;

  -------------------------------------------------------------------------------------------------------
  procedure get_open_transfers(a_table_link in starcash.tables.table_link%type,
                               a_ret_val    out sys_refcursor) is
    lvGameDate date;
  begin
  
    lvGameDate := api.getTableGameDate(a_table_link);
  
    open a_ret_val for
      select *
        from (select 'ttCheckFill' as transfer_type,
                     'Fill' as descr,
                     fills.fill_code as key_code
                from starcash.fills fills
               where fills.table_link = a_table_link
                 and fills.game_date = lvGameDate
                 and fills.rfid_end_status is null
                 and fills.canceled <> 'Y'
                 and fills.grand_total > 0
              union
              select 'ttCheckChipExchangeFill' as transfer_type,
                     'Chip exchange fill' as descr,
                     chips_exchange.chips_exchange_code as key_code
                from starcash.chips_exchange chips_exchange
               where chips_exchange.table_link = a_table_link
                 and chips_exchange.game_date = lvGameDate
                 and chips_exchange.rfid_out_end_status is null
                 and chips_exchange.canceled <> 'Y'
                 and chips_exchange.grand_total <> 0
              union
              select 'ttCheckClosingChipFill' as transfer_type,
                     'Closing fill' as descr,
                     chip_fills.chip_fill_code as key_code
                from starcash.chip_fills chip_fills
               where chip_fills.table_link = a_table_link
                 and chip_fills.game_date = lvGameDate
                 and chip_fills.rfid_end_status is null
                 and chip_fills.canceled <> 'Y'
                 and chip_fills.grand_total <> 0) t
       order by t.descr;
  
  end get_open_transfers;

  -------------------------------------------------------------------------------------------------------
  procedure summerDayLightSaving(a_unique_player_id in startouch.denomination_tracking.unique_player_id%type) is
  begin
  
    update startouch.now_playing
       set start_time = start_time + interval '1' hour,
           created_at = created_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.bet
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.cashout
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.chips_given
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.chipsin
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.drop_plaqs
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.drops
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.expense
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.wins
       set entered_at = entered_at + interval '1' hour
     where unique_player_id = a_unique_player_id;
  
  end summerDayLightSaving;

  -------------------------------------------------------------------------------------------------------
  procedure winterDayLightSaving(a_unique_player_id in startouch.denomination_tracking.unique_player_id%type) is
  begin
  
    update startouch.now_playing
       set start_time = start_time + interval '-1' hour,
           created_at = created_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.bet
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.cashout
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.chips_given
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.chipsin
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.drop_plaqs
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.drops
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.expense
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
    update startouch.wins
       set entered_at = entered_at + interval '-1' hour
     where unique_player_id = a_unique_player_id;
  
  end winterDayLightSaving;

  -------------------------------------------------------------------------------------------------------
  procedure update_now_playing_last_drop(a_table_link  in number,
                                         a_customer_id in number,
                                         a_amount      in number) is
    newGamedate               date;
    oldMaxGamedate            date;
    oldMaxDropGamedateCounter number;
  begin
  
    newGamedate := api.getTableGameDate(a_table_link);
  
    select max(now_playing.last_drop_gamedate),
           nvl(max(last_drop_gamedate_counter), 0)
      into oldMaxGamedate, oldMaxDropGamedateCounter
      from startouch.now_playing now_playing
     where now_playing.player_master_link_id = a_customer_id;
  
    if nvl(a_amount, 0) >= 0 then
    
      if newGamedate = oldMaxGamedate then
      
        update startouch.now_playing
           set last_drop_gamedate         = newGamedate,
               last_drop_gamedate_counter = oldMaxDropGamedateCounter + 1
         where player_master_link_id = a_customer_id;
      
      else
      
        update startouch.now_playing
           set last_drop_gamedate         = newGamedate,
               last_drop_gamedate_counter = 1
         where player_master_link_id = a_customer_id;
      
      end if;
    
    else
      -- if nvl(a_amount, 0) < 0 (UNDO) then 
    
      if newGamedate = oldMaxGamedate then
      
        if oldMaxDropGamedateCounter >= 2 then
        
          update startouch.now_playing
             set last_drop_gamedate         = newGamedate,
                 last_drop_gamedate_counter = oldMaxDropGamedateCounter - 1
           where player_master_link_id = a_customer_id;
        
        else
        
          update startouch.now_playing
             set last_drop_gamedate         = null,
                 last_drop_gamedate_counter = null
           where player_master_link_id = a_customer_id;
        
        end if;
      
      end if;
    
    end if;
  
  end update_now_playing_last_drop;

  -------------------------------------------------------------------------------------------------------
  procedure insert_bet(a_pit_code         in varchar2,
                       a_table_link       in number,
                       a_customer_id      in number,
                       a_game_id          in varchar2,
                       a_unique_player_id in varchar2,
                       a_amount           in number,
                       a_promos_amount    in number,
                       a_entered_by       in varchar2,
                       a_denominations    in varchar2,
                       a_game_date        in date,
                       a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_bet.nextval into nextID from dual;
  
    insert into startouch.bet
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_BET,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_bet;

  -------------------------------------------------------------------------------------------------------
  procedure insert_rolling_bet(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_promos_amount    in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_rolling_bet.nextval into nextID from dual;
  
    insert into startouch.rolling_bet
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_ROLLING_BET,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_rolling_bet;

  -------------------------------------------------------------------------------------------------------
  procedure insert_wins(a_pit_code         in varchar2,
                        a_table_link       in number,
                        a_customer_id      in number,
                        a_game_id          in varchar2,
                        a_unique_player_id in varchar2,
                        a_amount           in number,
                        a_promos_amount    in number,
                        a_entered_by       in varchar2,
                        a_denominations    in varchar2,
                        a_game_date        in date,
                        a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_wins.nextval into nextID from dual;
  
    insert into startouch.wins
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_WIN,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_wins;

  -------------------------------------------------------------------------------------------------------
  procedure insert_chipsin(a_pit_code         in varchar2,
                           a_table_link       in number,
                           a_customer_id      in number,
                           a_game_id          in varchar2,
                           a_unique_player_id in varchar2,
                           a_amount           in number,
                           a_promos_amount    in number,
                           a_entered_by       in varchar2,
                           a_denominations    in varchar2,
                           a_game_date        in date,
                           a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_chipsin.nextval into nextID from dual;
  
    insert into startouch.chipsin
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_CHIPS_IN,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
    update_now_playing_last_drop(a_table_link, a_customer_id, a_amount);
  
  end insert_chipsin;

  -------------------------------------------------------------------------------------------------------
  procedure insert_chipsout(a_pit_code         in varchar2,
                            a_table_link       in number,
                            a_customer_id      in number,
                            a_game_id          in varchar2,
                            a_unique_player_id in varchar2,
                            a_amount           in number,
                            a_promos_amount    in number,
                            a_entered_by       in varchar2,
                            a_denominations    in varchar2,
                            a_game_date        in date,
                            a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_cashout.nextval into nextID from dual;
  
    insert into startouch.cashout
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_CHIPS_OUT,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_chipsout;

  -------------------------------------------------------------------------------------------------------
  procedure insert_drop(a_pit_code         in varchar2,
                        a_table_link       in number,
                        a_customer_id      in number,
                        a_game_id          in varchar2,
                        a_unique_player_id in varchar2,
                        a_amount           in number,
                        a_entered_by       in varchar2,
                        a_denominations    in varchar2,
                        a_game_date        in date,
                        a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_drops.nextval into nextID from dual;
  
    insert into startouch.drops
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         TT_DROP_CASH,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
    update_now_playing_last_drop(a_table_link, a_customer_id, a_amount);
  
  end insert_drop;

  -------------------------------------------------------------------------------------------------------
  procedure insert_drop_plaques(a_pit_code         in varchar2,
                                a_table_link       in number,
                                a_customer_id      in number,
                                a_game_id          in varchar2,
                                a_unique_player_id in varchar2,
                                a_amount           in number,
                                a_entered_by       in varchar2,
                                a_denominations    in varchar2,
                                a_game_date        in date,
                                a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_drop_plaqs.nextval into nextID from dual;
  
    insert into startouch.drop_plaqs
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         TT_DROP_PLAQUES,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
    update_now_playing_last_drop(a_table_link, a_customer_id, a_amount);
  
  end insert_drop_plaques;

  -------------------------------------------------------------------------------------------------------
  procedure insert_chips_given(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_chips_given.nextval into nextID from dual;
  
    insert into startouch.chips_given
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         TT_CHIPS_GIVEN,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_chips_given;

  -------------------------------------------------------------------------------------------------------
  procedure insert_baccarat_bb(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_promos_amount    in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_baccarat.nextval into nextID from dual;
  
    insert into startouch.baccarat_bb
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_WIN,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_baccarat_bb;

  -------------------------------------------------------------------------------------------------------
  procedure insert_baccarat_pb(a_pit_code         in varchar2,
                               a_table_link       in number,
                               a_customer_id      in number,
                               a_game_id          in varchar2,
                               a_unique_player_id in varchar2,
                               a_amount           in number,
                               a_promos_amount    in number,
                               a_entered_by       in varchar2,
                               a_denominations    in varchar2,
                               a_game_date        in date,
                               a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_baccarat.nextval into nextID from dual;
  
    insert into startouch.baccarat_pb
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_BACCARAT_PB,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_baccarat_pb;

  -------------------------------------------------------------------------------------------------------
  procedure insert_baccarat_t(a_pit_code         in varchar2,
                              a_table_link       in number,
                              a_customer_id      in number,
                              a_game_id          in varchar2,
                              a_unique_player_id in varchar2,
                              a_amount           in number,
                              a_promos_amount    in number,
                              a_entered_by       in varchar2,
                              a_denominations    in varchar2,
                              a_game_date        in date,
                              a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_baccarat.nextval into nextID from dual;
  
    insert into startouch.baccarat_t
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_BACCARAT_T,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_baccarat_t;

  -------------------------------------------------------------------------------------------------------
  procedure insert_baccarat_bpb(a_pit_code         in varchar2,
                                a_table_link       in number,
                                a_customer_id      in number,
                                a_game_id          in varchar2,
                                a_unique_player_id in varchar2,
                                a_amount           in number,
                                a_promos_amount    in number,
                                a_entered_by       in varchar2,
                                a_denominations    in varchar2,
                                a_game_date        in date,
                                a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_baccarat.nextval into nextID from dual;
  
    insert into startouch.baccarat_bpb
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_BACCARAT_BPB,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_baccarat_bpb;

  -------------------------------------------------------------------------------------------------------
  procedure insert_baccarat_ppb(a_pit_code         in varchar2,
                                a_table_link       in number,
                                a_customer_id      in number,
                                a_game_id          in varchar2,
                                a_unique_player_id in varchar2,
                                a_amount           in number,
                                a_promos_amount    in number,
                                a_entered_by       in varchar2,
                                a_denominations    in varchar2,
                                a_game_date        in date,
                                a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_baccarat.nextval into nextID from dual;
  
    insert into startouch.baccarat_ppb
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_BACCARAT_PPB,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_baccarat_ppb;

  -------------------------------------------------------------------------------------------------------
  procedure insert_rolling_return(a_pit_code         in varchar2,
                                  a_table_link       in number,
                                  a_customer_id      in number,
                                  a_game_id          in varchar2,
                                  a_unique_player_id in varchar2,
                                  a_amount           in number,
                                  a_promos_amount    in number,
                                  a_entered_by       in varchar2,
                                  a_denominations    in varchar2,
                                  a_game_date        in date,
                                  a_tournament_id    in number) is
    now        date := sysdate;
    nextID     number;
    lvGameDate date := case
                         when a_game_date is null then
                          startouch.api.getTableGameDate(a_table_link)
                         else
                          a_game_date
                       end;
  begin
  
    select startouch.seq_rolling_return.nextval into nextID from dual;
  
    insert into startouch.rolling_return
      (id,
       casino_pits_pit_code,
       tables_table_link,
       player_master_link_id,
       value,
       promos_value,
       entered_by,
       game_id,
       unique_player_id,
       entered_at,
       game_date)
    values
      (nextID,
       a_pit_code,
       a_table_link,
       a_customer_id,
       a_amount,
       a_promos_amount,
       a_entered_by,
       a_game_id,
       a_unique_player_id,
       now,
       lvGameDate);
  
    -- έαν δεν κάνουμε undo πρέπει να καταγραφεί η ενέργεια στο undo_buffer
    if a_denominations is not null then
    
      insert into startouch.undo_buffer
        (id,
         casino_pits_pit_code,
         tables_table_link,
         unique_player_id,
         player_id,
         amount,
         promos_value,
         transaction_type_id,
         denominations,
         entered_by,
         entered_at,
         game_date,
         game_id,
         tournament_id)
      values
        (nextID,
         a_pit_code,
         a_table_link,
         a_unique_player_id,
         a_customer_id,
         a_amount,
         a_promos_amount,
         TT_ROLLING_RETURN,
         a_denominations,
         a_entered_by,
         now,
         lvGameDate,
         a_game_id,
         a_tournament_id);
    
    end if;
  
  end insert_rolling_return;

  -------------------------------------------------------------------------------------------------------
  procedure get_undoable_actions(a_user_id in varchar2,
                                 a_ret_val out sys_refcursor) is
    lvUndoTimeLimitInHours    number;
    lvCalculatedUndoTimeLimit date;
  begin
  
    -- Το undo_buffer διατηρείτε για 30 ημέρες
    delete startouch.undo_buffer where entered_at < sysdate - 30;
  
    select nvl(undo_time_limit_in_hours, 24)
      into lvUndoTimeLimitInHours
      from startouch.configuration;
  
    lvCalculatedUndoTimeLimit := sysdate - lvUndoTimeLimitInHours / 24;
  
    open a_ret_val for
      select undo_buffer.id,
             undo_buffer.casino_pits_pit_code as pit_code,
             undo_buffer.tables_table_link as table_id,
             table_types.table_type || tables.table_no as table_descr,
             undo_buffer.unique_player_id,
             undo_buffer.player_id,
             player_master.last_name || ' ' || player_master.first_name as player_name,
             player_photo.photo as player_photo,
             undo_buffer.amount,
             undo_buffer.promos_value,
             undo_buffer.transaction_type_id,
             transaction_type.description as transaction_type_descr,
             undo_buffer.denominations,
             undo_buffer.avg_bet,
             undo_buffer.p_table_type,
             undo_buffer.p_hands,
             undo_buffer.p_factor,
             undo_buffer.entered_by,
             undo_buffer.entered_at,
             undo_buffer.game_date,
             undo_buffer.game_id,
             undo_buffer.baccarat_win,
             undo_buffer.tournament_id
        from startouch.undo_buffer undo_buffer
        join starcash.tables tables
          on tables.table_link = undo_buffer.tables_table_link
        join starcash.table_types table_types
          on table_types.table_type = tables.table_type
        join logismos.player_master player_master
          on player_master.link_id = undo_buffer.player_id
        join startouch.transaction_type transaction_type
          on transaction_type.id = undo_buffer.transaction_type_id
        left join logismos.player_photo player_photo
          on player_photo.link_id = undo_buffer.player_id
       where upper(undo_buffer.entered_by) = upper(a_user_id)
         and undo_buffer.entered_at >= lvCalculatedUndoTimeLimit
         and undo_buffer.game_date =
             startouch.api.getTableGameDate(undo_buffer.tables_table_link)
       order by undo_buffer.entered_at desc;
  
  end get_undoable_actions;

  -------------------------------------------------------------------------------------------------------
  /*
  * Επιστρέφει 1 αν το action έχει γίνει commit (δεν βρίσκει εγγραφή στο ανάλογο temp action buffer) 
  * και 0 αν δεν έχει γίνει commit. 
  * Το commit που αφορά unknown player μπορεί να βρίσκεται στον delayed_table_entry
  */
  -------------------------------------------------------------------------------------------------------
  function isUndoActionCommited(a_undo_transaction_id in int,
                                a_transaction_type_id in int) return int is
    lvRetVal int := 0;
  begin
  
    if a_transaction_type_id not in
       (TT_BET,
        TT_DROP_CASH,
        TT_DROP_PLAQUES,
        TT_CHIPS_GIVEN,
        TT_CHIPS_IN,
        TT_CHIPS_OUT,
        TT_WIN,
        TT_ROLLING_BET,
        TT_BACCARAT_BB,
        TT_BACCARAT_PB,
        TT_BACCARAT_T,
        TT_BACCARAT_BPB,
        TT_BACCARAT_PPB,
        TT_ROLLING_RETURN) then
      raise_application_error(-20200,
                              'Unknown transaction type ' ||
                              a_transaction_type_id || '!');
    end if;
  
    select case
             when a_transaction_type_id = TT_BET then
              (select count(0)
                 from startouch.bet
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_DROP_CASH then
              (select count(0)
                 from startouch.drops
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_DROP_PLAQUES then
              (select count(0)
                 from startouch.drop_plaqs
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_CHIPS_GIVEN then
              (select count(0)
                 from startouch.chips_given
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_CHIPS_IN then
              (select count(0)
                 from startouch.chipsin
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_CHIPS_OUT then
              (select count(0)
                 from startouch.cashout
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_WIN then
              (select count(0)
                 from startouch.wins
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_ROLLING_BET then
              (select count(0)
                 from startouch.rolling_bet
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_BACCARAT_BB then
              (select count(0)
                 from startouch.baccarat_bb
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_BACCARAT_PB then
              (select count(0)
                 from startouch.baccarat_pb
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_BACCARAT_T then
              (select count(0)
                 from startouch.baccarat_t
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_BACCARAT_BPB then
              (select count(0)
                 from startouch.baccarat_bpb
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_BACCARAT_PPB then
              (select count(0)
                 from startouch.baccarat_ppb
                where id = a_undo_transaction_id)
             when a_transaction_type_id = TT_ROLLING_RETURN then
              (select count(0)
                 from startouch.rolling_return
                where id = a_undo_transaction_id)
           
           end
      into lvRetVal
      from dual;
  
    return case when lvRetVal = 0 then 1 else 0 end;
  
  end isUndoActionCommited;

  -------------------------------------------------------------------------------------------------------
  procedure removeFromUndoBuffer(a_undo_transaction_id in int,
                                 a_transaction_type_id in int,
                                 a_user_id             string) is
    lvCounter number;
  begin
  
    select count(0)
      into lvCounter
      from startouch.undo_buffer undo_buffer
     where undo_buffer.id = a_undo_transaction_id
       and undo_buffer.transaction_type_id = a_transaction_type_id;
  
    if lvCounter = 0 then
    
      raise_application_error(-20300,
                              'Transaction doesn''t exist in undo buffer (' ||
                              a_undo_transaction_id || ',' ||
                              a_transaction_type_id || ')!');
    
    end if;
  
    insert into startouch.undo_buffer_log
      (id,
       casino_pits_pit_code,
       tables_table_link,
       unique_player_id,
       player_id,
       amount,
       promos_value,
       transaction_type_id,
       denominations,
       avg_bet,
       p_table_type,
       p_hands,
       p_factor,
       entered_by,
       entered_at,
       game_date,
       undo_by,
       undo_at,
       game_id,
       baccarat_win,
       tournament_id)
      select id,
             casino_pits_pit_code,
             tables_table_link,
             unique_player_id,
             player_id,
             amount,
             promos_value,
             transaction_type_id,
             denominations,
             avg_bet,
             p_table_type,
             p_hands,
             p_factor,
             entered_by,
             entered_at,
             game_date,
             upper(a_user_id),
             sysdate,
             game_id,
             baccarat_win,
             tournament_id
        from startouch.undo_buffer undo_buffer
       where undo_buffer.id = a_undo_transaction_id
         and undo_buffer.transaction_type_id = a_transaction_type_id;
  
    delete startouch.undo_buffer
     where id = a_undo_transaction_id
       and transaction_type_id = a_transaction_type_id;
  
  end removeFromUndoBuffer;

  -------------------------------------------------------------------------------------------------------
  function splitInt(a_list varchar2, a_delimiter varchar2 := ',')
    return int_table
    pipelined is
    lvIdx  pls_integer;
    lvList varchar2(32767) := a_list;
  begin
  
    if length(trim(a_list)) > 0 then
      loop
        lvIdx := instr(lvList, a_delimiter);
      
        if lvIdx > 0 then
          pipe row(to_number(substr(lvList, 1, lvIdx - 1)));
          lvList := substr(lvList, lvIdx + length(a_delimiter));
        else
          pipe row(lvList);
          exit;
        end if;
      end loop;
    end if;
  
    return;
  
  end splitInt;

  -------------------------------------------------------------------------------------------------------
  function getCustomerChipsBuy(a_customer_id int,
                               a_from_date   date,
                               a_to_date     date) return number is
    retVal number;
  begin
  
    select nvl((select sum(denoms.value * denomination_tracking.denom_value)
                 from startouch.denomination_tracking denomination_tracking
                 join starcash.denoms denoms
                   on denoms.denom_code = denomination_tracking.denom_key
                where denomination_tracking.player_id = a_customer_id
                  and denomination_tracking.game_date between a_from_date and
                      a_to_date
                  and denomination_tracking.transaction_type_id = 10),
               0)
      into retVal
      from dual;
  
    return nvl(retVal, 0);
  
  end getCustomerChipsBuy;

  -------------------------------------------------------------------------------------------------------
  function lastTransactionDate(a_player_id int, a_offset int := 0)
    return date is
    retVal date;
  begin
  
    select max(player_detail.trans_date)
      into retVal
      from logismos.player_detail player_detail
     where player_detail.link_id = a_player_id
       and player_detail.description_code in
           (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74, 93);
  
    return retVal;
  
  end lastTransactionDate;

  -------------------------------------------------------------------------------------------------------
  function sort_value(a_player_id         int,
                      a_unkwnow_player_id int,
                      a_sort_type         int,
                      a_fist_name         string,
                      a_last_name         string) return string is
    retVal string(100);
  begin
  
    /*
    * O unknown player πρέπει να προηγείτε στα αποτελέσματα της αναζήτησης. Αυτό το πετυχαίνουμε
    * χρησιμοποιώντας τον χαρακτήρα @ ο οποίος προηγέιτε από όλους τους λατινικούς χαρακτήρες.
    */
  
    select case
             when a_sort_type = 1 then
              case
                when a_player_id = a_unkwnow_player_id then
                 '@'
                else
                 a_last_name
              end
             when a_sort_type = 2 then
              case
                when a_player_id = a_unkwnow_player_id then
                 '@'
                else
                 a_fist_name
              end
             when a_sort_type = 3 then
              case
                when a_player_id = a_unkwnow_player_id then
                 to_char(sysdate + 100, 'yyyy-mm-dd')
                else
                 to_char(lastTransactionDate(a_player_id, 100), 'yyyy-mm-dd')
              end
           end
      into retVal
      from dual;
  
    return retVal;
  
  end sort_value;

  /*
  * a_special_query >= 0 indicates elapsed days.
  *
  * a_card_number                                 = 1
  * a_last_name                                   = 2
  * Tracked Today (a_special_query = -2)          = 3
  * Junket Checkin today (a_special_query = -3)   = 4
  * a_special_query > 0                           = 5
  * C-JOP  (a_special_query = -4)                 = 6
  */
  -------------------------------------------------------------------------------------------------------
  procedure find_players(a_first_name      in logismos.player_master.first_name%type,
                         a_last_name       in logismos.player_master.last_name%type,
                         a_card_number     in logismos.player_master.card_number%type,
                         a_membership_type in logismos.player_master.membership_type%type,
                         a_sex             in logismos.player_master.sex%type,
                         a_special_query   in integer,
                         a_age_cluster     in varchar2,
                         table_output      out sys_refcursor) is
    lvStartDate       date := sysdate - 77777;
    lvCurrentGameDate date := api.getGameDate(sysdate);
    lvOptimizedQuery  number := null;
    lvUnkwnowPlayerID number;
    lvConfiguration   startouch.configuration%rowtype;
  begin
  
    begin
      select configuration.unkown_player_id
        into lvUnkwnowPlayerID
        from startouch.configuration configuration;
    exception
      when no_data_found then
        lvUnkwnowPlayerID := -1;
    end;
  
    select * into lvConfiguration from startouch.configuration;
  
    -- a_special_query indicates elapsed days, find starting date
    if (a_special_query >= 0) then
      lvStartDate := api.getGameDate(sysdate) - a_special_query;
    end if;
  
    -- clear opt table
    delete startouch.tmp_table1;
  
    -- card number
    if a_card_number is not null then
    
      insert into startouch.tmp_table1
        (id)
        select player_master.link_id
          from logismos.player_master_vw player_master
         where player_master.card_number = a_card_number;
    
      if (sql%rowcount = 0) then
        insert into startouch.tmp_table1
          (id)
          select distinct player_addcards.link_id
            from logismos.player_addcards player_addcards
            join logismos.player_master_vw player_master
              on player_master.link_id = player_addcards.link_id
           where player_addcards.add_card = a_card_number
             and player_addcards.add_status = 'A';
      
      end if;
    
      lvOptimizedQuery := 1;
    
    end if;
  
    -- last name
    if a_last_name is not null then
    
      if lvOptimizedQuery is not null then
      
        delete startouch.tmp_table1
         where id not in (select player_master.link_id
                            from logismos.player_master_vw player_master
                           where upper(player_master.last_name) like                           
                                 upper(a_last_name) || '%');
      
      else
      
        insert into startouch.tmp_table1
          (id)
          select player_master.link_id
            from logismos.player_master_vw player_master
           where upper(player_master.last_name) like
                 upper(a_last_name) || '%';
      
      end if;
    
      lvOptimizedQuery := 2;
    
    end if;
  
    -- Tracked Today
    if a_special_query = -2 then
    
      if lvOptimizedQuery is not null then
      
        delete startouch.tmp_table1
         where id not in
               (select trak_stats.memb_linkid
                  from logismos.trak_stats trak_stats
                 where trak_stats.gamedate >= lvCurrentGameDate
                union
                select trak_stats_sl.memb_linkid
                  from logismos.trak_stats_sl trak_stats_sl
                 where trak_stats_sl.gamedate >= lvCurrentGameDate);
      
      else
      
        insert into startouch.tmp_table1
          (id)
          select trak_stats.memb_linkid
            from logismos.trak_stats trak_stats
           where trak_stats.gamedate >= lvCurrentGameDate
          union
          select trak_stats_sl.memb_linkid
            from logismos.trak_stats_sl trak_stats_sl
           where trak_stats_sl.gamedate >= lvCurrentGameDate;
      
      end if;
    
      lvOptimizedQuery := 3;
    
    end if;
  
    -- Junket Checkin today
    if a_special_query = -3 then
    
      if lvOptimizedQuery is not null then
      
        delete startouch.tmp_table1
         where id not in
               (select player_detail.link_id
                  from logismos.player_detail player_detail
                  join logismos.junket_detail junket_detail
                    on junket_detail.trans_number =
                       player_detail.trans_number
                 where player_detail.gamedate =
                       startouch.api.getGameDate(sysdate));
      
      else
      
        insert into startouch.tmp_table1
          (id)
          select player_detail.link_id
            from logismos.player_detail player_detail
            join logismos.junket_detail junket_detail
              on junket_detail.trans_number = player_detail.trans_number
           where player_detail.gamedate =
                 startouch.api.getGameDate(sysdate);
      
      end if;
    
      lvOptimizedQuery := 4;
    
    end if;
  
    --
  
    -- C-JOP
    if a_special_query = -4 then
    
      if lvOptimizedQuery is not null then
      
        delete startouch.tmp_table1
         where id not in
               (select distinct virtual_player.player_id
                  from casinocrm.action action
                  join casinocrm.action_target action_target
                    on action_target.action_id = action.id
                  join casinocrm.campaign_target_details campaign_target_details
                    on campaign_target_details.action_target_id =
                       action_target.id
                  join casinocrm.virtual_player virtual_player
                    on virtual_player.id = action_target.virtual_player_id
                   and virtual_player.player_type = 'L'
                 where starapi.pcg_trak.GetGameDate(sysdate) between
                       starapi.pcg_trak.GetGameDate(campaign_target_details.arrival_date + 0.5) and
                       starapi.pcg_trak.GetGameDate(campaign_target_details.calculated_check_out + 0.5)
                   and campaign_target_details.junket_operator_id is not null);
      
      else
      
        insert into startouch.tmp_table1
          (id)
          select distinct virtual_player.player_id
            from casinocrm.action action
            join casinocrm.action_target action_target
              on action_target.action_id = action.id
            join casinocrm.campaign_target_details campaign_target_details
              on campaign_target_details.action_target_id =
                 action_target.id
            join casinocrm.virtual_player virtual_player
              on virtual_player.id = action_target.virtual_player_id
             and virtual_player.player_type = 'L'
           where starapi.pcg_trak.GetGameDate(sysdate) between
                 starapi.pcg_trak.GetGameDate(campaign_target_details.arrival_date + 0.5) and
                 starapi.pcg_trak.GetGameDate(campaign_target_details.calculated_check_out + 0.5)
             and campaign_target_details.junket_operator_id is not null;
      
      end if;
    
      lvOptimizedQuery := 6;
    
    end if;
  
    --
  
    if a_special_query >= 0 then
    
      if lvOptimizedQuery is not null then
      
        delete startouch.tmp_table1
         where id not in
               (select player_master.link_id
                  from logismos.player_master_vw player_master
                  join logismos.player_detail player_detail
                    on player_detail.link_id = player_master.link_id
                 where player_detail.description_code in
                       (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74, 93)
                   and player_detail.gamedate >= lvStartDate);
      
      else
      
        insert into startouch.tmp_table1
          (id)
          select distinct player_master.link_id
            from logismos.player_master_vw player_master
            join logismos.player_detail player_detail
              on player_detail.link_id = player_master.link_id
           where player_detail.description_code in
                 (10, 11, 21, 22, 23, 41, 42, 43, 71, 72, 73, 74, 93)
             and player_detail.gamedate >= lvStartDate;
      
      end if;
    
      lvOptimizedQuery := 5;
    
    end if;
  
    if lvOptimizedQuery is not null then
    
      open table_output for
        select t2.*
          from (select player_master.link_id,
                       player_master.first_name,
                       player_master.last_name,
                       player_master.card_number,
                       nvl(player_photo.photo,
                           configuration.default_player_photo) as photo,
                       null as membership_type_descr,
                       0 as barred
                  from logismos.player_master_vw player_master
                  left join logismos.player_photo player_photo
                    on player_photo.link_id = player_master.link_id
                 cross join startouch.configuration configuration
                 where player_master.link_id =
                       (select t.unkown_player_id
                          from startouch.configuration t)
                
                union all
                
                select player_master.link_id,
                       player_master.first_name,
                       player_master.last_name,
                       player_master.card_number,
                       nvl(player_photo.photo,
                           configuration.default_player_photo) as photo,
                       membership_types.description as membership_type_descr,
                       api.isBarred(player_master.link_id) as barred
                  from startouch.tmp_table1 tmp_table1
                  join logismos.player_master_vw player_master
                    on player_master.link_id = tmp_table1.id
                  left join logismos.membership_types membership_types
                    on membership_types.code = player_master.membership_type
                  left join logismos.player_photo player_photo
                    on player_photo.link_id = player_master.link_id
                 cross join startouch.configuration configuration
                 where player_master.card_number is not null
                   and (player_master.inactive = 'N' or
                       player_master.inactive is null)
                   and (a_membership_type is null or
                       player_master.membership_type = a_membership_type)
                   and (a_sex is null or player_master.sex = a_sex)
                   and (a_first_name is null or upper(player_master.first_name) like
                       upper(a_first_name) || '%')
                   and (a_last_name is null or upper(player_master.last_name) like                   
                       upper(a_last_name) || '%')) t2
         where t2.card_number is not null
           and (a_age_cluster is null or
               startouch.isInAgeCluster(t2.link_id, a_age_cluster) = 1)
           and rownum <=
               (select nvl(t.row_limit, 100) from startouch.configuration t)
         order by sort_value(t2.link_id,
                             lvUnkwnowPlayerID,
                             case
                               when lvOptimizedQuery in (3, 4, 5, 6) then
                                nvl(lvConfiguration.flt_tracked_sort, 1)
                               else
                                nvl(lvConfiguration.flt_else_sort, 1)
                             end,
                             t2.first_name,
                             t2.last_name);
    
    else
    
      if a_membership_type is not null or a_sex is not null or
         a_first_name is not null then
      
        open table_output for
          select *
            from (select player_master.link_id,
                         player_master.first_name,
                         player_master.last_name,
                         player_master.card_number,
                         nvl(player_photo.photo, ssph.default_player_photo) as photo,
                         null as membership_type_descr,
                         0 as barred
                    from logismos.player_master_vw player_master
                    left join logismos.player_photo player_photo
                      on player_photo.link_id = player_master.link_id
                   cross join startouch.configuration ssph
                   where player_master.link_id =
                         (select t.unkown_player_id
                            from startouch.configuration t)
                  
                  union all
                  
                  select player_master.link_id,
                         player_master.first_name,
                         player_master.last_name,
                         player_master.card_number,
                         nvl(pph.photo, ssph.default_player_photo) as photo,
                         membership_types.description as membership_type_descr,
                         api.isBarred(player_master.link_id) as barred
                    from logismos.player_master_vw player_master
                    left join logismos.membership_types membership_types
                      on membership_types.code =
                         player_master.membership_type
                    left join logismos.player_photo pph
                      on pph.link_id = player_master.link_id
                   cross join startouch.configuration ssph
                   where player_master.card_number is not null
                     and (player_master.inactive = 'N' or
                         player_master.inactive is null)
                     and (a_membership_type is null or
                         player_master.membership_type = a_membership_type)
                     and (a_sex is null or player_master.sex = a_sex)
                     and (a_first_name is null or upper(player_master.first_name) like
                         upper(a_first_name) || '%'))
           where card_number is not null
             and (a_age_cluster is null or
                 startouch.isInAgeCluster(link_id, a_age_cluster) = 1)
             and rownum <= (select nvl(t.row_limit, 100)
                              from startouch.configuration t)
           order by sort_value(link_id,
                               lvUnkwnowPlayerID,
                               case
                                 when lvOptimizedQuery in (3, 4, 5) then
                                  nvl(lvConfiguration.flt_tracked_sort, 3)
                                 else
                                  nvl(lvConfiguration.flt_else_sort, 1)
                               end,
                               first_name,
                               last_name);
      
      else
      
        open table_output for
          select player_master.link_id,
                 player_master.first_name,
                 player_master.last_name,                 
                 player_master.card_number,
                 nvl(player_photo.photo, ssph.default_player_photo) as photo,
                 null as membership_type_descr,
                 0 as barred
            from logismos.player_master_vw player_master
            left join logismos.player_photo player_photo
              on player_photo.link_id = player_master.link_id
           cross join startouch.configuration ssph
           where player_master.link_id =
                 (select t.unkown_player_id from startouch.configuration t);
      
      end if;
    
    end if;
  
  end find_players;

  -- overwrite for applications not being aware of the a_age_cluster param
  -------------------------------------------------------------------------------------------------------
  procedure find_players(a_first_name      in logismos.player_master.first_name%type,
                         a_last_name       in logismos.player_master.last_name%type,
                         a_card_number     in logismos.player_master.card_number%type,
                         a_membership_type in logismos.player_master.membership_type%type,
                         a_sex             in logismos.player_master.sex%type,
                         a_special_query   in integer,
                         table_output      out sys_refcursor) is
  begin
  
    find_players(a_first_name,
                 a_last_name,
                 a_card_number,
                 a_membership_type,
                 a_sex,
                 a_special_query,
                 null,
                 table_output);
  
  end find_players;

  -------------------------------------------------------------------------------------------------------
  function getTableAverageBet(a_customer_id int,
                              a_table_id    int,
                              a_from_date   date,
                              a_to_date     date) return number is
    retVal number := 0;
  begin
  
    select decode(nvl(sum(trak_detail.hands_played), 0),
                  0,
                  0,
                  nvl(sum(trak_detail.theoret_drop), 0) /
                  nvl(sum(trak_detail.hands_played), 0))
      into retVal
      from logismos.trak_detail trak_detail
     where trak_detail.memb_linkid = a_customer_id
       and trak_detail.gamedate between a_from_date and a_to_date
       and trak_detail.table_link = a_table_id;
  
    return nvl(retVal, 0);
  
  end getTableAverageBet;

  -------------------------------------------------------------------------------------------------------
  function demo(aTableLink in integer) return sys_refcursor is
    retVal sys_refcursor;
  begin
  
    open retVal for
      select alerts.id,
             alerts.action_type,
             alerts.table_id,
             alerts.player_id,
             player_master.last_name || ' ' || player_master.first_name as player_name,
             alerts.player_unique_id,
             alerts.entered_at,
             alerts.value,
             alerts.entered_by,
             alerts.acknowledged_by,
             alerts.acknowledged_at,
             tbls.table_type || '/' || tbls.table_no as table_name
        from startouch.alerts alerts
        join starcash.tables tbls
          on tbls.table_link = alerts.table_id
        join logismos.player_master player_master
          on player_master.link_id = alerts.player_id
       where alerts.table_id = aTableLink
       order by alerts.id desc;
  
    return retVal;
  
  end demo;

  /**
  * Whenever the update button is not pressed for the duration specified in configuration
  * a new alarm session is created for player, gamedate and user.
  *
  * If an active session already exists for player, gamedate and user then its last_checked is updated
  * instead of creating a new one.
  *
  * When update button is pressed the session is closed and a new one is opened when nessecary.
  *
  * A sigle active alarm session is expected for each player, gamedate and user compination.
  * Other inactive alarm sessions may exist.
  */
  -------------------------------------------------------------------------------------------------------
  procedure create_or_update_alarm(a_table_id in startouch.alarm.table_id%type,
                                   a_user_id  in startouch.alarm.user_id%type) is
    lvTableGameDate date := startouch.api.getTableGameDate(a_table_id);
    lvNextID        number;
    lvID            number;
    lvNow           date := sysdate;
  begin
  
    begin
      select alarm.id
        into lvID
        from startouch.alarm alarm
       where alarm.gamedate = lvTableGameDate
         and alarm.table_id = a_table_id
         and alarm.user_id = a_user_id
         and alarm.active = 1;
    
      update startouch.alarm alarm
         set alarm.last_check_at = sysdate
       where alarm.id = lvID;
    exception
      when no_data_found then
        startouch.main.next_sequence_id_sp('ALARM', 1, lvNextID);
      
        insert into startouch.alarm
          (id,
           table_id,
           user_id,
           created_at,
           last_check_at,
           gamedate,
           active)
        values
          (lvNextID,
           a_table_id,
           a_user_id,
           lvNow,
           lvNow,
           lvTableGameDate,
           1);
    end;
  
  end create_or_update_alarm;

  -------------------------------------------------------------------------------------------------------
  procedure cancel_alarm(a_table_id in startouch.alarm.table_id%type,
                         a_user_id  in startouch.alarm.user_id%type) is
    lvTableGameDate date := startouch.api.getTableGameDate(a_table_id);
    lvNextID        number;
  begin
  
    update startouch.alarm alarm
       set alarm.active = 0
     where alarm.gamedate = lvTableGameDate
       and alarm.table_id = a_table_id
       and alarm.user_id = a_user_id;
  
  end cancel_alarm;

  -------------------------------------------------------------------------------------------------------
  procedure get_alarms(ret_val out sys_refcursor) is
  begin
  
    open ret_val for
      select alarm.*,
             user_master.first_name || ' ' || user_master.last_name as user_name,
             tables.table_type || tables.table_no as table_name,
             round((sysdate - alarm.created_at) * 24 * 60, 1) as duration
        from startouch.alarm alarm
        join guardian.user_master user_master
          on user_master.user_link = alarm.user_id
        join starcash.tables tables
          on tables.table_link = alarm.table_id
       where alarm.gamedate = startouch.api.getGameDate(sysdate)
         and alarm.active = 1;
  
  end get_alarms;

  -------------------------------------------------------------------------------------------------------
  procedure remove_baccarat_transactions(a_instance_id in varchar2) is
  begin
  
    delete from startouch.baccarat_bb t
     where t.id in (select id
                      from startouch.undo_buffer undo_buffer
                     where undo_buffer.baccarat_win is null
                       and undo_buffer.unique_player_id = a_instance_id
                       and undo_buffer.transaction_type_id =
                           startouch.main.TT_BACCARAT_BB);
  
    delete from startouch.baccarat_pb t
     where t.id in (select id
                      from startouch.undo_buffer undo_buffer
                     where undo_buffer.baccarat_win is null
                       and undo_buffer.unique_player_id = a_instance_id
                       and undo_buffer.transaction_type_id =
                           startouch.main.TT_BACCARAT_PB);
    delete from startouch.baccarat_t t
     where t.id in (select id
                      from startouch.undo_buffer undo_buffer
                     where undo_buffer.baccarat_win is null
                       and undo_buffer.unique_player_id = a_instance_id
                       and undo_buffer.transaction_type_id =
                           startouch.main.TT_BACCARAT_T);
    delete from startouch.baccarat_bpb t
     where t.id in (select id
                      from startouch.undo_buffer undo_buffer
                     where undo_buffer.baccarat_win is null
                       and undo_buffer.unique_player_id = a_instance_id
                       and undo_buffer.transaction_type_id =
                           startouch.main.TT_BACCARAT_BPB);
    delete from startouch.baccarat_ppb t
     where t.id in (select id
                      from startouch.undo_buffer undo_buffer
                     where undo_buffer.baccarat_win is null
                       and undo_buffer.unique_player_id = a_instance_id
                       and undo_buffer.transaction_type_id =
                           startouch.main.TT_BACCARAT_PPB);
  
    delete startouch.undo_buffer undo_buffer
     where undo_buffer.baccarat_win is null
       and undo_buffer.unique_player_id = a_instance_id
       and undo_buffer.transaction_type_id in
           (startouch.main.tt_baccarat_bb,
            startouch.main.tt_baccarat_pb,
            startouch.main.tt_baccarat_t,
            startouch.main.tt_baccarat_bpb,
            startouch.main.tt_baccarat_ppb);
  
  end remove_baccarat_transactions;

  -------------------------------------------------------------------------------------------------------
  procedure tournament_add_player(a_action_id in number,
                                  a_player_id in number,
                                  a_user_id   in number,
                                  a_gamedate  in date) is
    lvNextId          number;
    lvVirtualPlayerId number;
    lvMaxVisit        number;
  begin
  
    casinocrm.main.next_sequence_id_sp('ACTION_TARGET', lvNextId);
    casinocrm.main.get_virtual_player_id('L',
                                         a_player_id,
                                         lvVirtualPlayerId);
  
    select nvl(max(t.visit_no), 0)
      into lvMaxVisit
      from casinocrm.action_target t
     where t.action_id = a_action_id
       and t.virtual_player_id = lvVirtualPlayerId;
  
    insert into casinocrm.action_target
      (id,
       action_id,
       virtual_player_id,
       state,
       visit_no,
       responsible,
       user_id,
       modified_at)
    values
      (lvNextId,
       a_action_id,
       lvVirtualPlayerId,
       casinocrm.main.PENDING_STATE,
       lvMaxVisit + 1,
       a_user_id,
       a_user_id,
       sysdate);
  
    insert into casinocrm.simple_campaign_target_details
      (action_id, action_target_id, reservation_date, reservation_from)
    values
      (a_action_id, lvNextId, sysdate, a_gamedate);
  
  end tournament_add_player;

  -------------------------------------------------------------------------------------------------------
  procedure get_basic_rolling_report(a_player_id     in number,
                                     a_table_id      in number,
                                     a_tournament_id in number,
                                     ret_val         out sys_refcursor) is
    lvTournament       varchar2(100);
    lvFirstName        varchar2(100);
    lvLastName         varchar2(100);
    lvCardNumber       varchar2(100);
    lvCurRollBuy       number;
    lvCurRollReturn    number;
    lvTmpRollBuy       number;
    lvTmpRollReturn    number;
    lvGdRollBuy        number;
    lvGdRollReturn     number;
    lvTourRollBuy      number;
    lvTourRollReturn   number;
    lvGdTourRollBuy    number;
    lvGdTourRollReturn number;
    lvPlayerId         number;
    lvGameDate         date;
  begin
  
    if a_table_id is null then
      lvGameDate := startouch.api.getGameDate(sysdate);
    else
      lvGameDate := startouch.api.getTableGameDate(a_table_id);
    end if;
  
    if a_player_id is null then
    
      lvPlayerId   := 123;
      lvFirstName  := 'Bill';
      lvLastName   := 'Papas';
      lvCardNumber := '11223344556677';
      lvTournament := 'Tournament';
    
    else
    
      lvPlayerId := a_player_id;
    
      select t.first_name, t.last_name, t.card_number
        into lvFirstName, lvLastName, lvCardNumber
        from logismos.player_master t
       where t.link_id = a_player_id;
    
      select t.title
        into lvTournament
        from casinocrm.action t
       where t.id = a_tournament_id;
    
    end if;
  
    -- last roll for player, table, gamedate
    select nvl(sum(decode(transaction_type_id, 18, amount, 0)), 0),
           nvl(sum(decode(transaction_type_id, 26, amount, 0)), 0)
      into lvCurRollBuy, lvCurRollReturn
      from (select dense_rank() over(order by t.entered_at desc) as rnk, t.*
              from (select t.*
                      from startouch.undo_buffer t
                     where t.player_id = a_player_id
                       and t.tables_table_link = a_table_id
                       and t.game_date = lvGameDate
                       and t.transaction_type_id = 18
                    
                    union all
                    
                    select t.*
                      from startouch.undo_buffer t
                     where t.player_id = a_player_id
                       and t.tables_table_link = a_table_id
                       and t.game_date = lvGameDate
                       and t.transaction_type_id = 26) t) t
     where t.rnk = 1;
  
    -- pending (not tracked yet) roll buy for player, table, gamedate
    select nvl(sum(t.value), 0)
      into lvTmpRollBuy
      from startouch.rolling_bet t
     where t.player_master_link_id = a_player_id
       and t.tables_table_link = a_table_id
       and t.game_date = lvGameDate;
  
    -- pending (not tracked yet) roll return for player, table, gamedate
    select nvl(sum(t.value), 0)
      into lvTmpRollReturn
      from startouch.rolling_return t
     where t.player_master_link_id = a_player_id
       and t.tables_table_link = a_table_id
       and t.game_date = lvGameDate;
  
    select nvl(sum(trak_detail.roll_buy), 0),
           nvl(sum(trak_detail.roll_return), 0)
      into lvGdRollBuy, lvGdRollReturn
      from logismos.trak_detail trak_detail
     where trak_detail.memb_linkid = a_player_id
       and trak_detail.gamedate = lvGameDate;
  
    select nvl(sum(trak_detail.roll_buy), 0),
           nvl(sum(trak_detail.roll_return), 0)
      into lvTourRollBuy, lvTourRollReturn
      from logismos.trak_detail trak_detail
     where trak_detail.memb_linkid = a_player_id
       and trak_detail.campaign_id = a_tournament_id;
  
    select nvl(sum(trak_detail.roll_buy), 0),
           nvl(sum(trak_detail.roll_return), 0)
      into lvGdTourRollBuy, lvGdTourRollReturn
      from logismos.trak_detail trak_detail
     where trak_detail.memb_linkid = a_player_id
       and trak_detail.gamedate = lvGameDate
       and trak_detail.campaign_id = a_tournament_id;
  
    open ret_val for
      select lvTournament       as "TOURNAMENT",
             lvGameDate         as "GAMEDATE",
             a_player_id        as "PLAYER ID",
             lvFirstName        as "FIRST NAME",
             lvLastName         as "LAST NAME",
             lvCardNumber       as "CARD NUMBER",
             lvCurRollBuy       as "LAST ROLL BUY",
             lvCurRollReturn    as "LAST ROLL RETURN",
             lvTmpRollBuy       as "NOT TRACKED ROLL BUY",
             lvTmpRollReturn    as "NOT TRACKED ROLL RETURN",
             lvGdRollBuy        as "TRACKED GD. ROLL BUY",
             lvGdRollReturn     as "TRACKED GD. ROLL RETURN",
             lvTourRollBuy      as "TRACKED TOUR. ROLL BUY",
             lvTourRollReturn   as "TRACKED TOUR. ROLL RETURN",
             lvGdTourRollBuy    as "TRACKED GD. TOUR. ROLL BUY",
             lvGdTourRollReturn as "TRACKED GD. TOUR. ROLL RETURN"
        from dual;
  
  end get_basic_rolling_report;

  -------------------------------------------------------------------------------------------------------
  procedure member_report_for_gd_tour(a_table_link  in number,
                                      a_member_link in number,
                                      a_tournament  in number,
                                      ret_val       out sys_refcursor) as
    lvGamedate date := startouch.api.getTableGameDate(a_table_link);
  begin
  
    open ret_val for
      select t.*,
             startouch.mis.getLGA1Value(null,
                                        a_member_link,
                                        lvGamedate,
                                        a_tournament) as lg_a1, -- ok
             startouch.mis.getLGA2Value(null,
                                        a_member_link,
                                        lvGamedate,
                                        a_tournament) as lg_a2, -- ok
             startouch.mis.getLGA1Hint as lg_a1_hint, -- ok
             startouch.mis.getLGA2Hint as lg_a2_hint, -- ok
             startouch.mis.getLGBValue(null,
                                       a_member_link,
                                       lvGamedate,
                                       a_tournament) as lg_b, -- ok
             startouch.mis.getLGBHint as lg_b_hint, -- ok
             startouch.mis.getLGTheoBetValue(null,
                                             a_member_link,
                                             lvGamedate,
                                             a_tournament) as theoret_bet, -- ok 
             startouch.mis.getLGTheoBetHint as theoret_bet_hint, -- ok 
             startouch.mis.getLGTheoLossValue(null,
                                              a_member_link,
                                              lvGamedate,
                                              a_tournament) as theoret_loss, -- ok
             startouch.mis.getLGTheoLossHint as theoret_loss_hint -- ok
      /*,startouch.main.getCustomerChipsBuy(a_member_link,
      lvGamedate,
      lvGamedate) as chips_buy_cage*/
        from (select nvl(sum(trak_detail.play_time), 0) as play_time, -- ok
                     nvl(sum(trak_detail."DROP"), 0) AS "DROP", -- ok
                     nvl(sum(trak_detail.drop_plaques), 0) as drop_plaques, -- ok
                     nvl(sum(trak_detail.cash_chips), 0) as chips_in, -- ok
                     nvl(sum(trak_detail.cash_out), 0) as cash_out, -- ok (chips out)
                     --nvl(sum(trak_detail.actual_loss), 0) as actual_loss_a,
                     nvl(sum(trak_detail.bet), 0) as actual_bet, -- ok
                     nvl(sum(trak_detail.win), 0) as win, -- ok
                     --nvl(sum(trak_detail.act_loss_betwin), 0) as actual_loss_b,
                     nvl(sum(trak_detail.cash_out_cage), 0) as cash_out_cage, -- ok
                     --nvl(sum(trak_detail.chips_hold_a), 0) as chips_hold_a,
                     --nvl(sum(trak_detail.chips_hold_b), 0) as chips_hold_b,
                     nvl(sum(trak_detail.chips_given), 0) as chips_given, -- ok
                     nvl(sum(trak_detail.roll_buy), 0) as roll_buy, -- ok
                     nvl(sum(trak_detail.roll_return), 0) as roll_return, -- ok
                     
                     nvl(sum(nvl(trak_detail.plaques_out_cage, 0) +
                             nvl(trak_detail.plaques_b_out_cage, 0)),
                         0) as plaques_out_cage, -- ok
                     
                     nvl(sum(nvl(trak_detail.plaques_in_cage, 0) +
                             nvl(trak_detail.plaques_b_in_cage, 0)),
                         0) as plaques_in_cage, -- ok
                     
                     nvl(sum(nvl(trak_detail.plaques_out_cage, 0) +
                             nvl(trak_detail.plaques_b_out_cage, 0) -
                             nvl(trak_detail.plaques_in_cage, 0) -
                             nvl(trak_detail.plaques_b_in_cage, 0)),
                         0) as plaques_hold
              
                from logismos.trak_detail trak_detail
               where trak_detail.memb_linkid = a_member_link
                 and trak_detail.gamedate = lvGamedate
                 and trak_detail.campaign_id = a_tournament) t;
  
  exception
    when no_data_found then
      null;
  end member_report_for_gd_tour;

  -------------------------------------------------------------------------------------------------------
  procedure member_report_for_tour(a_table_link  in number,
                                   a_member_link in number,
                                   a_tournament  in number,
                                   ret_val       out sys_refcursor) as
  begin
  
    open ret_val for
      select t.*,
             startouch.mis.getLGA1Value(null,
                                        a_member_link,
                                        null,
                                        a_tournament) as lg_a1,
             startouch.mis.getLGA2Value(null,
                                        a_member_link,
                                        null,
                                        a_tournament) as lg_a2,
             startouch.mis.getLGA1Hint as lg_a1_hint,
             startouch.mis.getLGA2Hint as lg_a2_hint,
             startouch.mis.getLGBValue(null,
                                       a_member_link,
                                       null,
                                       a_tournament) as lg_b,
             startouch.mis.getLGBHint as lg_b_hint,
             startouch.mis.getLGTheoBetValue(null,
                                             a_member_link,
                                             null,
                                             a_tournament) as theoret_bet,
             startouch.mis.getLGTheoBetHint as theoret_bet_hint,
             startouch.mis.getLGTheoLossValue(null,
                                              a_member_link,
                                              null,
                                              a_tournament) as theoret_loss,
             startouch.mis.getLGTheoLossHint as theoret_loss_hint
      /*,startouch.main.getCustomerChipsBuy(a_member_link,
      lvGamedate,
      lvGamedate) as chips_buy_cage*/
        from (select nvl(sum(trak_detail.play_time), 0) as play_time,
                     nvl(sum(trak_detail."DROP"), 0) AS "DROP",
                     nvl(sum(trak_detail.drop_plaques), 0) as drop_plaques,
                     nvl(sum(trak_detail.cash_chips), 0) as chips_in,
                     nvl(sum(trak_detail.cash_out), 0) as cash_out,
                     --nvl(sum(trak_detail.actual_loss), 0) as actual_loss_a,
                     nvl(sum(trak_detail.bet), 0) as actual_bet,
                     nvl(sum(trak_detail.win), 0) as win,
                     --nvl(sum(trak_detail.act_loss_betwin), 0) as actual_loss_b,
                     nvl(sum(trak_detail.cash_out_cage), 0) as cash_out_cage,
                     --nvl(sum(trak_detail.chips_hold_a), 0) as chips_hold_a,
                     --nvl(sum(trak_detail.chips_hold_b), 0) as chips_hold_b,
                     nvl(sum(trak_detail.chips_given), 0) as chips_given,
                     nvl(sum(trak_detail.roll_buy), 0) as roll_buy,
                     nvl(sum(trak_detail.roll_return), 0) as roll_return,
                     
                     nvl(sum(nvl(trak_detail.plaques_out_cage, 0) +
                             nvl(trak_detail.plaques_b_out_cage, 0)),
                         0) as plaques_out_cage,
                     
                     nvl(sum(nvl(trak_detail.plaques_in_cage, 0) +
                             nvl(trak_detail.plaques_b_in_cage, 0)),
                         0) as plaques_in_cage,
                     
                     nvl(sum(nvl(trak_detail.plaques_out_cage, 0) +
                             nvl(trak_detail.plaques_b_out_cage, 0) -
                             nvl(trak_detail.plaques_in_cage, 0) -
                             nvl(trak_detail.plaques_b_in_cage, 0)),
                         0) as plaques_hold
              
                from logismos.trak_detail trak_detail
               where trak_detail.memb_linkid = a_member_link
                 and trak_detail.campaign_id = a_tournament) t;
  
  exception
    when no_data_found then
      null;
  end member_report_for_tour;

  /*-------------------------------------------------------------------------------------------------------
  procedure rolling_roll(a_player_id   in number,
                         a_campaign_id in number,
                         ret_val       out sys_refcursor) is
  begin
  
    open ret_val for
      select t.memb_linkid,
             t.campaign_id,
             t.user_id,
             t.gamedate,
             t.actualdate,
             t.roll_buy,
             t.roll_return,
             t.roll_buy - t.roll_return as line_total,
             sum(t.roll_buy - t.roll_return) over(order by t.actualdate) as running_total
        from logismos.trak_detail t
       where t.memb_linkid = a_player_id
         and t.campaign_id = a_campaign_id
         and (nvl(t.roll_buy, 0) <> 0 or nvl(t.roll_return, 0) <> 0)
       order by t.actualdate desc;
  
  end rolling_roll;*/

  -------------------------------------------------------------------------------------------------------
  procedure rolling_roll(a_player_id   in number,
                         a_campaign_id in number,
                         ret_val       out sys_refcursor) is
  begin
  
    open ret_val for
      select t.memb_linkid,
             t.campaign_id,
             t.user_id,
             t.gamedate,
             t.actualdate,
             t.roll_buy,
             t.roll_return,
             t.roll_buy - t.roll_return as line_total,
             sum(t.roll_buy - t.roll_return) over(order by t.actualdate) as running_total
        from (select t.gamedate,
                     t.actualdate,
                     t.memb_linkid,
                     t.campaign_id,
                     upper(t.user_id) as user_id,
                     t.roll_buy,
                     t.roll_return
                from logismos.trak_detail t
               where t.memb_linkid = a_player_id
                 and t.campaign_id = a_campaign_id
                 and (nvl(t.roll_buy, 0) <> 0 or nvl(t.roll_return, 0) <> 0)
              
              union all
              
              select t.game_date as gamedate,
                     t.entered_at as actualdate,
                     t.player_master_link_id as memb_linkid,
                     nvl(t2.tournament_id, a_campaign_id) as campaign_id,
                     upper(t.entered_by) as user_id,
                     t.value as roll_buy,
                     0 as roll_return
                from startouch.rolling_bet t
                left join startouch.now_playing t2
                  on t2.unique_player_id = t.unique_player_id
               where t.player_master_link_id = a_player_id
                 and not exists (select 0
                        from startouch.rolling_bet t2
                       where t2.id = -t.id)
                 and t.id > 0
              
              union all
              
              select t.game_date as gamedate,
                     t.entered_at as actualdate,
                     t.player_master_link_id as memb_linkid,
                     nvl(t2.tournament_id, a_campaign_id) as campaign_id,
                     upper(t.entered_by) as user_id,
                     0 as roll_buy,
                     t.value as roll_return
                from startouch.rolling_return t
                left join startouch.now_playing t2
                  on t2.unique_player_id = t.unique_player_id
               where t.player_master_link_id = a_player_id
                 and not exists (select 0
                        from startouch.rolling_return t2
                       where t2.id = -t.id)
                 and t.id > 0) t
       order by t.actualdate desc;
  
  end rolling_roll;

-- Package initialization
begin
  ivUnknownPlayerID := getUnknownPlayerID();
end main;
/
