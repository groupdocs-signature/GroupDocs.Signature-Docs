set PRODUCT=signature

call git submodule update --init --recursive
call git submodule foreach git pull origin master
xcopy java common\content\%PRODUCT%\java /s /e /Y /i
xcopy net common\content\%PRODUCT%\net /s /e /Y /i /J
xcopy _index.md common\content\%PRODUCT% 
cd common
call hugo server