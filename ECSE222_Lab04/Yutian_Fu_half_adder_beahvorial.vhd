library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY Yutian_Fu_half_adder_beahvorial IS
     Port(a     : in bit;
	       b      : in bit;
			 s     : out bit;
			 c     : out bit);
END Yutian_Fu_half_adder_beahvorial;
ARCHITECTURE behavioral OF Yutian_Fu_half_adder_beahvorial IS
BEGIN
    process(a,b)
	 BEGIN
	     if a & b ="00"then
	         s <='0';
	         c <='0';
	     end if;
	     if a & b="01"  then
	         s <='1';
	         c <='0';
		  end if;
		  if a & b="10" then
		      s <='1';
	         c <='0';
		  end if;
	     if a & b="11" then
	         s <='0';
	         c <='1';
	     end if;	  
	     end process; 
END behavioral;