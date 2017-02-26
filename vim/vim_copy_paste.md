# vim复制粘贴
## 如何将vim进行系统剪贴板的粘贴


## Cut or copy lines without counting the lines
1. In normal mode, go to the beginning of the section that you want to yank.
Type mk to mark this spot as k.
2. Go to the end of the section you want to yank using whatever movement commands you like.
4. Type: y'k (<y-yank>, <single quote-go to mark>, k) To yank from the mark to the current location.
4. You can paste those lines wherever you want with p


http://vim.wikia.com/wiki/Cut_or_copy_lines_without_counting_the_lines