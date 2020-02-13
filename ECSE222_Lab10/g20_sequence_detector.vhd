library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g20_sequence_detector is
 port( seq: 	in std_logic;
       enable: in std_logic;
		 reset: in std_logic;
		 clk: in std_logic;
		 cnt_1: out std_logic_vector(2 downto 0);--cnt_1 is to detect "0010"
		 cnt_2: out std_logic_vector(2 downto 0));--cnt2 is to detect "1011"
end g20_sequence_detector;

Architecture behavior of g20_sequence_detector is
component g20_counter 
   port( enable : 		in std_logic;
         reset: 	in std_logic;
		   clk: 	in std_logic;
		   count: 		out std_logic_vector(2 downto 0));
end component;
component g20_FSM
port( seq: 	in std_logic;
       enable: in std_logic;
		 reset: in std_logic;
		 clk: in std_logic;
		 out_1: out std_logic;--out_1 is to detect 0010;
		 out_2: out std_logic);--out_2 is "1011"
end COMPONENT;

signal en_1: std_logic;
signal en_2: std_logic;
signal count_1: std_logic_vector (2 downto 0);
signal count_2: std_logic_vector (2 downto 0);
signal enable_start: std_logic:= '1';

BEGIN
	
	U1: g20_FSM PORT MAP (seq=>seq,enable=>enable,
								reset=>reset,clk =>clk, out_1=>en_1, out_2=> en_2);
								
	U2: g20_counter PORT MAP (enable=>enable, reset=>reset, clk=>en_1, count=>count_1);
	U3: g20_counter PORT MAP (enable=>enable, reset=>reset, clk=>en_2, count=>count_2);
	
	
	cnt_1 <= count_1;
	cnt_2 <= count_2;
	
end behavior;

  