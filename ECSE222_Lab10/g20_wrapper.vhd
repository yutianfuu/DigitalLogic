library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g20_wrapper is 
	Port (--enable	: in std_logic;
			reset		: in std_logic;
			clk		: in std_logic;
			HEX0		: out std_logic_vector (6 downto 0);
			HEX5		: out std_logic_vector (6 downto 0));
end g20_wrapper;

Architecture behavior of g20_wrapper is

component g20_clock_divider
 port( enable : 	in std_logic;
       reset: 	in std_logic;
		 clk: 	in std_logic;
		 en_out: out std_logic);
end component;

component ROM
port(clk : in std_logic;
     enable : in std_logic;
     reset : in std_logic;
     data : out std_logic);
end component;

component g20_sequence_detector
 port( seq: 	in std_logic;
       enable: in std_logic;
		 reset: in std_logic;
		 clk: in std_logic;
		 cnt_1: out std_logic_vector(2 downto 0);--cnt_1 is to detect "0010"
		 cnt_2: out std_logic_vector(2 downto 0));--cnt2 is to detect "1011"
end component;

component segment_decoder
     PORT ( code: in std_logic_vector(3 downto 0);
         segments_out :out std_logic_vector(6 downto 0));
END component;

-- intermediate signals
signal enable_start: std_logic:= '1';
signal intermediate_en: std_logic;
signal intermediate_data: std_logic;
signal count_1: std_logic_vector (2 downto 0);
signal count_2: std_logic_vector (2 downto 0);
signal intermediate_cnt_1: std_logic_vector (3 downto 0);
signal intermediate_cnt_2: std_logic_vector (3 downto 0);
signal output_1: std_logic_vector(6 downto 0);
signal output_2: std_logic_vector(6 downto 0);

BEGIN

	U1: g20_clock_divider PORT MAP (enable=>enable_start, reset=>reset, clk=>clk, en_out=>intermediate_en);
	 
	U2: ROM PORT MAP (clk=>intermediate_en, enable=>enable_start, reset=>reset, data=>intermediate_data);
	U3: g20_sequence_detector PORT MAP(seq=>intermediate_data, enable=>enable_start, reset=>reset, clk=> intermediate_en,
													cnt_1=>count_1, cnt_2=>count_2);
	
	intermediate_cnt_1 <= ('0' & count_1);
	intermediate_cnt_2 <= ('0' & count_2);
	
	U4: segment_decoder PORT MAP (code=>intermediate_cnt_1, segments_out=>output_1);
	U5: segment_decoder PORT MAP (code=>intermediate_cnt_2, segments_out=>output_2);
	
	HEX0<=output_1;
	HEX5<=output_2;
	
END behavior;