# CMake
sudo apt-get install -y cmake
# google-glog + gflags
sudo apt-get install -y libgoogle-glog-dev
# BLAS & LAPACK
sudo apt-get install -y libatlas-base-dev
# Eigen3
sudo apt-get install -y libeigen3-dev
# SuiteSparse and CXSparse (optional)
# - If you want to build Ceres as a *static* library (the default)
#   you can use the SuiteSparse package in the main Ubuntu package
#   repository:
sudo apt-get install -y libsuitesparse-dev
# - However, if you want to build Ceres as a *shared* library, you must
#   add the following PPA:
sudo add-apt-repository ppa:bzindovic/suitesparse-bugfix-1319687
sudo apt-get update
sudo apt-get install -y libsuitesparse-dev

cd /tmp
wget http://ceres-solver.org/ceres-solver-1.14.0.tar.gz

tar zxf ceres-solver-1.14.0.tar.gz
mkdir ceres-bin
cd ceres-bin
cmake ../ceres-solver-1.14.0
make -j3
make test
# Optionally install -y Ceres, it can also be exported using CMake which
# allows Ceres to be used without requiring install -yation, see the
# documentation for the EXPORT_BUILD_DIR option for more information.
sudo make install 
