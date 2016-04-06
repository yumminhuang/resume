\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newresume}[2015/05/25 An elegant Résumé class]
\LoadClass[10pt]{article}

% use xifthen
\RequirePackage{xifthen}
% use fontawesome
\RequirePackage{../fontawesome}
% use hyperref
\RequirePackage[colorlinks,linkcolor=blue,anchorcolor=blue,citecolor=green,urlcolor=blue]{hyperref}

% SIDE MARGINS:

\leftmargin 0.25in
\oddsidemargin 0.25in
\marginparwidth 50pt
\marginparsep 50pt			% Horizontal space between outer margin and
							% marginal note

% VERTICAL SPACING:
							% Top of page:
\topmargin -0.75in			% Nominal distance from top of page to top of
							% box containing running head.

% DIMENSION OF TEXT:
\textheight 9.25in			% Height of text (including footnotes and figures,
							% excluding running head and foot).
\textwidth 6.05in			% Width of text line.

% Setting text ragged right
\raggedright

% Page number
\thispagestyle{empty}
%\pagenumbering{arabic}

\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
% Set nested items as circle instead of dash
\setlist[itemize,2]{label=\scriptsize$\circ$}


% DEFINITIONS FOR RESUME
\newenvironment{changemargin}[2]{%
	\begin{list}{}{%
	\setlength{\topsep}{0pt}%
	\setlength{\leftmargin}{#1}%
	\setlength{\rightmargin}{#2}%
	\setlength{\listparindent}{\parindent}%
	\setlength{\itemindent}{\parindent}%
	\setlength{\parsep}{\parskip}%
	}%
	\item[]}{\end{list}
}

\newcommand{\lineover}{
	\begin{changemargin}{-0.05in}{-0.05in}
		\vspace*{-10pt}
		\hrulefill \\
		\vspace*{-2pt}
	\end{changemargin}
}

% \header{Section Name}
\newcommand{\header}[1]{
	\begin{changemargin}{-0.5in}{-0.5in}
		\large\scshape{#1}\\
	\lineover
	\end{changemargin}
}

% \contact{Name}{Email}{Phone}{Github}{Address}
\newcommand{\contact}[5]{
	\begin{changemargin}{-0.5in}{-0.5in}
		\begin{center}
			{\Large\scshape{#1}}\\ \smallskip
			\faEnvelope\ {#2}
			\textperiodcentered\ \faPhone\ {#3}
			\textperiodcentered\ \faGithub\ {#4}\\ \smallskip
			\ifthenelse{\isempty{#5}}%
				{ } % if {5} is empty
				{\faHome\ {#5}\\ \smallskip } % Address
		\end{center}
	\end{changemargin}
}

\newenvironment{body} {
	\vspace*{-2pt}
	\begin{changemargin}{-0.25in}{-0.5in}
	}
	{
	\end{changemargin}
}

%\school{School}{Date}{Degree/Title}{GPA}
\newcommand{\school}[4]{
	#1 \hfill #2\\
	\textit{#3} \hfill #4\\
}

%\project{Project}{Date}
\newcommand{\project}[2]{
	#1 \hfill #2
}

% END RESUME DEFINITIONS
