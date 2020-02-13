-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/12/2019 17:38:20"
                                                            
-- Vhdl Test Bench template for design  :  Yutian_Fu_ripple_carry_adder_structural
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;                                

ENTITY Yutian_Fu_ripple_carry_adder_structural_vhd_tst IS
END Yutian_Fu_ripple_carry_adder_structural_vhd_tst;
ARCHITECTURE Yutian_Fu_ripple_carry_adder_structural_arch OF Yutian_Fu_ripple_carry_adder_structural_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT Yutian_Fu_ripple_carry_adder_structural
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	S : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Yutian_Fu_ripple_carry_adder_structural
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	S => S
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN   
   FOR i IN 0 to 15 LOOP
		 A <= std_logic_vector(to_unsigned(i,4));
	    FOR j IN 0 to 15 LOOP
		     B <= std_logic_vector(to_unsigned(j,4));
	        WAIT FOR 10 ns;
		 END LOOP;
   END LOOP;

WAIT;                                                                                                              
END PROCESS always;                                          
END Yutian_Fu_ripple_carry_adder_structural_arch;
