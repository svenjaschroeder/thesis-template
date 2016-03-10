%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2015/01/01]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[openright,titlepage,numbers=noenddot,headinclude,footinclude=true,cleardoublepage=empty,BCOR=5mm,paper=A4,fontsize=12pt,twoside]{scrartcl}[2015/01/01]

\ProvidesClass{mas-thesis-sections}[2015/08/28 Uni-DUE MAS thesis class]

\input{mas-thesis-common.cls}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[acronym, nomain, style=tree, toc, section=section, nogroupskip=true]{glossaries}

%% load and typeset glossaries
\makeglossaries
\renewcommand{\glsseeitemformat}[1]{\textsc{\glsentryname{#1}}}
%\loadglsentries{components/definitions}
%\loadglsentries{components/acronyms}

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
 	\section*{\contentsname}
 	\@mkboth{\textsc{\contentsname}}{\textsc{\contentsname}}
}

\providecommand\phantomsection{}% for hyperref
\newcommand\listofillustrations{%
	\begingroup
		\let\clearpage\relax
		\let\cleardoublepage\relax
		\ifgerman
			\section*{Abbildungen}%
		\else
			\section*{Figures}
		\fi
		%\phantomsection
		\addcontentsline{toc}{section}{Figures}%
		\@starttoc{lof}%
		\bigskip
		\ifgerman
			\section*{Tabellen}%
		\else
			\section*{Tables}
		\fi
		%\phantomsection
		\addcontentsline{toc}{section}{Tables}%
		\@starttoc{lot}
    \endgroup}

% headlines
\clearscrheadings
\setheadsepline{0pt}
\renewcommand{\sectionmark}[1]{\markright{\thesection\enspace\textsc{#1}}\markleft{\thesection\enspace\textsc{#1}}}
\lehead{\mbox{\headmark\hfil}}
\rohead{\mbox{\hfil{\headmark}}}
\rofoot{\mbox{\hfil{\thepage}}}
\lefoot{\mbox{\hfil{\thepage}}}
\renewcommand{\headfont}{\small}
