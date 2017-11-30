----------------------------------------------------------------------------------
-- Company: 		 California Optical Engineering, Inc.
-- Engineer: 		 D. Schaafsma
-- 
-- Create Date:    16:13:14 03/09/2010 
-- Design Name: 
-- Module Name:    sseg_mux4D - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    seven-segment 4-digit multiplexer/decoder
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sseg_mux4D is
	PORT (
		hexD, hexC, hexB, hexA : IN std_logic_vector (3 downto 0);
		sel : IN std_logic_vector (0 to 1);
		dp_in : IN std_logic_vector (3 downto 0);
		rb_in : IN std_logic;
		anO : OUT std_logic_vector (3 downto 0);
		ssegO : OUT std_logic_vector (7 downto 0)
	);
end sseg_mux4D;

architecture Behavioral of sseg_mux4D is

--	component SSD_1dig
--	   port ( 
--			hexD: in std_logic_vector(3 downto 0);
--			dp_in: in std_logic;
--			sseg: out std_logic_vector(7 downto 0)		
--		);
		
--	end component;

	signal hexO	: std_logic_vector (3 downto 0);
	signal dpO	: std_logic;


begin

--	G1: SSD_1dig port map (hexO, dpO, ssegO);

	digit_mux : process(sel, hexA, hexB, hexC, hexD, dp_in, rb_in)
	begin
	

		if (rb_in > '0') then	-- ripple blank

			anO <= "1111";
			hexO <= "0000";
			dpO <= '1';
		
		else

			case sel is
				when "00" =>
					anO <= "1110";
					hexO <= hexA;
					dpO <= dp_in(0);
				when "01" =>
					anO <= "1101";
					hexO <= hexB;
					dpO <= dp_in(1);
				when "10" =>
					anO <= "1011";
					hexO <= hexC;
					dpO <= dp_in(2);
				when others =>
					anO <= "0111";
					hexO <= hexD;
					dpO <= dp_in(3);
			end case;

		end if;
		
--		case hexO is
--			when "0000" =>
--				ssegO(6 downto 0) <= "0000001";
--			when "0001" =>
--				ssegO(6 downto 0) <= "1001111";
--			when "0010" =>
--				ssegO(6 downto 0) <= "0010010";
--			when "0011" =>
--				ssegO(6 downto 0) <= "0000110";
--			when "0100" =>
--				ssegO(6 downto 0) <= "1001100";
--			when "0101" =>
--				ssegO(6 downto 0) <= "0100100";
--			when "0110" =>
--				ssegO(6 downto 0) <= "0100000";
--			when "0111" =>
--				ssegO(6 downto 0) <= "0001111";
--			when "1000" =>
--				ssegO(6 downto 0) <= "0000000";
--			when "1001" =>
--				ssegO(6 downto 0) <= "0000100";
--			when "1010" =>
--				ssegO(6 downto 0) <= "0001000";
--			when "1011" =>
--				ssegO(6 downto 0) <= "1100000";
--			when "1100" =>
--				ssegO(6 downto 0) <= "0110001";
--			when "1101" =>
--				ssegO(6 downto 0) <= "1000010";
--			when "1110" =>
--				ssegO(6 downto 0) <= "0110000";
--			when "1111" =>
--				ssegO(6 downto 0) <= "0111000";
--			when others =>
--				ssegO(6 downto 0) <= "0111000";
--				
--		end case;
--						
--		ssegO(7) <= not dpO;
		
	end process;
	
	with hexO select
		ssegO(6 downto 0) <=
			"0000001" when "0000",
			"1001111" when "0001",
			"0010010" when "0010",
			"0000110" when "0011",
			"1001100" when "0100",
			"0100100" when "0101",
			"0100000" when "0110",
			"0001111" when "0111",
			"0000000" when "1000",
			"0000100" when "1001",
			"0001000" when "1010",
			"1100000" when "1011",
			"0110001" when "1100",
			"1000010" when "1101",
			"0110000" when "1110",
			"0111000" when others;
			
		ssegO(7) <= not dpO;

end Behavioral;


--entity SSD_1dig is
--    Port ( 
--		hexD: in std_logic_vector(3 downto 0);
--		dp_in: in std_logic;
--		sseg: out std_logic_vector(7 downto 0)
--	);
--end SSD_1dig;
--
--architecture Behavioral of SSD_1dig is
--
--begin
--	with hexD select
--		sseg(6 downto 0) <=
--			"0000001" when "0000",
--			"1001111" when "0001",
--			"0010010" when "0010",
--			"0000110" when "0011",
--			"1001100" when "0100",
--			"0100100" when "0101",
--			"0100000" when "0110",
--			"0001111" when "0111",
--			"0000000" when "1000",
--			"0000100" when "1001",
--			"0001000" when "1010",
--			"1100000" when "1011",
--			"0110001" when "1100",
--			"1000010" when "1101",
--			"0110000" when "1110",
--			"0111000" when others;
--			
--		sseg(7) <= not dp_in;
--
--end Behavioral;
--
--
