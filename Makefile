all: resume clean

resume:
	xelatex Resume.tex -interaction=nonstopmode
	xelatex Resume_ZH.tex -interaction=nonstopmode

clean:
	rm *.aux *.log *.out

.PHONY: clean
