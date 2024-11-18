

Tools versions used for this design
===================================


===================================  =============================================  =========
Tool                                 Repository                                     Commit
===================================  =============================================  =========
coriolis-eda                         https://github.com/lip6/coriolis               3f7384372
IHP-Open-PDK (LIP6 fork at 4c6508d)  https://github.com/lip6/IHP-Open-PDK.git       03fe67f
c4m-ihpsg13g2                        https://github.com/lip6/c4m-ihpsg13g2-pdk.git  4b0367c
===================================  =============================================  ========= 


At this point, I still fail to use the filler & sealring script from IHP.

* ``filler.py`` script runs without any error message, but the output GDS seems not
  to contain any filler or extra metal for density.

* ``sealring.py`` makes an error:

  .. code:: bash

     ego@pc:layout> klayout -n sg13g2 -zz -l .../pdks/ihpsg13g2/libs.tech/klayout/tech/sg13g2.lyp
                    -rd output=chip_r_seal.gds
                    -rd width=1714.0
                    -rd height=1884.0
                    -b -r .../pdks/ihpsg13g2/libs.tech/klayout/tech/scripts/sealring.py
                    chip_r_seal.gds
     ERROR: AttributeError: 'NoneType' object has no attribute 'layout'
       .../pdks/ihpsg13g2/libs.tech/klayout/tech/scripts/sealring.py:34
       .../pdks/ihpsg13g2/libs.tech/klayout/tech/scripts/sealring.py:70

