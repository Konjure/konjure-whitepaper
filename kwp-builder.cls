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
\usepackage{titlesec}
\usepackage[shortlabels]{enumitem}
\usepackage{pdfpages}

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
	left=1.875in,
	right=1.875in,
	top=1.5in,
	bottom=1.5in
]{geometry}

\titlespacing*{\section}
{0pt}{10ex}{10ex}

\titlespacing*{\subsection}
{0pt}{7.5ex}{7.5ex}

\titlespacing*{\subsubsection}
{0pt}{5ex}{5ex}

% Page header / footer styles
\pagestyle{fancy}
\fancyhead[LE,RO]{\textsl{\rightmark}}
\fancyfoot[C]{\thepage}

% Table of Contents
\renewcommand{\contentsname}{Table of Contents}

% Font specification.
\setmainfont [
	Extension 		= .ttf,
	Path 			= ./font/,
	UprightFont 	= *-regular,
	BoldFont 		= *-bold,
	ItalicFont  	= *-italics,
	BoldItalicFont 	= *-bolditalic
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
\def \ktoc {\newpage\tableofcontents\cleardoublepage\newpage}

% Basic commands
\newcommand{\tab}[1][0.5cm]{\hspace*{#1}}
\newcommand{\konjure}{\href{\website}{Konjure}\xspace}
\newcommand{\cardano}{\href{https://www.cardano.org/en/home/}{Cardano}\xspace}
\newcommand{\ethereum}{\href{https://www.ethereum.org/}{Ethereum}\xspace}
\newcommand{\ipfs}{\href{https://ipfs.io/}{IPFS}\xspace}
\newcommand{\ipfsn}[1]{\href{https://ipfs.io/}{#1}\xspace}
\newcommand{\kref}[1]{\href{#1}{#1}\xspace}

% Document property commands
\newcommand{\kversion}[1]{\def \version {#1}}
\newcommand{\kwebsite}[1]{\def \website {#1}}
\newcommand{\kdate}[1]{\def \datedisp {#1}}

\newcommand{\kauthor}[2]{
	\href{mailto:#2}{#1}\footnote{\xspace\href{mailto:#2}{#2}}
}

\newcommand{\kcredits}{
	\vspace{\fill}
	\centerline{\includegraphics[scale=0.75]{cauldron-and-ghost}}
	\centerline{\textbf{Powered by} \LaTeX}
}

\newcommand{\kfootnote}[2]{
	\expandafter\newcommand\csname k#1\endcsname{\footnote{#2}\xspace}
}

\newcommand{\kbuilddoc}[3]{
	% Draws the table of contents.
	\ktoc

	\title{#1}
	\author{#2}
	\date{\datedisp \_\textemdash \version}
	\maketitle
	
	% Build abstract
	\begin{abstract}
		\textit{#3}
	\end{abstract}
}

% Debug command
\newcommand{\debug}{
	\usepackage{showframe}
	\hypersetup{
		colorlinks = true
	}
}