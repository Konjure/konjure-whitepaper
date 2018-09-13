%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%       Konjure Whitepaper Document Class
%
% Author: Connor Hollasch
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kwp-builder}
\LoadClassWithOptions{article}

%%%%%%%%%%%%%%%%%%
% PACKAGES
%%%%%%%%%%%%%%%%%%

% Paper packages.
\usepackage[T1]{fontenc}
\usepackage{url}
\usepackage[realmainfile]{currfile}
\usepackage{fontspec}
\usepackage{textcomp}
\usepackage{newunicodechar}
\usepackage[hidelinks]{hyperref}
\usepackage{xspace}
\usepackage{fancyhdr}
\usepackage{tikz}
\usepackage{graphicx}

%%%%%%%%%%%%%%%%%%%%
% DOCUMENT SETTINGS
%%%%%%%%%%%%%%%%%%%%

% Graphics settings

\graphicspath{{./media/}}

% Page settings
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-1.5in}

% Page geometry.
\usepackage[
	left=1.5in,
	right=1.5in,
	top=1.25in,
	bottom=1.25in
]{geometry}

% Table of Contents
\renewcommand{\contentsname}{Table of Contents}

% Page header / footer styles
\pagestyle{fancy}
\fancyhead[LE,RO]{\textsl{\rightmark}}
\fancyhead[LO,RE]{\textsl{\leftmark}}
\fancyfoot[C]{\thepage}

% Font specification.
\setmainfont [
	Extension 	= .ttf, 	
	Path 		= ./font/,
	UprightFont = *-regular,
	BoldFont 	= *-bold
] {lusitana}

% Font fallbacks
% Whenever a character doesn't exist in lusitana, use \_{text} or \_\command
% to fallback to the given font below.

\newfontfamily\fallbackfont{Calibri}
\DeclareTextFontCommand{\_}{\fallbackfont}

%%%%%%%%%%%%%%%%%%
% COMMANDS
%%%%%%%%%%%%%%%%%%

% Macros
\def \ktoc {\tableofcontents\cleardoublepage\newpage}

% Basic commands
\newcommand{\tab}[1][1cm]{\hspace*{#1}}
\newcommand{\konjure}{\href{\website}{Konjure\_\texttrademark}\xspace}

% Document property commands
\newcommand{\kversion}[1]{\def \version {#1}}
\newcommand{\kwebsite}[1]{\def \website {#1}}
\newcommand{\kdate}[1]{\def \datedisp {#1}}

\newcommand{\kauthor}[3]{
	\href{mailto:#3}{#1}\footnote{\xspace\href{mailto:#3}{#3}}
   	\\ \small{#2}
}

\newcommand{\kcredits}{
	\vspace{\fill}
	\centerline{\includegraphics[scale=0.75]{cauldron-and-ghost}}
	\centerline{\textbf{Powered by} \LaTeX}
}

\newcommand{\kfootnote}[2]{
	\expandafter\newcommand\csname k#1\endcsname{\footnote{#2}}
}

\newcommand{\kbuilddoc}[3]{
	\title{#1}
	\author{#2}
	\date{\datedisp \_\textemdash \version}
	\maketitle
	
	% Draw the abstract
	\begin{abstract}
	#3
	\end{abstract}
	
	% Draws the table of contents.
	\ktoc
}

% Debug command
\newcommand{\debug}{
	\usepackage{showframe}
	\hypersetup{
		colorlinks = true
	}
}