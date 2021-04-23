# dockerized htmltidy5


I use it to create a XML doc from a html source file.
The resulting XML doc is stored into a containerized 
[xqerl](https://github.com/zadean/xqerl) database

```
 local tidy_img='docker.pkg.github.com/grantmacken/alpine-htmltidy/htmltidy5:5.7.28'
 local tidy_xml=$(cat $srcFile | docker run --rm  -i ${tidy_img})
 docker exec xq xqerl escript bin/scripts/run2.escript store.xq "$base" "${tidy_xml}"
```


