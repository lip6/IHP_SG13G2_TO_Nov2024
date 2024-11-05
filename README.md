# TO_Nov2024

The TO_NOV repository is dedicated to the submission of open-source designs based on the IHP 130nm BiCMOS Open Source PDK, specifically for the November 2024 edition of the IHP OpenMPW program. In the future, this repository will be integrated as a submodule within the `IHP-Open-DesignLib` repository.

ReadTheDocs documentation for IHP-Open-DesignLib is [here](https://ihp-open-ip.readthedocs.io/en/latest/)

## Submission process

Make a fork of this repository and then push your data to it, then make a pull request.

> [!CAUTION]  
> On each PR a github action will be triggered to run a minimal DRC precheck (rejection test). Please consider it and do not upload many `gds` files.


> [!TIP]  
> The DRC rejecttion test supports `gds` and `gds.zip` files. In a case of a large file (> 50 MB) you can split the `zip` file and upload multiple `zip` files. On linux you can perform it using the following command:

```
zip -s 50m -r file.gds.zip output_folder/
```

## Directory structure

If you are a designer, we propose the following directory structure, which we and the community would appreciate you using. Please ensure that the design you submit is reproducible, meaning it should include all the information necessary to replicate the design.


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
We also provide a basic template for the documentation in the `ExampleDesign/doc` directory. To use it execute the following:
```
cd ExampleDesign
pip install -r requirements.txt
make docs
```
Go to `source` directory to modify the `rst` files.

### Verification/validation data

Since one of the principal goals of the OpenMPW runs is a creation of a silicon proven designs we epect from the designers to measure and validate the submitted design and then open source measurements results.
This directory at the moment of the submission is only a placeholder for future measurments data. A report frm the measurements can be part of the documentation. 
