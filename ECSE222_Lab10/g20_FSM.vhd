library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g20_FSM is
 port( seq: 	in std_logic;
       enable: in std_logic;
		 reset: in std_logic;
		 clk: in std_logic;
		 out_1: out std_logic;--out_1 is to detect 0010;
		 out_2: out std_logic);--out_2 is "1011"
end g20_FSM;
Architecture behavior of g20_FSM is
  CONSTANT signal_reset_1: std_logic_vector(3 downto 0):="0000";
  CONSTANT one_bit_detector1: std_logic_vector(3 downto 0) := "0001";
  CONSTANT two_bit_detector1: std_logic_vector(3 downto 0) := "0010";
  CONSTANT three_bit_detector1: std_logic_vector(3 downto 0) := "0011";
  CONSTANT four_bit_detector1: std_logic_vector(3 downto 0) := "0100";
  CONSTANT one_bit_detector2: std_logic_vector(3 downto 0) := "0101";
  CONSTANT two_bit_detector2: std_logic_vector(3 downto 0) := "0110";
  CONSTANT three_bit_detector2: std_logic_vector(3 downto 0) := "0111";
  CONSTANT four_bit_detector2: std_logic_vector(3 downto 0) := "1000";
  CONSTANT signal_reset_2: std_logic_vector(3 downto 0):="1001";
  
 
  
  
  signal next1:std_logic_vector(3 downto 0);
  signal next2:std_logic_vector(3 downto 0);
  signal pres1:std_logic_vector(3 downto 0);
  signal pres2:std_logic_vector(3 downto 0);

BEGIN
   PROCESS (seq, pres1)
	begin
	   C1:case pres1 is
		 when signal_reset_1 =>
		    if seq='0' then next1 <= one_bit_detector1;
			 else next1 <=signal_reset_1;
			 end if;
		when one_bit_detector1 =>
		   if seq='0' then next1 <= two_bit_detector1;
			else next1 <=signal_reset_1;
			end if;
		when two_bit_detector1 =>
		   if seq='0' then next1 <= two_bit_detector1;
			else next1 <=three_bit_detector1;
			end if;
		when three_bit_detector1=>
		   if seq='0' then next1 <= four_bit_detector1;
			else next1 <=signal_reset_1;
			end if;
		when four_bit_detector1=>
		   if seq='0' then next1 <= two_bit_detector1;
			else next1 <=signal_reset_1;
			end if;
		when OTHERS =>
		    next1 <=signal_reset_1;
		end case C1;
	end process;
	
	PROCESS (clk,reset)
   begin
      if reset='0' then
	      pres1<=signal_reset_1;
			
	   elsif  (clk'EVENT and clk='1') then
				pres1 <= next1;
			
		end if;
	end process;
	
	out_1 <= '1' when pres1 <= four_bit_detector1 else '0';
		
	PROCESS (seq, pres2)
	begin
		C2:case pres2 is
		when signal_reset_2 =>
		   if seq='0' then next2 <= signal_reset_2;
			else next2 <=one_bit_detector2;
			end if;
		when one_bit_detector2 =>
		   if seq='0' then next2 <= two_bit_detector2;
			else next2 <=one_bit_detector2;
			end if;
		when two_bit_detector2 =>
		   if seq='0' then next2 <= signal_reset_2;
			else next2 <=three_bit_detector2;
			end if;
		when three_bit_detector2=>
		   if seq='0' then next2 <= two_bit_detector2;
			else next2 <=four_bit_detector2;
			end if;
		when four_bit_detector2=>
		   if seq='0' then next2 <= two_bit_detector2;
			else next2 <=signal_reset_2;
			end if;
		when OTHERS =>
		   next2<=signal_reset_2;
		end case C2;
	end process;
	
	PROCESS (clk,reset)
   begin
      if reset='0' then
	      pres2<=signal_reset_2;
			
	   elsif  (clk'EVENT and clk='1') then
				pres2 <= next2;
			
		end if;
	end process;
   
	out_2 <= '1' when pres2 <= four_bit_detector2 else '0';
	
	
end behavior;
