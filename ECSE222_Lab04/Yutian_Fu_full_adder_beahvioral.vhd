library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY Yutian_Fu_full_adder_beahvioral IS
     Port(a     : in STD_LOGIC;
	       b      : in STD_LOGIC;
			 c_in    : in STD_LOGIC;
			 s    : out STD_LOGIC;
			 c_out   : out STD_LOGIC);
END Yutian_Fu_full_adder_beahvioral;
ARCHITECTURE behavioral OF Yutian_Fu_full_adder_beahvioral IS
BEGIN
    process(a,b,c_in)
	 BEGIN
	    if (a ='0' and b='0' and c_in='0')then
		  s <='0';
		  c_out <='0';
		  END if;
		  if (a ='0' and b='0' and c_in='1')then
		  s <='1';
		  c_out <='0';
		  END if;
		  if (a ='0' and b='1' and c_in='0')then
		  s <='1';
		  c_out <='0';
		  END if;
		  if (a ='0' and b='1' and c_in='1')then
		  s <='0';
		  c_out <='1';
		  END if;
		  if (a ='1' and b='0' and c_in='0')then
		  s <='1';
		  c_out<='0';
		  END if;
		  if (a ='1' and b='0' and c_in='1')then
		  s <='0';
		  c_out <='1';
		  END if;
  		  if (a ='1' and b='1' and c_in='0')then
		  s <='0';
		  c_out<='1';
		  END if;
		  if (a ='1' and b='1' and c_in='1')then
		  s <='1';
		  c_out<='1';
		  END if;
		 END process;
END behavioral;