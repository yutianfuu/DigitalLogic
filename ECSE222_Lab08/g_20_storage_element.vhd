library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g_20_storage_element is
 port( A : 		in std_logic;
       reset: 	in std_logic;
		 set: 	in std_logic;
		 B: 		out std_logic);
end g_20_storage_element;

ARCHITECTURE behavioral OF g_20_storage_element IS
  signal sig:std_logic;

BEGIN
   process(sig, reset,set)
	
	BEGIN
   if reset ='0' then
	  sig <='0';
	 elsif set ='0' then
	  sig<='1';
	 elsif RISING_EDGE(A) then
	  sig <= not (sig);
	 end if;
   END PROCESS ;
	B<= sig;
END behavioral;
	  