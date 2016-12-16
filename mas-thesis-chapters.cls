%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2015/01/01]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[openright,titlepage,numbers=noenddot,headinclude,footinclude=true,cleardoublepage=empty,BCOR=5mm,paper=A4,fontsize=11pt,twoside]{scrreprt}

\ProvidesClass{mas-thesis-chapters}[2015/08/28 Uni-DUE MAS thesis class]

\input{mas-thesis-common.cls}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[acronym, nomain, style=tree, toc, section=chapter, nogroupskip=true]{glossaries}

%% load and typeset glossaries
\makeglossaries
\renewcommand{\glsseeitemformat}[1]{\textsc{\glsentryname{#1}}}


%% glossaries: define a custom tree-based style with user1-key support for urls and other references
% TODO indent the par!
\newglossarystyle{treewithref}{
  \setglossarystyle{tree}% base this style on the list style
  \renewcommand{\glossentry}[2]{
  \hangindent0pt\relax
  \parindent0pt\relax
  \glsentryitem{##1}\textbf{\glstarget{##1}{\glossentryname{##1}}}
  \ifglshassymbol{##1}{\space(\glossentrysymbol{##1})}{}
  \space\glossentrydesc{##1}\glspostdescription
  \ifglshasfield{user1}{##1}{\\\textit{\glsentryuseri{##1}\glspostdescription}}{}\space##2\par
  }
}
\setglossarystyle{treewithref}

\def\toc@heading{
 	\chapter*{\contentsname}
 	\@mkboth{\textsc{\contentsname}}{\textsc{\contentsname}}
}

\providecommand\phantomsection{}% for hyperref
\newcommand\listofillustrations{%
	\begingroup
		\let\clearpage\relax
		\let\cleardoublepage\relax
		\ifgerman
			\chapter*{Abbildungen}%
		\else
			\chapter*{Figures}
		\fi
		%\phantomsection
		\addcontentsline{toc}{section}{Figures}%
		\@starttoc{lof}%
		\bigskip
		\ifgerman
			\chapter*{Tabellen}%
		\else
			\chapter*{Tables}
		\fi
		%\phantomsection
		\addcontentsline{toc}{section}{Tables}%
		\@starttoc{lot}
    \endgroup}

\titleformat{\chapter}[display]
	{\relax}{\vspace*{-3\baselineskip}\makebox[\linewidth][r]{\color{halfgray}\fontsize{1.5cm}{1em}\selectfont\thechapter}}{0pt}
	{\Large\raggedright\spacedallcaps}[\normalsize\vspace*{.8\baselineskip}\titlerule]

% headlines
\clearscrheadings
\setheadsepline{0pt}
\renewcommand{\sectionmark}[1]{\markright{\thesection\enspace\textsc{#1}}}
\lehead{\mbox{\headmark\hfil}}
\rohead{\mbox{\hfil{\headmark}}}
\rofoot{\mbox{\hfil{\thepage}}}
\lefoot{\mbox{\hfil{\thepage}}}
\renewcommand{\headfont}{\small}

\renewcommand{\cftchappresnum}{\scshape\MakeTextLowercase}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\let\oldchap=\section
%renewcommand*{\section}{\secdef{\Chap}{\ChapS}}
\newcommand\ChapS[1]{\oldchap*{#1}}
% \newcommand\Chap[2][]{%
%        \ifpdf\oldchap[\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}]{#2}%
%        \else\oldchap[\spacedlowsmallcaps{#1}]{#2}%
%        \fi%
% }%
\newcommand\Chap[2][]{\oldchap[\textsc{#1}]{#2}}
