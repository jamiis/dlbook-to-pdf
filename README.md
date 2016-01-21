Download, convert, and concatenate the latest draft of the 
[Deep Learning textbook](http://www.deeplearningbook.org/) 
into a single pdf. I use this to simplify my reading experience 
since I often read offline and also in an environment different 
than my web browser. 

`$ ./topdf.sh`

script takes approx 15 minutes ... which is gnarly; 
pdf conversion and concatenation are pricey.

dependenceis: `phantomjs`, `pdftk`, `wget`. 
Also, `rasterize.js` is from [here](https://github.com/ariya/phantomjs/blob/master/examples/rasterize.js). 
I could have used git submodules or sub-trees to manage that dep but: lazy.
