library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g20_clock_divider is
 port( enable : 	in std_logic;
       reset: 	in std_logic;
		 clk: 	in std_logic;
		 en_out: out std_logic);
end g20_clock_divider;
ARCHITECTURE behavioral OF g20_clock_divider IS	
	
   signal count :integer := 50000000;
	--signal count : integer range 1 to 50000000;
	signal inter: std_logic;
 
 BEGIN
    process	(enable,clk,reset)
	 begin
	    --inter <='0';
		
		  if  reset ='0' then
		     count <= 50000000;
			  inter <='0';
			  
		  elsif RISING_EDGE(clk) then		    
		     if enable = '1' then

					if count =1  then
						inter<='1';
						count<=50000000;
					else 
						count <=count-1;
						inter <='0';
					end if;
			  else
				   count <= count;
				end if;
		  end if;	
	 
	 end process;
	 
	en_out <=inter;
	
end behavioral;