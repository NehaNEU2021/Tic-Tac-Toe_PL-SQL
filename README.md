# Tic-Tac-Toe_PL-SQL
Tic-Tac-toe game
--Neha
set serveroutput on;
create table table_AA( Place varchar(6),column1 varchar(1), column2 varchar(1), column3 varchar(1));
insert into table_AA values ('rowno1','','','_');
insert into table_AA values ('rowno2','','','_');
insert into table_AA values ('rowno3','','','_');



create or replace procedure Game_result (player_ID IN varchar2, player_place  IN number , player_move IN varchar2)
as
    
    Place_1 varchar(1);
    place_2 varchar(1);
    place_3 varchar(1);
    place_4 varchar(1);
    place_5 varchar(1);
    place_6 varchar(1);
    place_7 varchar(1);
    place_8 varchar(1);
    place_9 varchar(1);
    place_no_value varchar(1);

    game_will_continue varchar(40);
    game_draw varchar(40);
    
--- Start
 






BEGIN




    game_will_continue:='Yes';
    game_draw:='No';
    if (player_place=1)
    THEN
        select column1 into place_no_value from table_AA where Place='rowno1';
    END IF;
    if (player_place=2)
    THEN
        select column2 into place_no_value from table_AA where Place='rowno1';
    END IF;
    if (player_place=3)
    THEN
        select column3 into place_no_value from table_AA where Place='rowno1';
    END IF;

    
       if (player_place=4)
    THEN
        select column1 into place_no_value from table_AA where Place='rowno2';
    END IF;
    if(player_place=5)
    THEN
        select column2 into place_no_value from table_AA where Place='rowno2';
    END if;
    if(player_place=6)
    THEN
        select column3 into place_no_value from table_AA where Place='rowno2';
    END IF;
    if(player_place=7)
    THEN
       select column1 into place_no_value from table_AA where Place='rowno3';
    END If;
    if(player_place=8)
    THEN
        select column2 into place_no_value from table_AA where Place='rowno3';
    END IF;
    
    if(player_place=9)
    THEN
        select column3 into place_no_value from table_AA where Place='rowno3';
    END IF;



    
    if(player_place=1)
    THEN
        update table_AA set column1=player_move where Place='rowno1';
    end if;
 
    if(player_place=2)
    THEN
        update table_AA set column2=player_move where Place='rowno1';
    end if;
    if(player_place=3)
    THEN
       update table_AA set column3=player_move where Place='rowno1';
    end if;
    if(player_place=4)
    THEN
         update table_AA set column1=player_move where Place='rowno2';
    end if;
    if(player_place=5)
    THEN
        update table_AA set column2=player_move where Place='rowno2';
    end if;
    if(player_place=6)
    THEN
       update table_AA set column3=player_move where Place='rowno2';
    end if;
    if(player_place=7)
    THEN
        update table_AA set column1=player_move where Place='rowno3';
    end if;
    if(player_place=8)
    THEN
        update table_AA set column2=player_move where Place='rowno3';
    end if;
    if(player_place=9)
    THEN
        update table_AA set column3=player_move where Place='rowno3';
    end if;


 
   
    select column1 into place_1 from table_AA  where Place ='rowno1';
    select column2 into place_2 from table_AA  where Place ='rowno1';
    select column3 into place_3 from table_AA  where Place ='rowno1';
    select column1 into place_4 from table_AA  where Place ='rowno2';
    select column2 into place_5 from table_AA  where Place ='rowno2';
    select column3 into place_6 from table_AA  where Place ='rowno2';
    select column1 into place_7 from table_AA  where Place ='rowno3';
    select column2 into place_8 from table_AA  where Place ='rowno3';
    select column3 into place_9 from table_AA  where Place ='rowno3';

--Horizontal win case   
    
    if(place_1 = place_2 and place_1 = place_3 and place_1!='_')
    THEN
        dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';
    END IF;
    if(place_4= place_5 and place_4 = place_6 and place_4!='_')
    THEN
        dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';
 
    END IF;
    if(place_7 = place_8 and place_7 = place_9 and place_7!='_')
    THEN
         dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';
 
 

 
 
    END IF;
    
    
     --- Vertical win case
    if(place_1 = place_4 and place_1 = place_7 and place_1!='_')
    THEN
        dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';
 
    END IF;
    if(place_2 = place_5 and place_2 = place_8 and place_2!='_')
    THEN
        dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';
 
    END IF;
    if(place_3 = place_6 and place_6 = place_9 and place_3!='_')
    THEN
         dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';


 
 
    END IF;
    
     -- diagonal win case
    if(place_1 = place_5 and place_5 = place_9 and place_1!='_')
    THEN
        dbms_output.put_line(player_id || ' You Win');
        game_will_continue:='No';
 
    END IF;
    if(place_3 = place_5 and place_3 = place_7 and place_3!='_')
    THEN
         dbms_output.put_line(player_id || ' You Win');
         game_will_continue:='No';
    END IF;
     
    if(game_will_continue='Yes')
    THEN  
        if(place_1 !='' and place_2!='' and place_3!='' and place_4!='' 
        and place_5!= '' and place_5!= '' and place_7!='' 
        and place_8!='' and place_9!='_')
        THEN
            dbms_output.put_line('position is not reachable and the game has drawn');
            game_draw:='Yes';
        END IF;
        if(game_draw!='Yes')
        THEN
            dbms_output.put_line('position is reachable and the game continues');
        end if;
     end if;
dbms_output.put_line(place_1 ||' '|| place_2 || ' ' || place_3);
dbms_output.put_line(place_4 ||' '|| place_5 || ' ' || place_6);
dbms_output.put_line(place_7 ||' '|| place_8 || ' ' || place_9);


end;

--Usecases1 player_1 wins

exec Game_result_reset;
exec Game_result('Player_1', 5,'X');
exec Game_result('Player_2', 3,'O');
exec Game_result('Player_1', 9,'X'); 
exec Game_result('Player_2', 2,'O');
exec Game_result('Player_1', 1,'X');

--Usercase2 Draw:
exec Game_result_reset;
exec Game_result('Player_1', 5,'X');
exec Game_result('Player_2', 3,'O');
exec Game_result('Player_1', 9,'x'); 
exec Game_result('Player_2', 1,'O');
exec Game_result('Player_1', 2,'X');
exec Game_result('Player_2', 8,'O');
exec Game_result('Player_1', 4,'X'); 
exec Game_result('Player_2', 6,'O');
exec Game_result('Player_1', 7,'X');



--Test_case_1















player_1 wins

exec Game_result_reset;
exec Game_result('Player_1', 5,'X');
exec Game_result('Player_2', 3,'O');
exec Game_result('Player_1', 9,'X'); 
exec Game_result('Player_2', 2,'O');
exec Game_result('Player_1', 1,'X');

---Test_case_2













exec Game_result_reset;
exec Game_result('Player_1', 5,'X');
exec Game_result('Player_2', 3,'O');
exec Game_result('Player_1', 9,'x'); 
exec Game_result('Player_2', 1,'O');
exec Game_result('Player_1', 2,'X');
exec Game_result('Player_2', 8,'O');
exec Game_result('Player_1', 4,'X'); 
exec Game_result('Player_2', 6,'O');
exec Game_result('Player_1', 7,'X');





