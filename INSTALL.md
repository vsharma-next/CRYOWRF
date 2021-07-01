## Installing CRYOWRF v1.0

This document gives instructions about installing CRYOWRF v1.0 on an local linux machine or on Piz Daint (a cluster) 



### Installing on Linux (Ubuntu)

#### Prerequisities 

* cmake
* csh
* m4
* gfortran

Install the above as ``` sudo apt install cmake csh m4 gfortran ```

#### Installation steps

1. Download CRYOWRF v1.0

```
git clone https://github.com/vsharma-next/CRYOWRF.git
```

2. Installing a local copy of netcdf (v 4.1.3) and MPI (mpich, v 3.0.4) [^1]
```
cd ./libraries
source ./install_libs.sh 
cd ..
```

3. Installing meteoio, snowpack and the coupler
```
source ./compiler_snow_libs.sh
```

4. Compiling WRF
```
./configure [ choose option 50 or 51 ]
./compile em_real -j 8
cd ..
```

5. Compiling WPS
  
```
./configure [ choose option 2 ]
./compile
```

[^1]: whenever running CRYOWRF simulations, safe practice is to repeat this step every time the terminal is opened

