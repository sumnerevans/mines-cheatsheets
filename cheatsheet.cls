% LaTeX class for typesetting cheatsheets
% By: Jonathan Sumner Evans
% Most recent version here:
% https://github.com/sumnerevans/mines-cheatsheets/blob/master/cheatsheet.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2017/03/19 LaTeX class for typesetting cheatsheets]

%%%%%%%%%%%%%%%%%%%%%
%%% Class Options %%%
%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=CS,
  prefix=CS@,
}

% Options for 10pt, 11pt, or 12pt fonts
\newcommand{\@fontSize}{10pt}
\DeclareVoidOption{10pt}{\renewcommand{\@fontSize}{10pt}}
\DeclareVoidOption{11pt}{\renewcommand{\@fontSize}{11pt}}
\DeclareVoidOption{12pt}{\renewcommand{\@fontSize}{12pt}}

% All other options get passed to the article class
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}

% This class is based on the article class
\LoadClass[\@fontSize]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Cheatsheet Details %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Internal names for cheatshee details
\newcommand{\@course}{\@latex@error{No \noexpand\course given}\@ehc}
\newcommand{\@cheatsheetname}{\@latex@error{No \noexpand\cheatsheetname given}\@ehc}

% Necessary
% These commands should be used in the preamble (or else you will get an error)
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\cheatsheetname}[1]{\renewcommand{\@cheatsheetname}{#1}}

% Set page margin size using the geometry package
\RequirePackage[margin=0.3in,headsep=0.1in,footskip=0.1in,includefoot,includehead]{geometry}

% Minted to make code look awesome
\RequirePackage{minted}
\setminted{autogobble,python3,mathescape,frame=lines,framesep=2mm,fontsize=\footnotesize}

% Fancyhdr to make the headers nice
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[L]{\@course}
\fancyhead[C]{\textbf{\@cheatsheetname}}
\fancyhead[R]{\today}

% Make section titles a lot smaller and have less padding
\RequirePackage{titlesec}

\pagenumbering{gobble}
\titleformat{\section}{\normalfont\fontsize{12pt}{12pt}\scshape\bfseries\raggedright}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\fontsize{11pt}{11pt}\scshape\bfseries\raggedright}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\fontsize{10pt}{10pt}\scshape\bfseries\raggedright}{\thesubsubsection}{1em}{}
\titlespacing{\section}{0pt}{0.5\parskip}{-0.5\parskip}
\titlespacing{\subsection}{0pt}{0.5\parskip}{-0.5\parskip}
\titlespacing{\subsubsection}{0pt}{0.5\parskip}{-0.5\parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mathematics Packages %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}

% Other stuff
\RequirePackage{parskip} % Remove paragraph indentation
\RequirePackage{xspace} % Because it should be included by default

% Tilde
\RequirePackage{textcomp}
\newcommand{\textapprox}{\raisebox{0.5ex}{\texttildelow}}

% Tab
\newcommand\tab[1][.5in]{\hspace*{#1}}

% Reduce spacing between lists
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% Multiple columns by default
\RequirePackage{multicol}
\setlength{\columnseprule}{1pt}
