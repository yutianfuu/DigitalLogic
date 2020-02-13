library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity g20_wrapper is
 port( enable : 		in std_logic;
       reset: 	in std_logic;
		 clk: 	in std_logic;
		 HEX0: 	out std_logic_vector(6 downto 0));
end g20_wrapper;
Architecture LogicFun of g20_wrapper is
component g20_clock_divider
     port( enable : 	in std_logic;
           reset: 	in std_logic;
		     clk: 	in std_logic;
		    en_out: out std_logic);
end COMPONENT;

component g20_counter 
   port( enable : 		in std_logic;
         reset: 	in std_logic;
		   clk: 	in std_logic;
		   count: 		out std_logic_vector(2 downto 0));
end component;

component segment_decoder
    PORT ( code: in std_logic_vector(3 downto 0);
           segments_out :out std_logic_vector(6 downto 0));
end component;
signal interout:std_logic;
signal tempout:std_logic_vector(2 downto 0);
signal convert:std_logic_vector(3 downto 0);
begin
   u1: g20_clock_divider PORT MAP ( enable => enable,reset =>reset,clk =>clk,en_out =>interout);
	u2: g20_counter PORT MAP (enable=>interout,reset=>reset,clk=>clk,count => tempout);
	convert <=  '0' & tempout;
   u3: segment_decoder PORT MAP(code=>convert,segments_out =>HEX0);

end LogicFun;


