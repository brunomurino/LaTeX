\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{___mymonograph}[2014/08/16 Example LaTeX class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\LoadClass[oneside, 12pt, notitlepage]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To be able to use weird commands
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To be able to use \title, \author, \date as variables
\RequirePackage{authoraftertitle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sets my preferred page size
\RequirePackage{geometry}
\geometry{papersize={180mm,260mm}, top=20mm, bottom=15mm, left=15mm, right=15mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sets my preferred page style
\RequirePackage[pagestyles]{titlesec}
\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}
\titleformat*{\paragraph}{\normalsize\bfseries}
\titleformat*{\subparagraph}{\normalsize\bfseries}

\newpagestyle{onlypagenum}
{\sethead{}{}{\textbf{\thepage}}%
\setfoot{}{}{}}

\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{onlypagenum}}{}{}
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}

\pagestyle{onlypagenum}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create minitoc
\RequirePackage{minitoc}
\renewcommand{\mtctitle}{\textnormal{\emph{Contents}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}
% \RequirePackage[usenames, dvipsnames]{color}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creates clickable links
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	citecolor = red,
	linkcolor = blue,
	urlcolor = blue,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Makes it easier to type units and values
\RequirePackage[alsoload=astro]{siunitx}
\DeclareSIUnit{\year}{yr}
\DeclareSIUnit{\solarmass}{\textup{M}_\odot}
\DeclareSIUnit{\solarluminosity}{\textup{L}_\odot}






\RequirePackage{mathrsfs}
% \mathscr{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$
\RequirePackage{amsmath, amssymb, amsthm, mathtools}




\RequirePackage{cancel}
\RequirePackage{nicefrac}
\RequirePackage{bbold}

\RequirePackage[italicdiff]{physics}
\RequirePackage{tensor}
%  \tensor[^{2s+1}]{T}{^j_ ^ _}
\RequirePackage{bm}

\RequirePackage{tcolorbox}
\tcbuselibrary{most, theorems}

\newtcolorbox{mybox}{
colback=yellow!10!white, colframe=yellow!10!white, arc=0mm, 
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{times}
% \RequirePackage{mathptmx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fontenc}
\linespread{1.1}
\RequirePackage[british]{babel}
\RequirePackage[english=british]{csquotes}
\RequirePackage{epigraph}
\RequirePackage{textgreek}

\RequirePackage{import}
\RequirePackage{graphicx}
% \graphicspath{ {images/} }
\RequirePackage{float}
\RequirePackage[subpreambles=false]{standalone}
% each file is compilable on its own, and the preambles of subfiles are ignores (subpreambles=false)
% \import{Path/}{Filename}

\RequirePackage{xparse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Package for bibliography and citing
\RequirePackage[backend=biber, style=nature]{biblatex}
% \addbibresource{RelativePath/file.bib}

\newcommand{\printbib}[1][References]{
	\defbibheading{bibliography}[\refname]{
	  \chapter*{\hspace*{\fill} #1 \hspace*{\fill}}
	  \markboth{}{}
	}
	\nocite{*}
	\printbibliography[title={\hspace*{\fill} #1 \hspace*{\fill}}]
	\addcontentsline{toc}{chapter}{#1}%
}
% \newcommand{\printbibfields}[1][References]{
% 	\chapter*{\hspace*{\fill} #1 \hspace*{\fill}}
% 	\addcontentsline{toc}{chapter}{#1}
% 	\nocite{*}
% 	\printbibliography[heading=subbibintoc, keyword={physics},title={Physics-related}]
% 	\printbibliography[heading=subbibintoc, keyword={math},title={Math-related}]
% 	\printbibliography[heading=subbibintoc, type=book, title={Books only}]
% }
% \cite{refname}
% \fullcite{refname}
% \footfullcite{refname}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define my titlepage template
\newcommand{\monographtp}{
	\begin{titlepage}
	    \begin{center}
	        \vspace*{2.5cm}

	        \Large
	        {Monograph on}

	        \vspace{1cm}
	        \Huge
	        {\textbf{\MyTitle}}

 		    \vspace{2cm}
 		    \large
 		    {By}

 		    \vspace{0.5cm}
 		    \Large
 		    {\MyAuthor}

 		    \vfill

 		    {Last edited}\\
 		    {\MyDate}

	    \end{center}
	\end{titlepage}
}

% Define my titlepage template
\newcommand{\solutionstp}{
	\begin{titlepage}
	    \begin{center}
	        \vspace*{2.5cm}

	        \Large
	        {Solutions on}

	        \vspace{1cm}
	        \Huge
	        {\textbf{\MyTitle}}

 		    \vspace{2cm}
 		    \large
 		    {By}

 		    \vspace{0.5cm}
 		    \Large
 		    {\MyAuthor}

 		    \vfill

 		    {Last edited}\\
 		    {\MyDate}

	    \end{center}
	\end{titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define my chapter heading
\makeatletter
\def\@makechapterhead#1{%
    \vspace*{2em}% Space above number
    {\parindent \z@  \normalfont
    \interlinepenalty\@M
    \Large{\hspace*{\fill} \textbf{\thechapter} \hspace*{\fill}}%
    \par\vspace{0.5em}% Space between number and title
    \Large{\hspace*{\fill} \textbf{#1} \hspace*{\fill}}%
    \par\vspace{3em}}% Space between title and text
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\contentsname}{\hspace*{\fill} Contents \hspace*{\fill}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Don't reset footnote numbering on new chapters
\RequirePackage{remreset} 
\makeatletter
\@removefromreset{footnote}{chapter}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This command for \footnote{}\footnote{} to work with Hyperref
\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Changes how the letter "l" is displayed in math mode
\mathcode`l="8000
\begingroup
	\makeatletter
	\lccode`\~=`\l
	\DeclareMathSymbol{\lsb@l}{\mathalpha}{letters}{`l}
	\lowercase{\gdef~{\ifnum\the\mathgroup=\m@ne \ell \else \lsb@l \fi}}%
\endgroup

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\qedsymbol{$\blacksquare$}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}{Proposition}[chapter]

\theoremstyle{definition}
\newtheorem{definition}{Definition}[chapter]
\newtheorem{axiom}{Axiom}[chapter]

\theoremstyle{remark}
\newtheorem*{remark}{Remark}
\newtheorem*{case}{Case}
\newtheorem*{notation}{Notation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\DeclareMathOperator{\mat}{Mat}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\lexp}{exp}

\newcommand{\topic}[1]{\subsubsection{\Large #1}}

\newcommand{\inner}[2]{
\def\temp{#2}\ifx \temp\empty
  \left\langle #1,#1 \right\rangle
\else
  \left\langle #1,#2 \right\rangle
\fi
}





\renewcommand{\exp}[1]{\mathrm{e}^{#1}}  % \exp{-iwt}
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\R}{\mathbb{R}}  % \R set of real numbers
\newcommand{\C}{\mathbb{C}}  % \R set of complex numbers
\newcommand{\N}{\mathbb{N}}  % \N set of natural numbers
\newcommand{\Z}{\mathbb{Z}}  % \N set of integer numbers
\newcommand{\idm}{\mathbb{1}}  % \idm identity matrix
\newcommand{\mb}[1]{\mathbb{#1}}  % \mb{C} mathbold
\newcommand{\mc}[1]{\mathcal{#1}}  % \mc{L} math caligraphic
\newcommand{\ms}[1]{\mathscr{#1}}  % \ms{L} math script font
\newcommand{\conj}[1]{\overline{#1}} % \conj{a+b}
\newcommand{\hlf}{\frac{1}{2}}  % \hlf
\newcommand{\epot}{\varphi}  % \epot
\newcommand{\at}[2][]{\eval{}_{#2}^{#1}}  % x^2 \at[x_f]{x_i}
\newcommand{\uint}[1][]{\underset{#1}\int}  % \uint{}
\newcommand{\uoint}[1][]{\underset{#1}\oint}  % \uoint{}
\newcommand{\tvb}[1]{\tilde{\vb{#1}}}  % \tvb{E} tilde bold vector
\newcommand{\tub}[2][]{\underbrace{#2}_{\text{\shortstack{#1}}}} % Text UnderBrace \tub[some text]{object}
\NewDocumentCommand{\tens}{e{_^}}{%
  \mathbin{\mathop{\otimes}\displaylimits
    \IfValueT{#1}{_{#1}}
    \IfValueT{#2}{^{#2}}
  }%
}

\newcommand{\teq}[1]{\stackrel{\text{#1}}{=}} % Text above equal sign.


