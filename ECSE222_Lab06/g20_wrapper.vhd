library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g20_wrapper is
 port( A,B : in std_logic_vector(3 downto 0);
       decoded_A : out std_logic_vector(6 downto 0);
		 decoded_B : out std_logic_vector(6 downto 0);
		 decoded_AplusB : out std_logic_vector (13 downto 0));
end g20_wrapper;

Architecture LogicFun of g20_wrapper is
Component Yutian_Fu_bcd_adder
     Port(a    : in STD_LOGIC_VECTOR (3 DOWNTO 0);
	       b      : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			 S   : out STD_LOGIC_VECTOR(3 DOWNTO 0);
			 C_out : out STD_LOGIC);
End component;

Component segment_decoder
    PORT ( code: in std_logic_vector(3 downto 0);
         segments_out :out std_logic_vector(6 downto 0));
END component;

signal d: std_logic_vector(6 DOWNTO 0);
signal sum: std_logic_vector(3 DOWNTO 0);
signal carry: std_logic;
signal convert: std_logic_vector(3 DOWNTO 0);


begin
    u1: Yutian_Fu_bcd_adder PORT MAP(a =>A,b =>B,s =>sum, C_out=>carry);
	 convert <= (3 downto 1 => '0') & carry;
	 u2:  segment_decoder PORT MAP (code =>A, segments_out=> decoded_A);
	 u3:  segment_decoder PORT MAP (code =>B, segments_out=> decoded_B);
	 u4:  segment_decoder PORT MAP  (code =>convert,segments_out => decoded_AplusB(13 downto 7));
	 u5:  segment_decoder PORT MAP ( code =>sum, segments_out => decoded_AplusB(6 downto 0));
end LogicFun;
