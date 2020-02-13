library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
entity Yutian_Fu_bcd_adder is
     Port(A     : in STD_LOGIC_VECTOR (3 DOWNTO 0);
	       B      : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			 S   : out STD_LOGIC_VECTOR(3 DOWNTO 0);
			 C_out : out STD_LOGIC);
end Yutian_Fu_bcd_adder;

ARCHITECTURE Behavior OF Yutian_Fu_bcd_adder is
   SIGNAL Z:STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL AD:STD_LOGIC;
	SIGnal K:STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
   Z <= ('0' & A) + B;
	AD<='1' WHEN Z>9 ELSE '0';
	k <= Z(3 DOWNTO 0);
	S <= k WHEN (AD ='0') ELSE k+6;
	C_out <= AD;
END Behavior;
	