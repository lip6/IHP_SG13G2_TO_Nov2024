
import os
from   pathlib import Path
import pdks.c4m_ihpsg13g2

pdks.c4m_ihpsg13g2.setup()

DOIT_CONFIG = { 'verbosity' : 2 }

from coriolis                               import CRL
from coriolis.designflow.task               import ShellEnv, Tasks
from coriolis.designflow.pnr                import PnR
from coriolis.designflow.yosys              import Yosys
from coriolis.designflow.blif2vst           import Blif2Vst
from coriolis.designflow.alias              import Alias
from coriolis.designflow.klayout            import Klayout
from coriolis.designflow.copy               import Copy
from coriolis.designflow.clean              import Clean
from pdks.c4m_ihpsg13g2.designflow.filler   import Filler
from pdks.c4m_ihpsg13g2.designflow.sealring import SealRing
from pdks.c4m_ihpsg13g2.designflow.drc      import DRC
from doDesign                               import scriptMain


PnR.textMode = True
pnrSuffix    = '_cts_r'
topName      = 'arlet6502'

ruleYosys = Yosys   .mkRule( 'yosys', 'Arlet6502.v' )
ruleB2V   = Blif2Vst.mkRule( 'b2v'  , 'arlet6502.vst', [ruleYosys], flags=0 )
# Rule for chip generation.
ruleSeal  = SealRing.mkRule( 'sealring', targets=[ 'chip_r_seal.gds' ] , size=[1414.0, 1414.0] )
rulePnR   = PnR     .mkRule( 'gds'  , [ 'chip_r.gds'
                                      , 'chip_r.vst'
                                      , 'chip_r.spi'
                                      , 'chip.vst'
                                      , 'chip.spi'
                                      , 'corona_cts_r.vst'
                                      , 'corona_cts_r.spi'
                                      , 'corona.vst'
                                      , 'corona.spi'
                                      , 'Arlet6502_cts.spi'
                                      , 'arlet6502_cts.vst' ]
                                      , [ruleB2V, ruleSeal]
                                    , scriptMain
                                    , topName=topName )
# Rule for block generation.
#rulePnR   = PnR     .mkRule( 'gds'  , [ 'Arlet6502_cts_r.gds'
#                                      , 'arlet6502_cts_r.vst'
#                                      , 'Arlet6502_cts_r.spi' ]
#                                      , [ruleB2V]
#                                    , scriptMain
#                                    , topName=topName )
#ruleFiller = Filler.mkRule( 'filler', depends=[ rulePnR.file_target(0) ]
#                                    , targets=[ '../gds/FMD_QNC_Arlet6502.gds' ]
#                                    , flags  =Filler.NoActiv
#                                    )
#ruleFMD = Copy.mkRule( 'fmd', '../gds/FMD_QNC_Arlet6502.gds', [rulePnR] )

ruleDrcMin  = DRC.mkRule( 'drc_min', rulePnR.file_target(0), DRC.Minimal )
ruleDrcMax  = DRC.mkRule( 'drc_max', rulePnR.file_target(0), DRC.Maximal )
ruleDrcC4M  = DRC.mkRule( 'drc_c4m', rulePnR.file_target(0), DRC.C4M )

# To run individual tools in stand-alone mode.
ruleCgt     = PnR    .mkRule( 'cgt' )
ruleKlayout = Klayout.mkRule( 'klayout', depends=rulePnR.file_target(0) )
ruleClean   = Clean  .mkRule( [ 'lefRWarning.log', 'cgt.log' ] )
