library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Yutian_Fu_ripple_carry_adder_behavioral is
     Port(A     : in STD_LOGIC_VECTOR (3 DOWNTO 0);
	       B      : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			 S   : out STD_LOGIC_VECTOR(4 DOWNTO 0));
end Yutian_Fu_ripple_carry_adder_behavioral;
ARCHITECTURE LogicFunc OF Yutian_Fu_ripple_carry_adder_behavioral IS
   COMPONENT Yutian_Fu_half_adder_beahvorial
	Port(a     : in STD_LOGIC;
	       b      : in STD_LOGIC;
			 s     : out STD_LOGIC;
			 c     : out STD_LOGIC);
   END COMPONENT;
    
	COMPONENT Yutian_Fu_full_adder_beahvioral
	Port(a     : in STD_LOGIC;
	       b      : in STD_LOGIC;
			 c_in    : in STD_LOGIC;
			 s    : out STD_LOGIC;
			 c_out   : out STD_LOGIC);
	END COMPONENT;
	signal d: std_logic_vector(2 DOWNTO 0);
	
BEGIN
    u9: Yutian_Fu_half_adder_beahvorial PORT MAP (b=>A(0),a=>B(0),s=>S(0),c=>d(0));
	 u8: Yutian_Fu_full_adder_beahvioral PORT MAP (c_in =>d(0),a=>B(1),b=>A(1),c_out =>d(1),s=>S(1));
	 u7: Yutian_Fu_full_adder_beahvioral PORT MAP (c_in =>d(1),a=>B(2),b=>A(2),c_out =>d(2),s=>S(2));
	 u6: Yutian_Fu_full_adder_beahvioral PORT MAP (c_in =>d(2),a=>B(3),b=>A(3),c_out =>S(4),s=>S(3));
	 
	
END LogicFunc;