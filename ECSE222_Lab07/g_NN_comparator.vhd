library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g_NN_comparator is
 port( A,B : in std_logic_vector(3 downto 0);
       AgtBplusOne: out std_logic;
		 AgteBplusOne: out std_logic;
		 AltBplusOne : out std_logic;
		 AlteBplusOne: out std_logic;
		 AeqBplusOne: out std_logic;
		 overflow: out std_logic);
end g_NN_comparator;
ARCHITECTURE behavioral OF g_NN_comparator IS

  signal BplusOne: std_logic_vector(4 downto 0);
  --signal Afivebit: std_logic_vector(4 downto 0);
  
BEGIN
	BplusOne <= STD_LOGIC_VECTOR( UNSIGNED( '0' & B ) + 1 );
      process (A,B) 

	   begin
		--Afivebit(4) <= '0';
		--Afivebit(3) <= A(3);
		--Afivebit(2) <=A(2);
		--Afivebit(1) <= A(1);
		--Afivebit(0) <= A(0);
		
	    if BplusOne(4) = '1' then
		    AgtBplusOne <='0';
		    AgteBplusOne <= '0';
		    AltBplusOne <= '0';
		    AlteBplusOne <='0';
		    AeqBplusOne <='0';
			 overflow <='1';
		 ELSIF A = BplusOne  then
		     AeqBplusOne <='1';
			  overflow <='0';
			  AgtBplusOne <='0';
		     AgteBplusOne <= '1';
		     AltBplusOne <= '0';
		     AlteBplusOne <='1';
		 ELSIF A < BplusOne then
		     AeqBplusOne <='0';
			  overflow <='0';
		     AgtBplusOne <='0';
		     AgteBplusOne <= '0';
		     AltBplusOne <= '1';
		     AlteBplusOne <='1';
		ElSIF A > BplusOne then
		     AeqBplusOne <='0';
			  overflow <='0';
		     AgtBplusOne <='1';
		     AgteBplusOne <= '1';
		     AltBplusOne <= '0';
		     AlteBplusOne <='0';	 
		 
		 END if;
   END PROCESS ;
END behavioral;