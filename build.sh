cd lib/point_matching_loss/;
python setup.py develop;
cd ../utils;
python setup.py build_ext --inplace;
cd ../../ycb_render;
python setup.py develop 


