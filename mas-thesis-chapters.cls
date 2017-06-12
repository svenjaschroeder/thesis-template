%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2015/01/01]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[openright,titlepage,numbers=noenddot,cleardoublepage=empty,BCOR=5mm,a4paper,fontsize=12pt,twoside, DIV=calc]{scrreprt}

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

\newcommand\listofillustrations{%
	\begingroup
		\let\clearpage\relax
		\let\cleardoublepage\relax
		\phantomsection
		\addcontentsline{toc}{chapter}{Figures}%
		\ifgerman
			\chapter*{Abbildungen}%
		\else
			\chapter*{Figures}
		\fi

		\@starttoc{lof}%
		\bigskip
		\phantomsection
		\addcontentsline{toc}{chapter}{Tables}%
		\ifgerman
			\chapter*{Tabellen}%
		\else
			\chapter*{Tables}
		\fi
		\@starttoc{lot}
    \endgroup}


% titlesec chapter format
\titleformat{\chapter} % {⟨command⟩}
	[display] % [⟨shape⟩]
	{\relax} % {⟨format⟩}
	{\flushright
     \begin{tikzpicture}
       \draw[fill,color=black] (0,0) rectangle (2cm,2cm);
       \draw[color=white] (1cm,1cm) node { \fontsize{1cm}{1em}\selectfont\thechapter };
     \end{tikzpicture}} % {⟨label⟩}
	{0pt} % {⟨sep⟩}
	{\Huge\raggedright\scshape} % {⟨before-code⟩}
	[\normalsize\vspace*{.8\baselineskip}\titlerule] % [⟨after-code⟩]

% headlines
\clearscrheadings
\setheadsepline{0pt}
\renewcommand{\sectionmark}[1]{\markright{\thesection\enspace\textsc{#1}}}
\lehead{\mbox{\headmark\hfil}}
\rohead{\mbox{\hfil{\headmark}}}
\rofoot{\mbox{\hfil{\thepage}}}
\lefoot{\mbox{\hfil{\thepage}}}
\renewcommand{\headfont}{\small}




%% tocloft toc manipulations
% specifically: smallcaps and dotted lines for sections
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\scshape}
