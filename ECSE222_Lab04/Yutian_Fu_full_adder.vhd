library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY Yutian_Fu_full_adder IS
     Port(a     : in STD_LOGIC;
	       b      : in STD_LOGIC;
			 c_in    : in STD_LOGIC;
			 s    : out STD_LOGIC;
			 c_out   : out STD_LOGIC);
END Yutian_Fu_full_adder;
ARCHITECTURE LogicFunc OF Yutian_Fu_full_adder IS
BEGIN
    c_out <= (a AND b) OR (a AND c_in) OR (b AND c_in);
	 s <= a XOR b XOR c_in;
  		 
END LogicFunc;