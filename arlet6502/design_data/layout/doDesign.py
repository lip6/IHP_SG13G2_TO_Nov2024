#!/usr/bin/env python3

import sys
import traceback
from   coriolis.Hurricane  import DbU, Breakpoint, PythonAttributes, Instance, Transformation
from   coriolis            import CRL, Cfg
from   coriolis.helpers    import loadUserSettings, setTraceLevel, trace, overlay, l, u, n
from   coriolis.helpers.io import ErrorMessage, WarningMessage, catch
from   coriolis            import plugins
from   coriolis.plugins.block.block          import Block
from   coriolis.plugins.block.configuration  import IoPin, GaugeConf
from   coriolis.plugins.block.spares         import Spares
from   pdks.c4m_ihpsg13g2.core2chip.sg13g2io import CoreToChip
from   coriolis.plugins.chip.configuration   import ChipConf
from   coriolis.plugins.chip.chip            import Chip


af = CRL.AllianceFramework.get()


def scriptMain ( **kw ):
    """The mandatory function to be called by Coriolis CGT/Unicorn."""
    global af
    gaugeName = None
    with overlay.CfgCache(priority=Cfg.Parameter.Priority.UserFile) as cfg:
        cfg.misc.catchCore              = False
        cfg.misc.info                   = False
        cfg.misc.paranoid               = False
        cfg.misc.bug                    = False
        cfg.misc.logMode                = True
        cfg.misc.verboseLevel1          = True
        cfg.misc.verboseLevel2          = False
        cfg.misc.minTraceLevel          = 16000
        cfg.misc.maxTraceLevel          = 17000
        cfg.anabatic.routingGauge       = None   # Trigger disk loading.
        gaugeName = cfg.anabatic.routingGauge

    hpitch       = 0
    vpitch       = 0
    routingGauge = af.getRoutingGauge( gaugeName )
    for layerGauge in routingGauge.getLayerGauges():
        if layerGauge.getType() in [ CRL.RoutingLayerGauge.PinOnly
                                   , CRL.RoutingLayerGauge.Unusable
                                   , CRL.RoutingLayerGauge.BottomPowerSupply ]:
            continue
        if not hpitch and layerGauge.getDirection() == CRL.RoutingLayerGauge.Horizontal:
            hpitch = layerGauge.getPitch()
        if not vpitch and layerGauge.getDirection() == CRL.RoutingLayerGauge.Vertical:
            vpitch = layerGauge.getPitch()
    sliceHeight = af.getCellGauge().getSliceHeight()
    sliceStep   = af.getCellGauge().getSliceStep  ()
    print( '  o  Looked up gauge/pitch values.' )
    print( '     - hpitch: {:>20}.'     .format( DbU.getValueString( hpitch ) ))
    print( '     - vpitch: {:>20}.'     .format( DbU.getValueString( vpitch ) ))
    print( '     - sliceHeight: {:>15}.'.format( DbU.getValueString( sliceHeight ) ))
    print( '     - sliceStep: {:>17}.'  .format( DbU.getValueString( sliceStep ) ))
    vpitchedSliceHeight = sliceHeight - sliceHeight%hpitch
    hpitchedSliceHeight = sliceHeight - sliceHeight%vpitch

    rvalue = True
    try:
        #setTraceLevel( 550 )
        #for cell in af.getAllianceLibrary(1).getLibrary().getCells():
        #    print( '"{}" {}'.format(cell.getName(),cell) )
        #Breakpoint.setStopLevel( 100 )
        buildChip = True
        cell, editor = plugins.kwParseMain( **kw )
        cell = af.getCell( 'Arlet6502', CRL.Catalog.State.Logical )
        if not cell:
            cell = CRL.Blif.load( 'Arlet6502' )
        if editor:
            editor.setCell( cell ) 
            editor.setDbuMode( DbU.StringModePhysical )
        ioPadsSpec = [ (IoPin.WEST , None, 'di_0'       , 'DI(0)'  , 'DI(0)'  )
                     , (IoPin.WEST , None, 'di_1'       , 'DI(1)'  , 'DI(1)'  )
                     , (IoPin.WEST , None, 'do_0'       , 'DO(0)'  , 'DO(0)'  )
                     , (IoPin.WEST , None, 'do_1'       , 'DO(1)'  , 'DO(1)'  )
                     , (IoPin.WEST , None, 'do_2'       , 'DO(2)'  , 'DO(2)'  )
                     , (IoPin.WEST , None, 'do_3'       , 'DO(3)'  , 'DO(3)'  )
                     , (IoPin.WEST , None, 'do_4'       , 'DO(4)'  , 'DO(4)'  )
                     , (IoPin.WEST , None, 'do_5'       , 'DO(5)'  , 'DO(5)'  )

                     , (IoPin.SOUTH, None, 'di_2'       , 'DI(2)'  , 'DI(2)'  )
                     , (IoPin.SOUTH, None, 'allpower_0' , 'iovdd'  , 'vdd'    )
                     , (IoPin.SOUTH, None, 'allground_0', 'iovss'  , 'vss'    )
                     , (IoPin.SOUTH, None, 'di_3'       , 'DI(3)'  , 'DI(3)'  )
                     , (IoPin.SOUTH, None, 'di_4'       , 'DI(4)'  , 'DI(4)'  )
                     , (IoPin.SOUTH, None, 'di_5'       , 'DI(5)'  , 'DI(5)'  )

                     , (IoPin.EAST , None, 'do_6'       , 'DO(6)'  , 'DO(6)'  )
                     , (IoPin.EAST , None, 'do_7'       , 'DO(7)'  , 'DO(7)'  )
                     , (IoPin.EAST , None, 'lh_0'       , 'lh(0)'  , 'lh(0)'  )
                     , (IoPin.EAST , None, 'lh_1'       , 'lh(1)'  , 'lh(1)'  )
                     , (IoPin.EAST , None, 'we'         , 'WE'     , 'WE'     )
                     , (IoPin.EAST , None, 'di_6'       , 'DI(6)'  , 'DI(6)'  )
                     , (IoPin.EAST , None, 'di_7'       , 'DI(7)'  , 'DI(7)'  )
                     , (IoPin.EAST , None, 'irq'        , 'IRQ'    , 'IRQ'    )

                     , (IoPin.NORTH, None, 'nmi'        , 'NMI'    , 'NMI'    )
                     , (IoPin.NORTH, None, 'allpower_1' , 'iovdd'  , 'vdd'    )
                     , (IoPin.NORTH, None, 'clk'        , 'clk'    , 'clk'    )
                     , (IoPin.NORTH, None, 'allground_1', 'iovss'  , 'vss'    )
                     , (IoPin.NORTH, None, 'reset'      , 'reset'  , 'reset'  )
                     , (IoPin.NORTH, None, 'rdy'        , 'RDY'    , 'RDY'    )
                     ]
        ioPinsSpec = [ (IoPin.WEST |IoPin.A_BEGIN, 'DI({})'  ,    vpitchedSliceHeight, vpitchedSliceHeight,  8)
                     , (IoPin.WEST |IoPin.A_BEGIN, 'DO({})'  , 14*vpitchedSliceHeight, vpitchedSliceHeight,  8)
                     , (IoPin.EAST |IoPin.A_BEGIN, 'A({})'   ,    vpitchedSliceHeight, vpitchedSliceHeight, 16)
                     
                    #, (IoPin.NORTH|IoPin.A_BEGIN, 'clk'     , 10*hpitchedSliceHeight,      0 ,  1)
                     , (IoPin.NORTH|IoPin.A_BEGIN, 'IRQ'     , 11*hpitchedSliceHeight,      0 ,  1)
                     , (IoPin.NORTH|IoPin.A_BEGIN, 'NMI'     , 12*hpitchedSliceHeight,      0 ,  1)
                     , (IoPin.NORTH|IoPin.A_BEGIN, 'RDY'     , 13*hpitchedSliceHeight,      0 ,  1)
                     , (IoPin.NORTH|IoPin.A_BEGIN, 'WE'      , 14*hpitchedSliceHeight,      0 ,  1)
                    #, (IoPin.NORTH|IoPin.A_BEGIN, 'reset'   , 15*hpitchedSliceHeight,      0 ,  1)
                     ]
       #ioPinsSpec = []
        designConf = ChipConf( cell, ioPins=[], ioPads=ioPadsSpec ) 
        designConf.cfg.tramontana.mergeSupplies    = True
        designConf.cfg.etesian.bloat               = 'disabled'
       #designConf.cfg.etesian.bloat               = 'nsxlib'
        designConf.cfg.etesian.densityVariation    = 0.05
        designConf.cfg.etesian.aspectRatio         = 1.0
       # etesian.spaceMargin is ignored if the coreSize is directly set.
       #designConf.cfg.etesian.spaceMargin         = 0.10
       #designConf.cfg.anabatic.searchHalo         = 2
        designConf.cfg.anabatic.globalIterations   = 10
        designConf.cfg.katana.hTracksReservedLocal = 15
        designConf.cfg.katana.vTracksReservedLocal = 15
        designConf.cfg.katana.hTracksReservedMin   = 7
        designConf.cfg.katana.vTracksReservedMin   = 6
        designConf.cfg.katana.trackFill            = 0
        designConf.cfg.katana.runRealignStage      = True
        designConf.cfg.block.spareSide             = 16*sliceHeight
        designConf.cfg.chip.padCoreSide            = 'North'
        designConf.editor              = editor
        designConf.useSpares           = True
        designConf.useHFNS             = True
        designConf.bColumns            = 2
        designConf.bRows               = 2
        designConf.chipName            = 'chip'
        designConf.chipConf.ioPadGauge = 'IOPadLib'
        designConf.coreToChipClass     = CoreToChip
        designConf.coreSize            = (  280*sliceStep,  38*sliceHeight )
       #designConf.chipSize            = ( u(1414.0), u(1414.0) )   # 2mm^2.
        designConf.chipSize            = ( u( 8*85 + 2*270.0), u( 8*85 + 2*270.0) )
        if buildChip:
            designConf.useHTree( 'clk_from_pad', Spares.HEAVY_LEAF_LOAD )
            designConf.useHTree( 'reset_from_pad' )
            chipBuilder = Chip( designConf )
            chipBuilder.doChipNetlist()
            chipBuilder.doChipFloorplan()
            rvalue = chipBuilder.doPnR()
            #CRL.Gds.load( chipBuilder.conf.chip.getLibrary()
            #            , 'chip_r_seal.gds'
            #            , CRL.Gds.Layer_0_IsBoundary )
            #with overlay.UpdateSession():
            #    chipCell = chipBuilder.conf.chip
            #    sealCell = chipBuilder.conf.chip.getLibrary().getCell( 'sealring_top' )
            #    chipAb = chipCell.getAbutmentBox()
            #    sealAb = sealCell.getAbutmentBox()
            #    sealX  = (chipAb.getWidth () - sealAb.getWidth ()) // 2
            #    sealY  = (chipAb.getHeight() - sealAb.getHeight()) // 2
            #    Instance.create( chipCell
            #                   , 'sealring'
            #                   , sealCell
            #                   , Transformation( sealX, sealY, Transformation.Orientation.ID )
            #                   , Instance.PlacementStatus.FIXED
            #                   )
            chipBuilder.save()
        else:
            designConf.useHTree( 'clk', Spares.HEAVY_LEAF_LOAD )
            designConf.useHTree( 'reset' )
            blockBuilder = Block( designConf )
            rvalue = blockBuilder.doPnR()
            blockBuilder.save()
    except Exception as e:
        catch( e )
        rvalue = False
    sys.stdout.flush()
    sys.stderr.flush()
    return rvalue


if __name__ == '__main__':
    rvalue = scriptMain()
    shellRValue = 0 if rvalue else 1
    sys.exit( shellRValue )
