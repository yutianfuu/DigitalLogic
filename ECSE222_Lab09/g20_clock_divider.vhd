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
	--signal count_binary: std_logic_vector(32 downto 0);
	signal inter:std_logic;
 BEGIN
    process	(enable,clk,reset)
	 begin
	    inter <='0';
		--count_binary <= conv_std_logic_vector (count, 32);
		--count_binary <= to_integer(unsigned(count));
	    --if rising_edge(clk) then
		  if  reset ='1' then
		     count <= 50000000;
			 inter <='0';
		  elsif RISING_EDGE(clk) then		    
		     
		     if enable = '1' then
			     count <=count-1;
				else
				   count <= count;
				end if;
		  end if;
		  if count =0  then
		   inter<='1';
			count<=50000000;
			end if;
		-- end if;
	 end process;
	en_out <=inter;
end behavioral;