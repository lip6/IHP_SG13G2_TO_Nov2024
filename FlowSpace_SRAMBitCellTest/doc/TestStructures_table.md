# Overview table of test structure variations

| Struct | Type | w pull-down | w pull-up | w pass-gate | SRAM rules | bit cell area |
|--------|------|------------|----------|------------|------------|--------------|
| SP00 | SP6T | 0.30µm | 0.30µm | 0.30µm | regular | 3.4668µm² |
| SP01 | SP6T | 0.30µm | 0.20µm | 0.30µm | regular | 3.4240µm² |
| SP02 | SP6T | 0.30µm | 0.15µm | 0.30µm | regular | 3.4240µm² |
| SP03 | SP6T | 0.30µm | 0.20µm | 0.20µm | regular | 3.4560µm² |
| SP04 | SP6T | 0.30µm | 0.15µm | 0.20µm | regular | 3.4560µm² |
| SP05 | SP6T | 0.20µm | 0.20µm | 0.20µm | regular | 3.5796µm² |
| SP06 | SP6T | 0.20µm | 0.15µm | 0.20µm | regular | 3.5796µm² |
| SP07 | SP6T | 0.30µm | 0.30µm | 0.30µm | this | 3.1886µm² |
| SP08 | SP6T | 0.30µm | 0.20µm | 0.30µm | this | 2.9960µm² |
| SP09 | SP6T | 0.30µm | 0.15µm | 0.30µm | this | 2.9746µm² |
| SP10 | SP6T | 0.30µm | 0.20µm | 0.20µm | this | 2.9960µm² |
| SP11 | SP6T | 0.30µm | 0.15µm | 0.20µm | this | 2.9746µm² |
| SP12 | SP6T | 0.20µm | 0.20µm | 0.20µm | this | 2.8890µm² |
| SP13 | SP6T | 0.20µm | 0.15µm | 0.20µm | this | 2.8676µm² |
| SP14 | SP6T | 0.30µm | 0.30µm | 0.30µm | old | 3.1886µm² |
| SP15 | SP6T | 0.30µm | 0.20µm | 0.30µm | old | 2.9746µm² |
| SP16 | SP6T | 0.30µm | 0.15µm | 0.30µm | old | 2.9746µm² |
| SP17 | SP6T | 0.30µm | 0.20µm | 0.20µm | old | 2.9746µm² |
| SP18 | SP6T | 0.30µm | 0.15µm | 0.20µm | old | 2.9746µm² |
| SP19 | SP6T | 0.20µm | 0.20µm | 0.20µm | old | 2.8676µm² |
| SP20 | SP6T | 0.20µm | 0.15µm | 0.20µm | old | 2.8676µm² |
| SP21 | Old SP6T | 0.30µm | 0.15µm | 0.30µm | old | 3.0067µm² |
| SP22 | SP6TClassic | 0.30µm | 0.30µm | 0.30µm | regular | 5.8420µm² |
| DP00 | DP8T | 0.30µm | 0.30µm | 0.30µm | regular | 5.2056µm² |
| DP01 | DP8T | 0.30µm | 0.20µm | 0.30µm | regular | 5.1624µm² |
| DP02 | DP8T | 0.30µm | 0.15µm | 0.30µm | regular | 5.1624µm² |
| DP03 | DP8T | 0.30µm | 0.20µm | 0.20µm | regular | 5.2192µm² |
| DP04 | DP8T | 0.30µm | 0.15µm | 0.20µm | regular | 5.2192µm² |
| DP05 | DP8T | 0.20µm | 0.20µm | 0.20µm | regular | 5.0844µm² |
| DP06 | DP8T | 0.20µm | 0.15µm | 0.20µm | regular | 5.0844µm² |
| DP07 | DP8T | 0.30µm | 0.30µm | 0.30µm | this | 4.8600µm² |
| DP08 | DP8T | 0.30µm | 0.20µm | 0.30µm | this | 4.6656µm² |
| DP09 | DP8T | 0.30µm | 0.15µm | 0.30µm | this | 4.6440µm² |
| DP10 | DP8T | 0.30µm | 0.20µm | 0.20µm | this | 4.5576µm² |
| DP11 | DP8T | 0.30µm | 0.15µm | 0.20µm | this | 4.5360µm² |
| DP12 | DP8T | 0.20µm | 0.20µm | 0.20µm | this | 4.3416µm² |
| DP13 | DP8T | 0.20µm | 0.15µm | 0.20µm | this | 4.3200µm² |
| DP14 | DP8T | 0.30µm | 0.30µm | 0.30µm | old | 4.7736µm² |
| DP15 | DP8T | 0.30µm | 0.20µm | 0.30µm | old | 4.5576µm² |
| DP16 | DP8T | 0.30µm | 0.15µm | 0.30µm | old | 4.5576µm² |
| DP17 | DP8T | 0.30µm | 0.20µm | 0.20µm | old | 4.4496µm² |
| DP18 | DP8T | 0.30µm | 0.15µm | 0.20µm | old | 4.4280µm² |
| DP19 | DP8T | 0.20µm | 0.20µm | 0.20µm | old | 4.2336µm² |
| DP20 | DP8T | 0.20µm | 0.15µm | 0.20µm | old | 4.2120µm² |

Columns in the table:
* Struct: label at top of bond pad frame
* Type: SRAM type and layout variation, values:
  * SP6T: single port cell, thin layout
  * Old SP6T: single port cell of existing SRAM blocks
  * SP6TClassic: single port cell, classic layout
  * DP8T: dual port cell, thin layout
* w pull-down, w pull-up, w pass-gate:
  width of resp. the pull-down, pull-up and pass-gate transistor; for all transistors
  the minimum length of 0.13µm has been used.
* SRAM rules: which rules that have been used. values:
  * regular: the regular rules without not using denser SRAM rules
  * this: proposed rules for new layout
  * old: rules used for cell in existing SRAM blocks
* bitcell area: area of the bit cell