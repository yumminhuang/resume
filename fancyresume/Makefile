all: fancyresume clean

fancyresume:
	xelatex -shell-escape -8bit Resume_EN.tex -interaction=nonstopmode
	xelatex -shell-escape -8bit Resume_EN.tex -interaction=nonstopmode
	xelatex -shell-escape -8bit Resume_CN.tex -interaction=nonstopmode
	xelatex -shell-escape -8bit Resume_CN.tex -interaction=nonstopmode

clean:
	rm *.aux *.log *.out

.PHONY: clean
