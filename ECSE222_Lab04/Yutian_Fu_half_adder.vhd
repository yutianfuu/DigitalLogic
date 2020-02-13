library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY Yutian_Fu_half_adder IS
     Port(a     : in STD_LOGIC;
	       b      : in STD_LOGIC;
			 s     : out STD_LOGIC;
			 c     : out STD_LOGIC);
END Yutian_Fu_half_adder;
ARCHITECTURE LogicFunc OF Yutian_Fu_half_adder IS
BEGIN
	 c <= a AND b;
	 s <= a XOR b;
	 
END LogicFunc;