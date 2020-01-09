# Cadence GPDK045 OpAmp

This design is a basic Differential OpAmp, designed for the Cadence Generic 45nm PDK.
It includes schematics and testbenches with performance metrics. 
It requires Virtuoso and Spectre to run the simulation and electrical 
verification flow. PVS and QRC are recommended for layout verification flow with GPDK045.

## Testcase setup. 

## Checkout from github. 

Use standard methods to checkout this repo. In the opamp_gpdk45 directory (where this README.md is located)
Unzip/tar the Design: `tar zxf Design.tar.gz`. This will create the Design directory, containing the
Virtuoso OpenAccess libraries.

### Setup GPDK

In addition to the repo, you need to download and untar and unzip the GPDK045: 
https://support.cadence.com/apex/ArticleAttachmentPortal?id=a1Od000000051TqEAI&pageName=GPDKs
From this page, download the gpdk045_v_6_0 (first link under the GPDK045 section.)
Untar this in an accessible location as well.

### setup.csh

Ensure you are in the gpdk45_opamp directory.
Edit the setup.csh file, you need to set the following environment variables:
All of these should already be at the top of the file, just edit the paths for
your environment.

1. CDSHOME - Set the path to the Virtuoso installation, we have tested most recently with ICADVM18.1 ISR8
2. MMSIMHOME - Set the path to the Spectre installation, we have tested most recently with Spectre 191 ISR2
3. PVEHOME - Set the path to PVS for LVS and DRC
4. QRC_HOME - Set the path to QRC for extraction
5. CDS_LIC_FILE - The address of your Cadence license server (usually 5280@<hostname>)
6. GPDK045HOME - Path to the GPDK045_v_6_0 that you installed above

Once it is set, save and do: `source setup.csh`

## Open the design

In the gpdk45_opamp directory, start virtuoso: `virtuoso &`

### Design Schematic

Lib: Design
Cell: DiffOpAmp
View: schematic

### Testbench Schematics

Lib: Design
Cell: DiffOpAmp_AC_top
View: schematic

Lib: Design
Cell: DiffOpAmp_TRAN_top
View: schematic

### Simulation Setup and Run

Open:

Lib: Design
Cell: DiffOpAmp
View: maestro

This has the full simulation configuration to run both testbenches and 
extract some performance metrics. With "Single Run, Sweeps and Corners" selected
as the run mode in the top toolbar, simply click the green "Play" button or
in the "Run" menu select the "Single Run, Sweeps and Corners" 

Current results with testing at Cadence are showing:
- trans, Swing = 3.244 V
- trans, SettlingTime = 9.902 ns
- trans, Current = 7.827 mA
- ac, UGF = 2.032G
- ac, Gain = 45.95

# Questions & Answers

If you run into any issues or problems, please contact Elias Fallon <fallon@cadence.com>
