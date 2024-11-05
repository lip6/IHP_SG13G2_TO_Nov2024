# TO_Nov2024

The TO_NOV repository is dedicated fo submission of open source designs, based on IHP 130nm BiCMOS Open Source PDK,
during November's 2024 edition of IHP OpenMPW program. In the future this repository will be integrated as a submodule
to the `IHP-Open-DesignLib` repository.

ReadTheDocs documentation for IHP-Open-DesignLib is [here](https://ihp-open-ip.readthedocs.io/en/latest/)

## Submission process

Make a fork of this repository and then push your data to it. Then make a pull request.
[!CAUTION]  
On each PR a github action will be triggered to run a minimal DRC precheck (rejection test)

## Directory structure

If you are a designer here we propose a directory structure, which we and the community would appreciate you use.
Keep in mind that the design you submitt should be reproducible, what means that it should provide all the information
necesary to reproduce the design. 
```text
📁<design_name>
 ┣ 📁design_data
 ┃ ┗ 📁tool1/format1/step1
 ┃  ┗ data
 ┃ ┗ 📁tool2/format2/setep2
 ┃  ┗ data
 ┣ 📁doc
 ┃ ┣ 📜specification
 ┃ ┣ ...
 ┗ 📁val <- validation/verification >
 ```
The first segmentation separates the `design data` from a `documentation` and `verification/validation data`.

### Design data directory structure

The `design data` should be structured using tool/format/step specific scheme.   

Here you can find some examples:

Example1
```
  📁design_data
   ┗ 📁xschem
   ┗ 📁ngspice
   ┗ 📁klayout
   ┗ 📁drc
   ┗ 📁lvs
   ┗ 📁gds
```
Example2
```
  📁design_data
   ┗ 📁verilog
   ┗ 📁sdc
   ┗ 📁lef
   ┗ 📁gds
   ┗ 📁lib
   ┗ 📁drc
   ┗ 📁lvs
   ┗ 📁reports
   ┗ 📁log
   ```
### Documentation

In the `doc` folder the designer should provide the documentation. The best option would be any markdown language compatible with `sphinx` and thus ReadTheDocs system. It would make it easy to create a central point for documentation in the `IHP-Open-DesignLib` repository. 

### Verification/validation data

Since one of the principal goals of the OpenMPW runs is a creation of a silicon proven designs we epect from the designers to measure and validate the submitted design and then open source measurements results.
This directory at the moment of the submission is only a placeholder for future measurments data. A report frm the measurements can be part of the documentation. 
