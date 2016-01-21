NOTE: phantomjs 2.0 is presently [extremely space inefficient](https://github.com/ariya/phantomjs/issues/12685)
when rendering html to pdf. Until that bug is fixed this implementation may not 
complete running in a realistic amount of time due to `pdftk` concatenation being so expensive.

Download, convert, and concatenate the latest draft of the 
[Deep Learning textbook](http://www.deeplearningbook.org/) 
into a single pdf. I use this to simplify my reading experience 
since I often read offline and also in an environment different 
than my web browser. 

`$ ./topdf.sh`

dependenceis: `phantomjs`, `pdftk`, `wget`. 
Also, `rasterize.js` is from [here](https://github.com/ariya/phantomjs/blob/master/examples/rasterize.js). 
I could have used git submodules or sub-trees to manage that dep but: lazy.
