----------------------------------------------------------------------------------
-- COMPANY:		Ruhr University Bochum
-- AUTHOR:		Amir Moradi
-- TOPIC:               AES Sbox CMS ( http://eprint.iacr.org/2016/631 )
----------------------------------------------------------------------------------
-- Copyright (c) Amir Moradi
-- All rights reserved.

-- BSD-3-Clause License
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--     * Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--     * Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--     * Neither the name of the copyright holder, their organization nor the
--       names of its contributors may be used to endorse or promote products
--       derived from this software without specific prior written permission.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--library work;
use work.masked_aes_pkg.all;

entity sbox is
    generic (
            order    : integer := 1
    );
    Port (  sboxIn   : in t_shared_gf8(order downto 0);
            randomS2 : in randomStage2((order+1)*(order+1) -1 downto 0);
            randomS3 : in randomStage3((order+1)*(order+1) -1 downto 0);
            randomS4 : in randomStage4((order+1)*(order+1) -1 downto 0);                                  
            randomS5 : in randomStage5((order+1)*(order+1) -1 downto 0);
            clk      : in STD_LOGIC;
            rst_i      : in STD_LOGIC;
            sboxOut  : out t_shared_gf8(order downto 0)
    );
end sbox;

architecture Behavioral of sbox is
    signal stage1Out: t_shared_gf8(order downto 0);
    signal stage2Out: gf12(order downto 0);
    signal stage3Out: stage3OutType(order downto 0);
    signal stage4Out: stage4OutType(order downto 0);
    signal stage5Out: stage5OutType(order downto 0);
    signal stage6Out: t_shared_gf8(order downto 0);
    signal regOut1, regOut2 : t_shared_gf8(order downto 0);


begin
    -- stage 1 
    s1 : entity work.stage1 generic map (order => order)
    port map (
       stage1In  => sboxIn,
       clk       => clk,
       stage1Out => stage1Out
    );
    
    -- stage 2
    -- map random to array
    s2: entity work.stage2 generic map (order => order) 
    port map (
       stage2In    => stage1Out,
       random      => randomS2,
       clk         => clk,
       stage2Out   => stage2Out
    );
    -- stage 3
    s3: entity work.stage3 generic map (order => order) 
    port map (
       stage3In    => stage2Out,
       random      => randomS3,
       clk         => clk,
       stage3Out   => stage3Out
    );
    -- stage 4
    s4: entity work.stage4 generic map (order => order) 
    port map (
       stage4In    => stage3Out,
       random      => randomS4,
       clk         => clk,
       stage4Out   => stage4Out
    );    
    -- stage 5    
    s5: entity work.stage5 generic map (order => order) 
    port map (
       stage5In    => stage4Out,
       random      => randomS5,
       clk         => clk,
       stage5Out   => stage5Out
    );    
    
    -- Linear mapping at output
    outputMappings: for i in order downto 0 generate
       s6 : entity work.linear_map2
         generic map (
           MATRIX_SEL => "MX")
         port map (
           DataInxDI  => stage5Out(i),
           DataOutxDO => stage6Out(i)
       );
       -- outputs, only xor one share with 0x63
       output1: if i = 0 generate
            sboxOut(0) <= regOut2(0) xor x"63";
       end generate;
       output2: if i /= 0 generate
            sboxOut(i) <= regOut2(i);
       end generate;
    end generate;
    
    -- 2 dummy registers
    -- Register
    registers : process(clk) is begin
       if (rising_edge(clk)) then 
           for i in order downto 0 loop
               regOut1(i) <= stage6Out(i);
               regOut2(i) <= regOut1(i);
           end loop;
       end if;
    end process;

end Behavioral;
