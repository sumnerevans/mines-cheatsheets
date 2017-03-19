% LaTeX class for typesetting cheatsheets
% By: Jonathan Sumner Evans
% Most recent version here:
% https://github.com/sumnerevans/mines-cheatsheets/blog/master/cheatsheet.cls

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
\newcommand{\@fontSize}{12pt}
\DeclareVoidOption{10pt}{\renewcommand{\@fontSize}{10pt}}
\DeclareVoidOption{11pt}{\renewcommand{\@fontSize}{11pt}}
\DeclareVoidOption{12pt}{\renewcommand{\@fontSize}{12pt}}

% Options for setting margins uniformly
% i.e., left, right, top, and bottom all at once
% The default margin size depends on the font size.
\DeclareStringOption[]{margins}[]

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
\RequirePackage[margin=0.3in,includefoot,includehead]{geometry}

% Minted to make code look awesome
\RequirePackage{minted}
\setminted{autogobble,python3,mathescape,framesep=2mm,fontsize=\footnotesize}

% Fancyhdr to make the headers nice
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[L]{\@course}
\fancyhead[C]{\textbf{\@cheatsheetname}}
\fancyhead[R]{\today}

% Make section titles a lot smaller and have less padding
\RequirePackage{titlesec}

\pagenumbering{gobble}
\titleformat{\section}{\normalfont\scshape\bfseries\raggedright}{\thesection}{2em}{}
\titleformat{\subsection}{\normalfont\scshape\bfseries\raggedright}{\thesubsection}{1.5em}{}
\titleformat{\subsubsection}{\normalfont\scshape\bfseries\raggedright}{\thesubsubsection}{1em}{}
\titlespacing{\section}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mathematics Packages %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}

% Other stuff
\RequirePackage{parskip} % Remove paragraph indentation

% Multiple columns by default
\RequirePackage{multicol}
